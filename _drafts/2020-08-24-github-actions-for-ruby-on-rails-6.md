---
layout: post
title: Minimal setup for Github Continous Integeration Actions for a Ruby on Rails Project
categories: opensource
tags: 
- opensource 
- howto
- licenses
author:
  twitter: lucianghinda
description: How to use the licensed gem to manage licenses of nodejs packages and ruby gems. 
image: 
  path: /assets/images/cards/how-to-setup-github-ci-actions-for-ruby-on-rails.png
  width: 2400
  height: 1200
---

For a good quality of project I think there are 4 areas to focus when setting up a project on a version control: 
1. Static Analysis
2. Running tests
3. Verifying licenses for used packaged
4. Pushing code to various environments

In this article I will focus on the first 3, because for the 4th one it really depends where do you want to release the code, what kind of hosting are you choosing (eg for Rails: Heroku, Google Cloud, Amazon Web Services or a Digital Ocean Droplet?). 


# Add required gems

First, before going into configuring each stage of the CI, I need to add the gems that I will use for each stage. 

To do this, I will open `Gemfile` and create some groups for the gems that I plan to use: 

```ruby
# other included gems ...

group :licensed do
  gem "licensed"
end

group :static_analysis do
  gem "rubocop", ">= 0.47", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "brakeman"
end

group :security_analysis do
  gem "brakeman"
  gem "bundler_audit"
end

# other included gems ...
```
You can find here a sample of how my entire `Gemfile` looks like. 

After adding these gems, I simple run `bundle install` to install required gems locally on my machine. 


# Static Analysis

The purpose of static analysis - as part of a CI pipeline - is to make sure that the code that gets pushed to the central repository has a minimum level of code quality. 

For code quality I focus on two basic directions: 
* adhering to coding guidelines
* running security checks


For the first point _adhering to coding guidelines_ I am usually using Rubocop as the main static analysor. 

For the second one _security checks_ I am using Brakeman as the static analysor together with BundlerAudit to check if included gems have any security patches and should be updated. 




