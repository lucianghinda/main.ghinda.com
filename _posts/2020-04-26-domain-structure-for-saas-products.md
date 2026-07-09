---
redirect_from:
  - /blog/products/2020/domain-structure-for-saas-products.html
layout: post
title: Domain structure for SaaS products
categories: products
tags: 
- products 
- decisions
- domains
- subdomains
author:
  twitter: lucianghinda
description: When creating a SaaS product what kind of web application architecture (subdomain vs. pathname) you choose for main website, product app and blog. 
image: 
  path: /assets/images/articles/domain-structure.png
  width: 2054
  height: 856
---



While being involved in a couple of side-projects in the last months, all of the SaaS products, I had to discuss and choose the domain architecture. 

![Domain structure for SaaS Products]({{ "//assets/images/articles/domain-structure-full.png" | absolute_url }}){:.full-width-img}

First, let me introduce some concepts:

* Marketing website is the main website of the SaaS product dedicated mostly for attracting new customers. It is dedicated to convincing visitors to become customers, to tell a story about the product, to present showcases.
* product app (or SaaS app) is the actual product that is used by customers (logged in users). 

When I say domain architecture, I am referring to the following choices:

1. **Should the marketing website be part of the same codebase as the product app, or should these two sites live in different codebases having their independent release cycles?**

2. **Should the domain structure for the marketing website and product app be based on subdomains (like example.com and app.example.com) or based on pathnames (like example.com and example.com/app)?**

There is another question in case you want to offer to your customers an URL a slug (a namespace) when using your product app:

{:start="3"}
3. **Should you offer the slug as a subdomain (like organisatio-namespace.example.com) or as a part of the pathname  (like example.com/organisation-namespace)?** 

Bonus question: 

{:start="4"}
4. **Should the blog be on a subdomain (like blog.example.com) or as a subfolder (like example.com/blog)?**

## My recommendations

Here are my answers to these questions: 

1. Use separate codebases for the product app and marketing website. Also, deploy them on separate machines. This results in less downtime when releasing them, almost no common bugs, and allowing different experiments on each one of them without the fear of affecting customers. Don’t use this when you want to display in your marketing websites live data from the product app. 

2. Use a subdomain structure for the separation between the marketing website and product app. This creates greater flexibility in how you generate routes for both of them (due to domain separation),  it allows you to configure CDN or separate traffic between them easily. You get a small security bonus when using per-domain settings. 

3. Use organization slug as a pathname, not as a subdomain. It makes the use of SSL much easier, and you have less work to do to set up organization accounts. For this, you lose the ease to route your customers to different machines based on their URLs, and it pollutes your sitemap. You need to be careful when adding routes to your marketing website not to use any customer slug. 

4. For this last question, the current recommendation is still to use a subfolder for your blog. 

You can read more about why I recommend these at the end of this article. 

---

Let’s go and explore the advantages and disadvantages of each strategy. 

I explore what kind of recommendations I found at the first search and then try to give my own arguments for this. 

## Review of (some) existing recommendations 

*1. IndieHackers Discussion*

