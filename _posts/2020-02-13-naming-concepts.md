---
redirect_from:
  - /blog/shorts/2020/naming-concepts.html
layout: short
title: Simple rules for naming concepts while programming
categories: shorts
tags:
  - shorts
  - programming
  - naming
  - concepts
author:
  twitter: lucianghinda
description: Simple rules I created for naming concepts while implementing a software
---

‪I found early in my programming career that choosing a proper name for a concept is a hard.‬

Inspired by this [article](https://www.namingthings.co/naming-things-principles) I tried to write down some very simple guidelines I am using (based on my experience) when naming things. 

## While programming

Here are some rules I compiled to keep in mind while programming: 

1. Use names from the business domain of your software‬.
2. Use the same names that your stakeholders/users use‬
3. Use names which are easy to write and the probability of misspelling is low‬
4. It is better to use less known names than to redefine well-known names
5. It is hard to name hierarchies specially as the abstraction level is getting higher. Try to limit the depth of hierarchies. This will make your naming job easier. ‬
6. As much as possible, use names that represent what your code is doing. For example, when transforming data use verbs, when describing states use gerund form when the return is boolean name your methods like questions "is_", "has_", "can_", ... ‬
7. Do not name your concepts using keywords or concepts from programming language/framework even if the language allows this. Here is an example of what _not_ to choose: using "form", "input" for models. ‬

## While testing

The following rules should be applied only for system, system integration and acceptance testing levels. 
In case of component testing/unit testing or component integration testing you should follow the same rules as the ones for programming. 

1. Use names used in the UI not names used in the code (Example: in database the user account table is named "accounts" but in the interface it is named "user", then in your tests you should use "user").
2. Use descriptive names not short names.
3. Do not use the same names for hierarchies/abstractions as the code is using. Create names and hierarchies based on what the end-user is seeing or doing. 
4. While trying to name your abstractions or common code use names describing what that method is representing in an end-to-end flow (Example: name "steps_for_paying_with_creding_card" and not "steps_for_payment_option_1")
5. Name your users by their attributes or roles not by their name. (Example: "the_invalid_user", "john_with_errors", "admin_alice", not simply "john", "alice" ...). In general this rules should apply for any model not just to use the name/title but to add also what that model represents in your tests. 
6. In case you give titles to test cases, write a descriptive name explaining what the user is expecting to achieve if they would follow the flow described in the test case. 


