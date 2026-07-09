---
redirect_from:
  - /blog/opensource/2020/managing-licenses-for-an-open-source-project.html
layout: post
title: Management of open source licenses
categories: opensource
tags: 
- opensource 
- howto
- licenses
author:
  twitter: lucianghinda
description: How to use the licensed gem to manage licenses of nodejs packages and ruby gems. 
image: 
  path: /assets/images/cards/managing_licenses.png
  width: 2400
  height: 1200
---

I usually not read a licenses of packages I am using. 
I just click on the License file of a package I want to install, but I don't look further to its dependencies. 

Now that I am starting [an open-source project](https://ghinda.com/opensource/2020/start-open-source-project.html) and learning about various open-source licenses, I am more aware of the implications of licenses included in a project.

This is how I discovered the fantastic gem named [Licensed](https://github.com/github/licensed). 

As my project is developed in Ruby on Rails this gem satisfies my needs as it has support for Rubygems and NPM packages. 

Here is how Licensed can be used in a Ruby on Rails project to manage licenses

## Choose allowed licenses

The first step is to choose what type of licenses do you want to have in your project. This decision should be made after you choose a license for your own project. Because not all licenses can be combined between them, their combination will sometimes impose some behaviors on your project. 

In the end, you should have a list of licenses that you are ok with, including in your project.

## Install the licensed gem

In case you have Ruby installed in your system, then this is as simple as:
```
gem install licensed
```
[Here](https://github.com/github/licensed#installation) are the full instructions provided by Licensed gem to install it.

## Create a .licensed.yml file

Next, you should create a ```.licensed.yml``` file in your root directory. 
The possible settings that can be set in this file are described [here](https://github.com/github/licensed/blob/master/docs/configuration.md).

The most critical parts for now are:
1. Defining sources
2. Defining allowed licenses

Here is how the file looks for me:

```
sources:
 bundler: true
 npm: true

allowed:
 - mit
 - apache-2.0
 - bsd-2-clause
 - bsd-3-clause
 - isc
 - cc0-1.0
```

This is a standard configuration that I recommend for a standard Ruby on Rails project based on non-left copy licenses. All these licenses allows anyone to do almost anything with your project with the only restriction being that they must mention the creator. I wrote an extensive guide about MIT, Apache 2.0 and BSD [here](https://ghinda.com/opensource/2020/open-source-licenses-apache-mit-bsd.html) 

You can check now what kind of dependencies your project has by using: 

```
licensed list
```

This will list all your dependencies. 

## Cache dependencies and metadata
The next step is to cache all dependencies and their license metadata in a file.
Licensed needs this, and you also need this to keep track when a package changes license.

To generate the cache simply execute:
```
licensed cache
```
This will create a directory ```.licenses/``` and you will find there a tree structure of directory and files matching your source and dependencies. 

I committed this entire directory to Git to have version control. 

## Verify licenses against an allowed list

To verify if licenses of dependencies are in the allowed list execute:
```
licensed status
```
This will check licenses and display a list of licenses which need review. 

## Review licenses

Next step, you should open each .yml files pointed by the status command and check the licenses there.

I found three cases: 

1. Truly a package has a license that is not compatible with what I have in my allowed list. In this case, I tried to replace the package. This is the actual case why you should use this gem. To find this kind of package and then decide if you want to change your license (or allowed licenses) to include this package or find alternatives, maybe including implementing the functionality yourself. 

2. A package has one of the allowed licenses by their license file has some non-significant diffs, like extra lines, or formatting. In this case, you should open the configuration file ```.licenses.yml``` and add a section names ```reviewed where you would put the path until the package in .yml format. 

Here is an example: 
```
reviewed:
    bundler: 
     - activerecord # MIT License
      - concurrent-ruby # MIT License
      - puma # BSD 3 clause
      - rexml # BSD 2 clause
      - sqlite3 # BSD 3 clause as specified here https://github.com/sparklemotion/sqlite3-ruby/blob/master/sqlite3.gemspec
```

As you can see [here](https://github.com/rails/rails/blob/master/activerecord/MIT-LICENSE) actually, the license of ActiveRecord is MIT License, but the gem was not able to identify it as such. If you look at [SPDX MIT license](https://spdx.org/licenses/MIT.html) and [ActiveRecord license file](https://github.com/rails/rails/blob/master/activerecord/MIT-LICENSE) you will see that AR license has an extra line about ```Arel originally copyright ``` and this is why this gem was not able to identify it correctly. 

{:start="3"}
3. Another case is that you will discover a new type of license that you did not think before. In this case, you should read it and then decide if you want to add it in the allowed list of not.

## Rerun licensed status

Whenever you change something in the .licensed.yml config file or add/remove a package, you should rerun 
```
licenses status
```

## CI Github configuration

I wanted to make sure that the license check will happen every time someone will push something upstream, so I created a workflow on Github with the following content: 

<script src="https://gist.github.com/lucianghinda/ec2681838dd64886fc525afbcf0e07ff.js"></script>

This will run the licenses status command and report if it will detect any license which is not allowed. 

## Final words

Here is the full [.licensed.yml file](https://gist.github.com/lucianghinda/e1bc1422d3eb233ccc85a649368dd182):

<script src="https://gist.github.com/lucianghinda/e1bc1422d3eb233ccc85a649368dd182.js"></script>

Also, find the example of the Verify Licenses Github Actions workflow [here](https://gist.github.com/lucianghinda/ec2681838dd64886fc525afbcf0e07ff). 


