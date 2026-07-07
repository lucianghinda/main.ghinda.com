---
layout: post
title: How to setup Gitlab CI for Ruby on Rails and deploy to Heroku
categories: tech
tags: 
- rubyonrails 
- continousintegration
- continousdelivery
- heroku 
- gitlab 
- gitlabci
author:
  twitter: lucianghinda
description: Step by step guide to create a Gitlab CI for Ruby on Rails project to execute testing and if successful to release to production
---

Here is a step by step guide to setup Gitlab CI for a Ruby on Rails projects with the following objectives:
1. Execute Integration Tests
2. Execute System Tests
3. If both tests are successful release to staging
4. If both tests are successful release to production
5. Staging and production are on Heroku

Some code that you will find below is heavly inspired from the following tutorials: 
1. https://dev.to/zimski/the-complete-guide-to-setup-a-cicd-for-rails-5-on-gitlab-2f2d
2. https://medium.com/weareevermore/set-up-gitlab-ci-for-rails-applications-cf0117128bce
3. https://medium.com/conspectushub/release-container-to-heroku-with-gitlab-ci-8804d35e6d56
4. https://www.neotericdesign.com/articles/2018/04/running-your-rails-test-suite-with-dockerized-selenium-on-gitlab-ci/



# First, lets make the release to heroku

I think the easiest step is to make all the configurations necessary to automatically release master to production and staging branch to staging on heroku. 

## Step 1: Generate API Key on Heroku

You need to go to Heroku -> Login -> Choose Account Settings where you will find an option to ```Regenerate API Key ...``` or ```Reveal```. In case you are using the key for Heroku for other apps just use Reveal. 

![Heroku API key]({{ "/assets/images/articles/gitlabci-and-heroku/heroku-api-key.png" | absolute_url }}){:.full-width-img}

## Step 2: Add variables to your CI/CD variables 

For this you should go to your Gitlab account and inside your respository you will find under Settings -> CI/CD a section about variables. 

![Gitlab CI variables]({{ "/assets/images/articles/gitlabci-and-heroku/gitlab-ci-variables.png" | absolute_url }}){:.full-width-img}


There add the following variables:

- ```HEROKU_API_KEY``` where you should put the key from Heroku
- ```HEROKU_APP_PRODUCTION``` where you should put the app name for your production Heroku app (you can find it in Heroku under the Settings tab of you app)
- ```HEROKU_APP_STAGING``` where you should put the app name for your staging Heroku app


### Step 3: Add .gitlab-ci.yml file to your project

Add a file named ```.gitlab-ci.yml``` in the root of your Gitlab project with the following content: 

```
image: node:latest

before_script:
    - apt-get update -qy
    - apt-get install -y ruby-dev
    - gem install dpl

stages:
    - staging
    - production

staging:
    type: deploy
    stage: staging
    image: ruby:latest
    script:
        - dpl --provider=heroku --app=$HEROKU_APP_STAGING --api-key=$HEROKU_API_KEY
    only:
        - staging

production:
    type: deploy
    stage: production
    image: ruby:latest
    script:
        - dpl --provider=heroku --app=$HEROKU_APP_PRODUCTION --api-key=$HEROKU_API_KEY
    only:
        - master
```

One single thing to keep in mind:
```
staging:
    ...
    only: 
        - staging
```

the string under _only_ is the name of the branch used to deploy on heroku.

In case you are using corresponding environment settings in your Rails application then you should also go to Heroku an set ```RAILS_ENV``` to name of the environment you want to load. This is because just specifying the branch does loat the appropiate Rails environment automatically. 


# Running Rails tests on Gitlab CI with docker

So far you should have a automated deployment to your staging and production apps on Heroku. Once you hit ```git push origin master``` and ```git push origin staging``` (for the staging app) then after the commit to Gitlab the code will go directly to the Heroku machines. 

I think you might want more. CI/CD is not about automatically pushing to some remote environments. This can be done with a lot of other tools which in many cases are simpler to use. 

Now let's go more full on CI/CD configuration. 

The purpose here is to executed testing before pushing to staging and production and make the release only when all tests are passed. 


