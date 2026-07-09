---
redirect_from:
  - /blog/programming/ruby/2021/learning-ruby.html
layout: post
title: A Guide to Learn Ruby in 2021 and 2022
categories: programming/ruby
tags: 
- programming 
- languages
- ruby
- learning
- howtolearn
- guide
author:
  twitter: lucianghinda
description: "Why you should choose Ruby, how to learn it and what does it mean to write beautiful code" 
image: 
  path: /assets/images/cards/learning-ruby.png
  width: 1024
  height: 512
---

I will assume that you don't know Ruby, and you are curious about this programming language.

Here is what you will find in this article:
- [What is Ruby?](#what-is-ruby)
- [Why learn Ruby programming language](#why-learn-ruby)
    + [What other people are saying about why learn Ruby](#what-other-please-are-saying)
- [What does it mean to write good Ruby code](#write-good-ruby-code)
- [Learning Ruby - where and how](#learning-ruby-where-and-how)
    + [If Ruby will be your first programming language](#learning-ruby-where-and-how)
    + [If you know how to code](#if-you-know-how-to-code)
        + [Learning Ruby basics](#learning-ruby-basics)
        + [Resources to deep understand Ruby](#deep-understand-ruby)
        + [Competitive Programming / Coding Challenges](#coding-challenges)


# What is Ruby?
{: #what-is-ruby }

Ruby is an interpreted, dynamic, dynamically typed, garbage-collected, high-level, objected-oriented, general-purpose, and open-source programming language. 

Let me explain these by one:

1 Ruby is **interpreted**: that means that Ruby does not compile to a binary, but it uses an interpreter to translate the code into machine code on the fly (without any intermediary step like compiling).

2 Ruby is **dynamic**, meaning that all static analysis needed to execute a program will happen at runtime. In this way, the type of variables can be changed while the code is running, adding new code and functionalities to existing already instantiated objects, and many more.

3 Ruby is **strongly typed**, meaning that if an operation needs a specific type, then the type variables/objects involved are checked before running that operation. Yet Ruby does not use static type checking: the interpreter does not enforce type constraint rules while evaluating a program. So it seems that it is correct to refer to ruby as being **dynamically typed**. 

Here is a short example: 

```ruby
var = 42
new_var = var + "string" 
# => TypeError (String can't be coerced into Integer)
```
The last line will throw a type error as Ruby will check the type of `var` and the type of `"string"` and see they are different and cannot be coerced.

4  Ruby is **garbage collected**, meaning there is no need for the programmer to manage memory. It has a garbage collector that knows when to free memory (when a variable/data is no longer needed and can be freed)

5 Ruby is a **high-level programming language** meaning that it is closer to the natural English language than to computer code, thus making the code easier to read and write. It also allows us to focus on high-level business logic and not on low-level tasks (like memory management, registers, call stacks).

6  Ruby is **object-oriented**, meaning that in Ruby, everything is an object. The most common way to program ruby is to do it in an Object-Oriented Programming (OOP) fashion by using classes, inheritance, compositions. Ruby also has some support for functional programming because it has its procs, and lambdas and allows passing functions as params to other functions, but doing it this way is less common in Ruby.

7  Ruby is **general-purpose**, meaning that you can write software in Ruby in many domains; there is no focus on supporting one domain over another.

8  Ruby is **open-source**, meaning that you can find the code for Ruby open and change it according to your own needs if you feel this way. Check the code for Ruby in one of the sources listed on the Ruby website:  [Ruby Core](https://www.ruby-lang.org/en/community/ruby-core/ "Ruby Core").

In case you want to read more about what type of programming language is Ruby go to the following resources: 
* [Official Ruby Language website](https://www.ruby-lang.org/en/)
* [Stack Overflow question if Ruby is a functional language](https://stackoverflow.com/questions/159797/is-ruby-a-functional-language)
* [An introduction about Ruby describing Ruby features](https://www.tutorialspoint.com/ruby/ruby_overview.htm)
* [Wikipedia about dynamic types languages](https://en.wikipedia.org/wiki/Type_system#DYNAMIC)
* [Wikipedia about Ruby](https://en.wikipedia.org/wiki/Ruby_(programming_language))
* [A good article explaining why Ruby is dynamic and strongly typed](http://www.rubyfleebie.com/2007/07/09/ruby-is-dynamically-and-strongly-typed/)
* [Stack Overflow question if Ruby if Strongly or Weakly Typed](https://stackoverflow.com/questions/520228/is-ruby-strongly-or-weakly-typed)

# Why learn Ruby programming language
{: #why-learn-ruby }

First, let's start with my reasons why I like this programming language: 
1. It is expressive: you can write code that will be easy to read and understand, and the language will support you with this
2. It is easy to think in Ruby, as it has a lot of ways to solve the same problem thus, it can match the way you think about a problem
3. Eco-system: it has a mature eco-system of plugins, most of them battle-tested in production, so there is no need to re-invent the wheel every time you need a solution to a common problem
4. Community: it has a great, passionate and active community of developers, and finding an answer to a problem you might have it is very easy

## What other people are saying about why learn Ruby
{: #what-other-please-are-saying }

I don't want to create a comprehensive list of why Ruby is a good programming language and why it might be an excellent decision to start using it. Still, in case you are looking for more, here is a list of articles and some concise summaries for each one of them: 

[Some People Say Ruby Is Too Complex for Beginners…](https://learn.onemonth.com/some-people-say-ruby-is-too-complex-for-beginners/) - An article by Chris Castiglione about why having multiple ways of doing the same thing is a good thing: it offers **flexibility**, it creates **space for the programmer to be creative**, and it does not have too many specifics to keep in mind when using language features.  

[A question on Dev.to](https://dev.to/cjbrooks12/why-do-people-like-ruby-374b) about _“Why do people like Ruby”_ has many answers. Here are some main reasons why people are saying there that they love Ruby:  
- **Flexibility** and **expressiveness** makes it easy to write code with very little boilerplate
- It **"optimises for brain to code time"** as it is easy to write the code almost as you think
- The **code can be read like talking**, and it is easy to understand it
- It is **fun**
- Has a **great community**
- You can be **incredibly productive**
- **Quick feedback and prototyping**
It will help if you read the answers there. You will also see the are some concerns and some arguments people have for those concerns. 

Here are two quotes that Yukihiro Matsumoto[^1] wrote in an essay called _“Treating Code as an Essay”_ part of a book called “Beautiful Code”[^2] which I think will describe how Ruby feels based on how its creator sees programming: 

**"...lines of code are meant—before all else—to be read and understood by human beings..."**

> “Programs share some attributes with essays. 
>
> For essays, the most important question readers ask is, "What is it about?" 
> 
> For programs, the main question is, "What does it do?" 
>
> In fact, the purpose should be sufficiently clear that neither question ever needs to be uttered. 
>
> Still, for both essays and computer code, it's always important to look at how each one is written. Even if the idea itself is good, it will be difficult to transmit to the desired audience if it is difficult to understand. The style in which they are written is just as important as their purpose. Both essays and lines of code are meant—before all else—to be read and understood by human beings.” 

**"...it is therefore more important by far for humans to be able to understand the program than it is for the computer..."**

> “Most programs are not write-once. 
> 
> They are reworked and rewritten again and again in their lives. Bugs must be debugged. Changing requirements and the need for increased functionality mean the program itself may be modified on an ongoing basis. 
> 
> During this process, human beings must be able to read and understand the original code; it is therefore more important by far for humans to be able to understand the program than it is for the computer.”

# What does it mean to write good Ruby code
{: #write-good-ruby-code }

One thing sticks out from all these resources about why people like Ruby: it allows writing "beautiful code". 

Here are some definitions for beautiful code: 
1. _Yukihiro Matsumoto_ (creator of Ruby programming language) is defining beautiful code in the “Treating Code as an Essay” having the following attributes:
- **Brevity**: writing concise and brief code "because there is a definite cost involved in scanning code with the human eye, programs should ideally contain no unnecessary information."
- **Familiarity**: Ruby uses traditional control structures and tries to be consistent and not surprise programmers in the way it works
- **Simplicity**: Ruby offers complex tools and shifts the complexity from the code written by the programmer to the programming language, thus allowing the creation of simple and beautiful code
- **Freedom from enforcement from tools**: Ruby does not force you to do to things in one specific way. It is flexible enough to allow you do to things your way, to serve your purpose
- **Balance** between the other attributes

2. _Russ Olsen_ in “Eloquent Ruby” defines Ruby style of programming as: 
- **Crystal Clear**: “good code tells the reader exactly what it is trying to do. Great code shouts its intent”
- **Concise**: “It’s much easier to understand what a method or a class is doing if you can take it all in at a glance”
- **Self-descriptive**: “Good Ruby code should speak for itself, and most of the time you should let it do its own talking.”

3. _Hal Fulton_ in “The Ruby Way” defines the Ruby way as: 
- **Simplicity**: even when doing complex things, the complexity should be pushed out of sight so that it appears simple
- **Brevity**: “don’t write 200 lines of code when ten will do” 
- **Readability**: remember that “computers exist for humans, not humans for computers”
- Following the **Principle of the Least Surprise**: “the program should always respond to the user in the way that astonishes him least” 
- **Consistency** and **Regularity**

Read more resources about what does idiomatic Ruby means here:
1. [Idiomatic Ruby: writing beautiful code](https://medium.com/the-renaissance-developer/idiomatic-ruby-1b5fa1445098) - an article with code example about writing intuitive ruby code
2. [Beautiful Ruby Code](https://github.com/dreamr/beautiful-ruby-code) - this is an example of a coding guideline for Ruby. Still, after learning a little bit of Ruby, I recommend installing one of these static analyzers: : [Rubocop](https://github.com/rubocop/rubocop) or [Standard](https://github.com/testdouble/standard "Standard"). 

# Learning Ruby - where and how
{: #learning-ruby-where-and-how }

I think there are multiple approaches to learning a programming language. I will try to recommend resources based on this, but please go ahead and skim through them however you find it useful or exciting for you.

## If Ruby is your first programming language?
{: #if-you-dont-know-how-to-code }

If you never did programming before starting learning Ruby (or any other programming language), I recommend understanding the basics of thinking: 

- [Learn To Program](https://pine.fm/LearnToProgram/chap_00.html "Learn to Program by Chris Pine") online book is a great tutorial to start learning to program. It is easy to follow, and it explains very well with simple examples of the programming concepts.
- [Ruby for Beginners](http://ruby-for-beginners.rubymonstas.org/index.html) a good tutorial for beginners, created so that at the end, "you'll be able to read, understand, and write basic Ruby code yourself".
- [Learning Ruby: From Zero to Hero](https://www.freecodecamp.org/news/learning-ruby-from-zero-to-hero-90ad4eecc82d "Learning Ruby: From Zero to Hero")  it is a good Ruby tutorial that can one can follow even if they don't know yet how to program.
- [Learning Ruby Tutorial](http://rubylearning.com/satishtalim/tutorial.html "Learning Ruby Tutorials")  this is again an excellent tutorial to start a learning program as it explains very good the basic programming concepts.

After going through the basic concepts of Ruby, the next step is to deepen your understanding of some of the core concepts:
- Object-Oriented Programming, for this I recommend going through [The Basics of OOP Ruby](https://medium.com/launch-school/the-basics-of-oop-ruby-26eaa97d2e98 "The Basics of OOP Ruby") and then through [this answer about how a class works on Stackoverflow](https://stackoverflow.com/questions/10525053/ruby-metaclass-confusion/10526013#10526013 "How class works in Ruby - Stackoverflow")
- Understanding the Ruby Object Model: here are a couple of resources [Understanding the Ruby object model](http://skilldrick.co.uk/2011/08/understanding-the-ruby-object-model/ "Understanding the Ruby object model") (an old article but the main ideas are still valid), [Everything is object in Ruby](https://medium.com/@pk60905/everything-is-object-in-ruby-559475ce71dd "Everything is object in Ruby") (an article building on the first one)
- Singleton Class (Eigenclass): [Explaining Ruby's Singleton Class (Eigenclass) to confused beginners](https://suchdevblog.com/lessons/ExplainingRubySingletonClass.html#what-s-the-eigenclass "Explaining Ruby Singleton Class (Eigenclass)"), [A gist with examples explaining Eigenclass](https://gist.github.com/rsliter/4216800 "Code example about Eigenclass")

After this, you should google Ruby meta-programming and read some of the resources you can find. 

## If you know how to code
{: #if-you-know-how-to-code }

### Learning Ruby basics
{: #learning-ruby-basics }

First, start by looking around on the official website at their documentation section: [https://www.ruby-lang.org/en/documentation/](https://www.ruby-lang.org/en/documentation/). There are many links for good tutorials for IDEs, Ruby's documentation, and more helpful information. 

If you already know to program in some other language, I think you can go through this short official Ruby tutorial: [Ruby in Twenty Minutes (ruby-lang.org)](https://www.ruby-lang.org/en/documentation/quickstart/). It covers almost anything that you need to know about Ruby syntax. 

If you already know one of the following programming languages: C/C++, Java,  Perl, PHP, Python here you will find some short guides explaining similarities and differences between Ruby and each one of these languages: [Ruby From Other Languages (ruby-lang.org)](https://www.ruby-lang.org/en/documentation/ruby-from-other-languages/). 

[Try Ruby in Browser (ruby-lang.org)](https://try.ruby-lang.org) - Learn Ruby by using this interactive play-ground. It is a very easy quick-start without the need to install anything on your own computer.

[Learn Ruby (codecademy.com)](https://www.codecademy.com/learn/learn-ruby) - a simple course teaching ruby basic structures in a very interactive way, offering at each step an interactive terminal for practice. 

[Pragmatic Programmers - Learn to Program (pine.fm)](https://pine.fm/LearnToProgram/chap_00.html) - this is an online book which will teach you programming concepts in Ruby. It is also a very great start to understand Ruby even if you already know programming. 

[Why’s (Poignant) Guide to Ruby (poignant.guide)](https://poignant.guide/book/) - a very unconventional introduction in Ruby. This book is a fresh and innovative take to teach someone Ruby and it also goes in its own way more into thinking like a Rubyist. 

[TutorialsPoint - Learn Ruby programming (tutorialspoint.com)](https://www.tutorialspoint.com/ruby/ruby_overview.htm) - this is a good, concise text based tutorial to learn Ruby. While not being exactly creates as an interactive first learning experience, for each piece of code has a link for a live demo of the code where you can tinker with it as you like. 

[RubyLearning (rubylearning.com)](http://rubylearning.com/satishtalim/tutorial.html) - while not an interactive tutorial like others, it has good examples of the structure and syntax of Ruby. 

[Introduction to Programming with Ruby (launchschool.com)](https://launchschool.com/books/ruby) an online book about Ruby syntax and standard library

[Video From freeCodeCamp.org about learning Ruby (youtube.com)](https://www.youtube.com/watch?v=t_ispmWmdjY) - is a 4 hours Ruby introduction video while building some small learning programs (like building a calculator, a guessing game)

[Ruby Tutorial with Code Samples (fincher.org)](https://www.fincher.org/tips/Languages/Ruby/) - a simple tutorial to learn Ruby.

This video course from Pragmatic Studio [https://pragmaticstudio.com/ruby](https://pragmaticstudio.com/ruby) seems very well organised and touches the most important topics for learning Ruby. 

[Beginning Ruby 3](https://www.apress.com/gp/book/9781484263235) is an introductory book for Ruby teaching the latest Ruby idioms. It also goes through everything needed to be productive in Ruby. 

[The Well-Grounded Rubyist](https://www.manning.com/books/the-well-grounded-rubyist-third-edition) is a very good book with examples and clear explanation about when and why to use various Ruby language features. 

[Ruby: The Big Picture](https://www.pluralsight.com/courses/ruby-big-picture) is an up to date guide to learn Ruby and it explores Ruby core features, objects, metaprogramming and Ruby ecosystem. 

Other type of resources which offer a short introduction to Ruby:
1. [Learning Ruby: From Zero to Hero](https://www.freecodecamp.org/news/learning-ruby-from-zero-to-hero-90ad4eecc82d/) - on freeCodeCamp, a long version article with a quick introduction to Ruby
2. [Unlearn Programming to Learn Ruby](https://medium.com/rubycademy/unlearn-programming-to-learn-ruby-b1cbc5e2fed) - an article more about how to think when solving a problem with Ruby

### Resources to deep understand Ruby
{: #deep-understand-ruby }

[RUBY KOANS](http://rubykoans.com) - it is a list of learning exercises where you need to fix a failed test to make it pass. While fixing it you will learn more about Ruby. 

[Ruby Specs](https://github.com/ruby/spec) - this is not an official documentation but I recommend you just go ahead and read some of the language specs here. It is very well written and can teach you a lot about how Ruby works. 

[An introduction to Object Oriented Programming in Ruby (freecodecamp.org)](https://www.freecodecamp.org/news/introduction-to-object-oriented-programming-with-ruby-d594e1c6eebe/) about OOP in Ruby. Check also this tutorial also on freeCodeCamp.org about [Object Oriented Programming in Ruby (freecodecamp.org)](https://www.freecodecamp.org/news/an-introduction-to-object-oriented-programming-with-ruby-73531e2b8ddc/). In general [freeCodeCamp.org](https://www.freecodecamp.org/news/tag/ruby/) is a very good place to learn more about Ruby.

[Ruby Oneliners](https://learnbyexample.github.io/learn_ruby_oneliners/cover.html) is a collection of practical one liners Ruby code to solve various day-to-day needs.

The Meta-programming Ruby book teaches you how to do meta-programming in Ruby [https://pragprog.com/titles/ppmetr2/metaprogramming-ruby-2/](https://pragprog.com/titles/ppmetr2/metaprogramming-ruby-2/)

[GoRails Ruby Lessons](https://gorails.com/episodes?q=Ruby) This is a great collection of many Ruby lessons exploring various pragmatic topics. I suggest to start with [HTTP Server in Ruby from Scratch](https://gorails.com/episodes/ruby-http-server-from-scratch?autoplay=1) where you will not only learn more Ruby but also explore some topics about how other Ruby HTTP servers work.

[Practical Object-Oriented Design, An Agile Primer Using Ruby (POODR)](https://www.poodr.com) A book that goes deeply into object oriented design and can teach you a lot about how to organise your code, what goes where when thinking about classes and modules. It also goes deepling into explaining composition and inheritance. 

### Competitive Programming / Coding Challenges
{: #coding-challenges }

The following list of app can be used mostly to learn or deepen your understanding of algorithms.

I recommend [Codewars.com](https://www.codewars.com/?language=ruby) which has a very good collection of problems to be solved in Ruby with their own code editor and will run automatic test suites to check your code. Codewars has a very good gamification where you can earn points by solving katas. 

[Hackerrank.com](https://www.hackerrank.com) has a section named “Skills Available for Practice” where you can choose Ruby and see a lot of problems that you can solve with Ruby. It has their own code editor and will check your solution by running a batch of tests on it. You can also have access to read other people solutions and see how you can make yours better. 

[Hackerearth.com](https://www.hackerearth.com) is another competitive programming or coding challenge platform. Also here you might find a Practice section where there is a mix between tutorials and problems to be solved. They have their own code editor and can run tests to check your solution. 

[Coderbyte.com](https://coderbyte.com/starter-course/learn-ruby-in-one-week) offers a course with all lessons free and some challenges (some of them are paid) to learn Ruby. Lessons are in video format and challenges have an in-browser code editor which can run a test suite to check your solution. 


Go back to ["Learn Ruby on Rails Guide"]({% post_url 2021-09-19-learning-ruby-on-rails %})


#### Notes: 

[^1]: [Yukihiro Matsumoto](https://en.wikipedia.org/wiki/Yukihiro_Matsumoto) is the creator of the Ruby programming language
[^2]: [Beautiful Code](https://www.oreilly.com/library/view/beautiful-code/9780596510046/) "In this unique and insightful book, leading computer scientists offer case studies that reveal how they found unusual, carefully designed solutions to high-profile projects. You will be able to look over the shoulder of major coding and design experts to see problems through their eyes" 