[Here](https://www.indiehackers.com/forum/questions-for-saas-founders-0519d4f95e) is an interesting discussion about organizing the domain structure of a SaaS. This discussion is mainly referring to how to organize the main website (marketing website) with 

In that thread there are proposed 2 solutions: 

A. Main website on example.com and SaaS product at subdomain.example.com like: 
* Main website or marketing website at ```https://example.com```
* SaaS app living at subdomain.example.com, with the following examples: 
    * ```app.example.com```
    * ```dashboard.example.com``` 
    * ```admin.example.com``` 
    * ```my.example.com```

B. Main website at example.com and SaaS product living at example.com/folder  like:
* Admin at ```example.com/admin```
* App at ```example.com/dashboard```
* Blog at ```example.com/blog```
* API at ```example.com/api```

The main reasons for going for subdomain structure (option A):

a. SEO concern: when the SEO is important only for the marketing website and when the SaaS product itself, it is not part of the SEO strategy and should not be indexed.

b. It is easy to segment the traffic in case of heavy load and assure some kind of QoS

c. It is easy to setup Cloudflare or CDN when traffic increases when a subdomain structure

d. It is easy to setup difference services like example.com to [Netlify](https://www.netlify.com/), app.example.com to [Heroku](https://www.heroku.com/) and blog.example.com to [Write.as](https://write.as/pro) for example.

d. Improved security by separation of concerns, even it is not clear there is the security is better only because of the subdomain structure, or it is a side effect of hosting them on difference resources

The main reason for choosing the folder structure (option B):
1. When there is a need to share data between the SaaS product and marketing website for SEO  (like the number of users who applied so far …)
2. Keeping everything in the same codebase facilitates code reuse thus increasing productivity
3. Speed of development and fewer ops needed to maintain the infrastructure

*2. Clubhouse article about using a single subdomain*

[Here](https://clubhouse.io/blog/building-a-saas-app-you-should-probably-stick-to-a-single-subdomain-455695e1d03c/) is the article from Clubhouse written by Andrew Childs, Chief Design Officer and Co-founder of Clubhouse. 

Here is a quote from that article explaining their recommendation: 
> If you’re building a SaaS app that has any third-party OAuth integrations, or your product allows a user to switch between multiple organizations, you should put the organization in the pathname and use a single subdomain (like “app”) for your application.

Key takeaways from the article:
1. Having the organization slug  in the pathname makes it easier to switch organizations and to work with different URLs in dev/staging and production
2. It is easier to whitelist the domain in case you are working with OAuth providers (as you only need to whitelist a single domain). In this case, you don’t need to rely on third-party providers to support wildcard domains. 
3. It allows us to get an Extended Validation SSL certificate as these are not assigned to wildcard domains.

*3. Winderwind - How to select a future-proof subdomain structure*

Source of the article is [here](https://winterwindsoftware.com/how-to-select-a-future-proof-subdomain-structure-for-saas-web-app/)

The article recommends the following structure: 
1.  The marketing website should be on the main domain and separated from the product app
2.  The product app should live on its own subdomain. Here are some suggestions from the article:
    a. _dashboard_ – Used by  [Stripe](https://stripe.com/) 
    b. _manage_ – Used by  [GoCardless](https://gocardless.com/) 
    c. _portal_ – This is what I use for  [Autochart](https://autochart.io/) 
    d. _my_ – Used by  [Xero](https://www.xero.com/) 
    e. _account_ – Used by  [Postmark](https://postmarkapp.com/) 
    f. _secure_ – Used by  [HelpScout](https://helpscout.net/) 
3. Keep the marketing site and the blog on the same domain
4. Keep the API on the same subdomain as the product app

Reasons for separating the marketing website and product app from the article are:
1. It makes it easy to work with non-technical people on the marketing website and minimizes downtime when upgrading them
2. It allows using static CDN for the marketing website


## Arguments for my recommendations
### Use separate codebases for product app and marketing website

#### Reasons for separate codebase 

Even if you are a single owner of your project, it makes sense to have this split between codebases because it will first and foremost make sure bugs don’t leak between these two components. Imagine a bug in your CSS/JS flow while trying to fix something on the marketing website that might impact your customers who are using your product app. It makes the testing easier because you can have different test coverage and test thoroughness, allowing you, for example, to say that the marketing website should only pass several N positive scenarios without being concerned with negative scenarios. 

The second biggest advantage is having different release schedules between them. You can play more easily with the marketing website (A / B testing, testing copywrite, SEO tags) and release them as often as you like without any (let’s say this again without any) concern for a possible effect of your existing customers of the product app. It decreases downtime for users of the product app. You don’t need to restart product app services each time you want to add/change/remove a text from the marketing website.

The third advantage is related to the ability to use different frameworks and languages for marketing website than for the product app, thus allowing you also to use different hosting services if you like without having to create a complicated release process. You can decide to make your marketing website a static website generated by Jekyll or Middleman or Ghost and then release it to Netlify while using Ruby or Python or Elixir for your product app and host them on AWS or Heroku or Digital Ocean. 

#### Concerns against

First, DO NOT DO separate codebases if you plan to show live data (or as fresh as possible) in your marketing website from your product app (like the number of accounts created so far …). In this case, you need to create and maintain an API server and client with maybe authentication or at least a security layer, and there is no need for this. 

The biggest concern is related to the branding synchronization among the two projects. You need to have consistent branding (using the same colors, fonts, sizes, elements). This impairs your speed when changing these attributes. For this, there is no quick fix. 
What can be done is creating a separate project where you maintain your CSS and JS, maybe also some HTML components, and then use two in your two projects. Of course, this comes with extra maintenance overhead. 

The second concern is the overhead needed to maintain two codebases and their release scripts. There is, in the beginning, a small overhead to setup CI/CD for both projects with most of the time spent into creating the automated testing environment. 

The third concern is code reuse, especially if you are using the same framework, programming language for both of them. In this case, there is really a development speed loss due to either duplicating the code between the two projects, either extracting the common code into a third component. 

### Use subdomain structure for the separation between marketing website and product app.

#### Reasons for subdomain use

The first reason for subdomain use is the flexibility to experiment with your SEO and the separation between your product app routes and marketing website routes. Here are some examples: 

* There is no need to make sure that a page URL on the marketing website is not affecting a customer or a product app route
* The same for making sure that you maintain a list of keywords of what kind of URL’s should not be created in the product app

Of course, you can do these kinds of things programmatically, but why invest your time into building this when you can just publish your app on a subdomain and focus your time on the value you want to bring to your customers. 

The second reason is that it is very easy to use different services (hosting providers, machines) for a marketing website than for your product app. Here is one example: it takes a couple of minutes to add Cloudflare to your marketing website without any concern about how this might affect your product app. 

The third reason is that this configuration enables you to scale your resources based on the needs of each project, thus allowing probably to save money or at least to choose what fits best. This works best if you have separated codebases and make your marketing website static. Scaling static websites using services like Netlify or Cloudflare is a breeze and cheap. 

The fourth reason is related to security. When having a separation based on domains, you can add different security rules to your web servers for the two components, thus having a bigger protected surface. 

#### Reasons against 

The most important reason is that all of the advantages described above can be achieved by using the pathname/subfolder configuration. Here my answer is that even if they can be achieved, some of them require some amount of work to make them happen: you can use different services for example.com and example.com/app, but it is easy to do this from DNS than setting up a redirect to different IPs by using either an HTTP redirect from the application server or doing it from HTTP servers. Probably there are also other methods to achieve that, but my point is: you increase your ops work (initial configuration, maintenance) when everything can be done much easier by using a subdomain. Also, take into browser cache invalidation in case you want to change your hosting IP / provider, which can be easily done using DNS. 

Another important reason against this is the case when you want to show some dynamic content on the marketing website for logged in product app users. 

### Use organization slug as pathname not as a subdomain.

#### Reasons for using pathname

First, it makes your local development and testing environment quick to setup. There are solutions for local subdomains, but again this adds extra maintenance work, thus defocusing you from working on the product itself. Also, setting up testing is harder. 

Second, it is easier to whitelist your domain when using third-party services (like OAuth providers). 

#### Concerns against using the pathname

One major concern is that it is hard to do scale strategies based on specific customers (like redirecting traffic for a customer to a specific server). It can also be done based on pathname, but for example, you cannot use DNS for this. 

Another one is related to making it harder to have scaling strategies for specific customers like routing a customer to a specific machine. It can be done with the slug in the pathname, but it is harder to implement them. 

### Use /blog for your blog

Here I have a few things to contribute because there is a lot of information on the internet about this topic (and a lot of debates too).
One of the most known SEO websites recommends using subfolders (see [Subdomains vs. Subfolders, Rel Canonical vs. 301, and How to Structure Links for SEO - Moz](https://moz.com/blog/subdomains-vs-subfolders-rel-canonical-vs-301-how-to-structure-links-optimally-for-seo-whiteboard-friday)) even if Google stated that they treat them almost the same (see [Google On How They Treat Subdomains vs. Subdirectories In 2016](https://www.seroundtable.com/google-treat-subdomains-vs-subdirectories-22485.html)).  

The main reason for keeping this recommendation can be found in the following quote from [SEO Best Practices: Subdomain vs. Subdirectory SEO Strategy](https://blog.cloudflare.com/subdomains-vs-subdirectories-best-practices-workers-part-1/): 
> The lesson here is that keywords are diluted across subdomains.  Each additional subdomain decreases the likelihood that any particular domain ranks in a given search.  A high ranking subdomain does not imply your root domain ranks well.

I recommend using subfolders for any other website that you want to attach to your main website when SEO is important can be improved by the keywords use on that website. For example, if you want to publish documentation, then maybe you should use /doc like example.com/doc. 

## Extras

One interesting example I found is [Gitlab.com](https://gitlab.com). They are redirecting not authenticated users to [https://about.gitlab.com](https://about.gitlab.com) and authenticated users to the main website gitlab.com. 

It is interesting because they are doing a separation between the product app and marketing website by subdomain but they are using the main domain name (gitlab.com) for the product app and a subdomain for the marketing website. 

I am not sure what are the SEO effects, but I like the pespective that the product is on the main domain suggesting somehow that the product is the central point.  