## Docker Container image

First we will need an environment where to run the tests configured to support running our tests (loading the Rails app for this) and also to push to production if all tests are passed. 

First you will need a docker image which should include:
1. Ruby
2. Heroku CLI - needed by DPL
3. Chromium - to support system testing
4. Chromium-chromedriver - to support system testing
5. DPL package to release to Heroku - for easy release to Heroku
6. Bundler 2.1.4 - needed to load our Rails app
7. Other libraries - necessary to install all the above

We will also a need an environment where the database server is loaded. In this example I will assume a PostgreSQL database so I will use [PostgreSQL service provided by Gitlab](https://docs.gitlab.com/ee/ci/services/postgres.html).

Here is a simple process to achieve this:
1. Create a dockerfile to define how your container should be
2. Built it and push it to your gitlab repository
3. Create a .gitlab-ci.yml where we define 3 stages (build, test, deploy) and then write what commands should be executed inside the container for each stage


### Step 1. Create dockerfile

Here how the dockerfile looks like: 

```
# Filename: dockerfile
# Location root of your Gitlab project
```

```
# Using Ruby 2.7 based on alpine
FROM ruby:2.7-alpine

RUN apk add --no-cache --update build-base
RUN apk add --no-cache \
      curl \ 
      yarn \ 
      nodejs \ 
      postgresql \
      postgresql-contrib \
      libpq \
      cmake \
      build-base \
      unzip \
      postgresql-client \
      bash \
      postgresql-dev \
      git

# Install Chrome
RUN apk add --no-cache chromium

# Install chromedriver
RUN apk add --no-cache chromium-chromedriver

# Install heroku-cli
RUn curl https://cli-assets.heroku.com/install.sh | sh

# Install dpl and heroku-cli
RUN gem install dpl

RUN gem install bundler:2.1.4
```

You can find the one I used here: [https://hub.docker.com/r/lucianghinda/rails-gitlab-ci](https://hub.docker.com/r/lucianghinda/rails-gitlab-ci).

### Step 2. Run docker build

After creating that file in your root directory, assuming you have Docker installed, you need to run the following flow of commands: 

Build your image: 

```
docker build .
```

After runing docker build you will see something like this at the end of the execution: 

```
Successfully built some_string_representing_image_id
```

Keep in mind (or copy somewhere that some_string_representing_image_id).

### Step 3. Tag your docker image

Now go to your project on Gitlab and choose "Packages & Registries" and choose "Container Registry". There you will find out the URL for your registry inside your project. 

It should be something like ```registry.gitlab.com/<group>/<project>``` if you project is part of a group or ```registry.gitlab.com/<username>/<project>``` if you created the project directly in your account. 

With this information go back to the console where you run the previous command - docker build - and execute: 

```
docker tag some_string_representing_image_id registry.gitlab.com/<group>/<project>/<container_name>:<version>
```

You can choose any name for your container_name and give any string (did not checked all the validation rules on Gitlab so please choose an alphanumeric string just to be safe) as a version. 

### Step 4. Push to Gitlab Repository

After you will need to login to Gitlab Registry and then execute ```docker push <registry url>``` 

```
docker login registry.gitlab.com
docker push registry.gitlab.com/<group>/<project>/<container_name>:<version>
```

This will send your container image to Gitlab container registry. It will take a while the upload. 

Now you are ready to create your new .gitlab-ci.yml


## Creating a new .gitlab-ci.yml

I will present this file step by step and you can find a link to it at the end. 

### Step 1: Set image and variables


```
# file: .gitlab-ci.yml

image: "registry.gitlab.com/<group>/<project>/<container_name>:<version>"

variables:
  LANG: en_US.UTF-8
  LANGUAGE: en_US.UTF-8
  LC_ALL: en_US.UTF-8
  TZ: Europe/Bucharest
  RUBYOPT: "-W:no-deprecated -W:no-experimental"
  RAILS_ENV: "test"
  POSTGRES_DB: test_db
  POSTGRES_USER: runner
  POSTGRES_PASSWORD: ""
  POSTGRES_HOST_AUTH_METHOD: trust
  SELENIUM_REMOTE_URL: "http://selenium__standalone-chrome:4444/wd/hub/"
  CI_EXECUTION: "true"

```

It is obvious that the first line it is setting the CI to use the Docker container image that you just pushed to Gitlab Registry. 

Then there are a couple of variables which I added just because sometimes they are needed while installing some gems or packages. I just add them default for all images. 

```
  LANG: en_US.UTF-8
  LANGUAGE: en_US.UTF-8
  LC_ALL: en_US.UTF-8
  TZ: Europe/Bucharest
```

Then there are a couple of them which are used by the Rails application: 

```
  RUBYOPT: "-W:no-deprecated -W:no-experimental"
  RAILS_ENV: "test"
```

RUBYOPT it is added here because when I look at the logs I don't want to see warnings about deprecated Ruby methods. 

Because we are using the PostgreSQL provided by Gitlab then we need to configure how our app will access it: 

```
  POSTGRES_DB: test_db
  POSTGRES_USER: runner
  POSTGRES_PASSWORD: ""
  POSTGRES_HOST_AUTH_METHOD: trust
```

Read more about how to configure PostgreSQL service on [Gitlab CI page](https://docs.gitlab.com/ee/ci/services/postgres.html).

The last two variables I added there are needed to make your Rails project run smooth locally without Docker and inside Gitlab CI: 

```
  SELENIUM_REMOTE_URL: "http://selenium__standalone-chrome:4444/wd/hub/"
  CI_EXECUTION: "true"
```

### Step 2: Change Rails to allow execution tests on CI

To make tests work on Gitlab Ci you will also need some changes in your Rails application. 

1. Open ```test/test_helper.rb``` and add there somewhere near the top of the file ```require 'socket'```

2. Open ```config/environments/test.rb``` and add there the following code

```
  if ENV.key?("CI_EXECUTION") && ENV["CI_EXECUTION"] == true
    net = Socket.ip_address_list.detect{ |addr| addr.ipv4_private? }
    config.domain = net.ip_address
    config.action_mailer.default_url_options = { :host => config.domain }
    Capybara.server_host = net.ip_address
  end
```

3. In case of using Minitest open your ```test/application_system_test_case.rb``` and replace your current driven_by configuration with something like this:

```
options = {
  desired_capabilities: {
    chromeOptions: {
      args: %w[headless disable-gpu disable-dev-shm-usage]
    }
  }
}

if ENV.key?("CI_EXECUTION") && ENV["CI_EXECUTION"] == true
  options[:url] = ENV['SELENIUM_REMOTE_URL'] if ENV['SELENIUM_REMOTE_URL']
  Capybara.server_port = 8200
end

driven_by(
  :selenium,
  using: :chrome,
  screen_size: [1400, 1400],
  options: options
)

```


### Step 3 Adding cache capabilities

Coming back to .gitlab-ci.yml let's add some caching capabilities:

```
# file: .gitlab-ci.yml

.default-cache: &default-cache
  cache:
    untracked: true
    key: CACHE-KEY-1.0
    paths:
      - node_modules/
      - vendor/
      - public/
```

This will cache contents of those folders and attach a cache key. Whenever you want them refresh you should change that key. 

Another option is to put the cache key in your Gitlab Variables with a name like ```CACHE_KEY``` and then change the code to look like: 

```
# file: .gitlab-ci.yml

.default-cache: &default-cache
  cache:
    untracked: true
    key: $CACHE_KEY
    paths:
      - node_modules/
      - vendor/
      - public/
```

But if you decide to do this then you will need to remember to change the CACHE_KEY content before pushing your code changes to gitlab so that when the CI jobs start executing they will take the new value and refresh the cache. I prefer to keep it in the .gitlab-ci.yml and commit changes to this file along with code change when I need a refresh (for example adding a new npm package). 

### Step 4: Adding Services and Stages

Then you will need to add to your .gitlab-ci.yml the following: 

```
# file: .gitlab-ci.yml

services:
  - postgres:latest

stages:
  - build
  - test
  - deploy
```

Actually if you are using the ```build, test, deploy``` stages there is no need to add them here because Gitlab CI will use them as default.
See for reference here https://docs.gitlab.com/ee/ci/yaml/#stages where they say: 

> If no stages are defined in .gitlab-ci.yml, then the build, test and deploy are allowed to be used as job’s stage by default

I like to have them in the file just to be aware of them whenever I read .gitlab-ci.yml


### Step 5: Build stage

Here I will define what is executed in build stage: 

```
# file: .gitlab-ci.yml

build:
  <<: *default-cache
  services:
    - postgres:latest
  stage: build
  script:
  - bundle install  --jobs $(nproc) --path=vendor
  - yarn install
  - cp config/database.gitlab.yml config/database.yml
  - bundle exec rake db:create db:schema:load
  - bundle exec rails assets:precompile
```

As you can see there is a need to have a database config yml which will be used during testing. Here is the content of that file: 

```
# file: database.gitlab.yml

test:
  adapter: postgresql
  encoding: unicode
  pool: 5
  timeout: 5000
  host: postgres
  username: runner
  password: ""
  database: test_db
```

For debugging purposes you could add to the beginning of the build script the following lines: 

```
script: 
  - ruby -v
  - node -v
  - yarn --version
  - which ruby
  ...
```

Just so that when looking at the job output you see what versions are there. 

### Step 6: Adding integration tests

Here is the part of the config file which will help executing the rails tests (with exception of system tests): 

```
# file: .gitlab-ci.yml

integration_test:
  <<: *default-cache
  stage: test
  services:
    - postgres:latest
  script:
    - bundle install  --jobs $(nproc) --path=vendor
    - cp config/database.gitlab.yml config/database.yml
    - bundle exec rake db:create db:schema:load
    - bundle exec rails assets:precompile
    - bundle exec rails test
```


### Step 7: Adding system testing

Rails does not execute the system tests when using ```rails test``` command. It is needed to execute a specific one ```rails test:system```. 

```
# file: .gitlab-ci.yml

system_test:
  <<: *default-cache
  stage: test
  services:
    - postgres:latest
    - selenium/standalone-chrome:latest
  script:
    - cp config/database.gitlab.yml config/database.yml
    - bundle install  --jobs $(nproc) --path=vendor
    - bundle exec rake db:create db:schema:load
    - bundle exec rails assets:precompile
    - bundle exec rails test:system
  artifacts:
    when: on_failure
    paths:
      - tmp/screenshots/
```

The new thing here is the presence of ```artifacts``` which is a command used to be able to make available in your Gitlab UI the folder ```tmp/screeshots```.
In case you want to tinker with it read the documentation about it here: [https://docs.gitlab.com/ee/ci/yaml/README.html#artifacts](https://docs.gitlab.com/ee/ci/yaml/README.html#artifacts).

### Step 8: Deployment 

The deployment part will contain the scripts executed to make the release to staging and production machines on Heroku. 

```
# file: .gitlab-ci.yml

deploy_staging:
  stage: deploy
  dependencies:
    - integration_test
    - system_test
  only:
    - staging
  script:
    - dpl --provider=heroku --app=$HEROKU_APP_STAGING --api-key=$HEROKU_API_KEY

deploy_production:
  stage: deploy
  dependencies:
    - integration_test
    - system_test
  only:
    - master
  when: manual
  script:
    - dpl --provider=heroku --app=$HEROKU_APP_PRODUCTION --api-key=$HEROKU_API_KEY
```

# Final words

In case you want to see the docker container image I created and use it yourself you can find it at [https://hub.docker.com/r/lucianghinda/rails-gitlab-ci](https://hub.docker.com/r/lucianghinda/rails-gitlab-ci).

Also all files I shared here can be found in this repository: [https://gitlab.com/lucianghinda/rails-6-gitlab-ci-deployment](https://gitlab.com/lucianghinda/rails-6-gitlab-ci-deployment)

PS: Yes, in the Gitlab repository the CI jobs are failing. That is because that is not an actual Rails project, but only a container for the files to see and browse. 
