---
redirect_from:
  - /blog/opensource/2020/open-source-policy-examples-and-best-practices.html
layout: post
title: Open Source Policy - Examples and best practices
categories: opensource
tags: 
- innovation 
- creativity
- problem solving
- models
author:
  twitter: lucianghinda
description: "A recommendation of what an open source policy should include based on review of a couple of open source policies from companies like Gitlab, Buffer, Google and Joyent" 
toc: true
image: 
  path: /assets/images/articles/2020/06/open-source-policy-what-to-take-into-consideration-preview.png
  width: 3000
  height: 1242
---

_I am working with [METRO SYSTEMS](https://www.metrosystems.ro?ref=ghindacom) to open-source one of the applications we created for our innovation projects. Part of this process I started looking at what open source policies different companies have, and I am sharing my findings here._

---

This article is not a comprehensive review of open-source policies. I picked up companies based on a list from the [TODO Group](https://todogroup.org). This is a short review of some open-source policies where companies are encouraging their employees to open source their work or contribute to open source projects. 

Here is what you will find in this article:
- [A summary of what to include in an open source policy](#summary)
- [Buffer Open Source Policy](#buffer-open-source-policy)
    + [About Buffer](#about-buffer)
    + [Questions about open source](#talking-about-real-questions-or-dilemmas)
    + [Frequent Asked Questions](#what-should-be-in-an-open-source-policy---faq)
- [Open Source at Gitlab](#open-source-at-gitlab)
    + [Gitlab values and open-source](#about-gitlab)
    + [Open sourcing a project](#open-sourcing-a-project)
    + [Contributing to open source](#contributing-to-open-source)
    + [Using open-source libraries](#using-open-source-libraries)
    + [Proprietary Information and Assignment Agreement](#proprietary-information-and-assignment-agreement)
- [Joyent - open source policy](#joyent-open-source-policy)
    + [About Joyent](#about-joyent)
    + [Open Source Counsel Office](#open-source-counsel-office)
    + [Licenses](#licenses)
    + [How to contribute](#how-to-contribute)
    + [Creating an open-source](#creating-an-open-source)
- [Google Open Source Policy](#google-open-source-policy)
    + [About open-source at Google](#about-open-source-at-google)
    + [Releasing code](#releasing-code-as-open-source)
    + [Contributing to open-source](#contributing-to-open-source-1)
    + [Personal projects](#personal-projects)
    + [Participating to Hackathons](#participating-to-hackathons)
    + [Using open-source](#using-open-source-projects)
    + [Growing an open-source ecosystem](#growing-an-open-source-ecosystem)
- [How Dropbox uses CLA](#how-dropbox-uses-cla)
- [Why Gitlab transitioned from CLA to DCO](#why-gitlab-transitioned-from-cla-to-dco)
- [More resources to read](#resources)

# Summary

It seems like a well-done open-source policy should address at least 3 areas:
- **Creating** a new open-source software
- **Using** open-source software in a proprietary software
- **Contributing** to open-source as an employee of a company


![Open Source Policy - Topics to include]({{ "/assets/images/articles/2020/06/open-source-policy-what-to-take-into-consideration.png" | absolute_url }}){:.full-width-img}

When discussing **creating open-source software** (or releasing code as open-source) some points to take into consideration are:

1. What type of licenses to use?
2. Where will the code be released?
3. Usually, there is a flow of steps to be checked before releasing:
    - Reviews (security, privacy)
    - Legal approvals
    - Communication
4. How to structure the code
    - The best option here is to create a boilerplate/template for a project including Code of Conduct, Governance, Readme and How to contribute
5. A kind of support group/person who can guide and answer questions a developer has regarding their open source project
6. Who owns the IP for the created software

When talking about **using open-source software** inside projects, some points to take into consideration are: 
1. What kind of licenses does the open-source have?
    - Implications of using permissive vs. copyleft licenses for the copyright of the current projects
    - Liability
2. Requirements implied by the open-source license
3. Management of third-party software (upgrade, patching, bug fixing)
4. Security reviews

When talking about **contributing to open-source**, some essential points to take into consideration are:
1. What kind of license the open-source project has?
2. How does the contribution involve the current company?
3. Attribution - make it clear who is the contributor to the employee of the company?
4. Who owns the IP of the contribution if there is any?

It is also essential to address three more things about creating an open-source: 
1. _Community_ - how would you take care of a community of users or contributors. Nobody is saying you should have a strategy for this, but it sure helps if you care about your community and help others use your creation
2. _Tools_ - It is easier to have guidelines about what kind of tools to use when creating open-source. I don't think this list should be prescriptive, but it should be a suggestion.
3. _Public Common Repository_ - usually, companies have not only a handler on Github or Gitlab or any other version control repository but also a public page on their websites (sometimes a subdomain like opensource.companywebsite). 

It is important to take into consideration that you are writing this policy as a guide for an employee of your company. In this case, then the policy can be written from the perspective of the developer and should address possible questions, blockages the individual has. It could be like answering "How to" questions. 

The length of the policy could influence how easy people start creating or contributing to open source. A lengthy policy might be putting off people to start open source because it makes the process look hard. A concise one might not address big questions and thus creating uncertainty. 

Below you can find simple reviews of some examples of open source policies. 
They are from companies part of [TODO Group](https://todogroup.org/about/) (Talk Openly, Develop Openly). 



--- 

# Example of open source policies from different companies

## Buffer Open Source Policy

### About Buffer
{: #about-buffer }

From their website [https://buffer.com](https://buffer.com):

> We're a fully distributed team of 85 people living and working in 15 countries around the world. And we're working to build the best products to help our customers build their brands and grow their businesses on social media.

The list of their open-source projects is [https://buffer.com/open-source](https://buffer.com/open-source), the open-source policy is [https://open.buffer.com/guide-open-source](https://open.buffer.com/guide-open-source). 

### Talking about real questions or dilemmas

Possible reasons why employees are not thinking about open sourcing are around the following lines of thoughts: 

- I wasn't sure if I could open-source that.
- I wasn't sure if it was even safe to open source.
- I wasn't clear if it was okay to spend time doing that.
- I don't know what our "process" is for open-sourcing code, do we even have one?

More effort should be made to educate colleagues on how to open source their code. 

### What should be in an open-source policy - FAQ

Buffer open source policy is mostly a list of FAQ containing answers to the following questions ([click here](http://bufferapp.github.io/img/boss.png) to see it as an image):
1. What license do we release software under?
2. What can I open source?
3. What should I open source?
4. Can I spend time on open source? Is it part of our cycles? Can I spend time contributing back to other open-source projects?
5. How do I open source – what's it all look like end to end?
- Check if it is secure and does not contain sensitive data
- Notice the team that you want to open source
- Add Readme
- Make the repo on Github
- Celebrate
- Add the project to the open-source page
- Promote it
6. Any general tips?

---

## Open Source at Gitlab

### Gitlab values and open-source
{: #about-gitlab }

Gitlab is defining itself as a company dedicated to open source and encourage its employees to give back to the community, thus living their [Collaboration](https://about.gitlab.com/handbook/values/#collaboration) and [Transparency](https://about.gitlab.com/handbook/values/#transparency) values. 

Their public open source policy can be found in thier Handbook at [https://about.gitlab.com/handbook/engineering/open-source](https://about.gitlab.com/handbook/engineering/open-source/).

### Open sourcing a project

What should be taken into consideration when open sourcing a project:
1. Which license to use
2. Where to publish
3. Any approvals needed?
4. Readme:
- a. Code of conduct
- b. License
- c. How to contribute

### Contributing to open source

Contributing to a third party project tries to address: 
1. Contributor license agreement
2. Contributing to a project on Gitlab where they invite their employees to fork and then follow the project's Merge Request process
3. Contributing to a project on Github where they invite their employees to fork and then follow the project's Pull Request process

### Using open source libraries

What are the acceptable licenses:
1. [MIT License](https://choosealicense.com/licenses/mit/)
2. [GNU Lesser General Public License (GNU LGPL)](https://choosealicense.com/licenses/lgpl-3.0/)
3. [Apache 2.0 License](https://choosealicense.com/licenses/apache-2.0/)
4. [Ruby 1.8 License](https://github.com/ruby/ruby/blob/ruby_1_8_6/COPYING)
5. [Ruby 1.9 License](https://www.ruby-lang.org/en/about/license.txt)
6. [BSD 2-Clause License](https://opensource.org/licenses/BSD-2-Clause)
7. [BSD 3-Clause License](https://opensource.org/licenses/BSD-3-Clause)
8. [ISC License](https://opensource.org/licenses/ISC)
9. [Creative Commons Zero (CC0)](https://creativecommons.org/publicdomain/zero/1.0/)
10. [Unlicense](https://unlicense.org/)
11. [OWFa 1.0](http://www.openwebfoundation.org/legal/the-owf-1-0-agreements/owfa-1-0)
12. [JSON License](https://www.json.org/license.html)

What are unacceptable licenses (which require legal approval for the use):
1. [GNU GPL](https://choosealicense.com/licenses/gpl-3.0/)
2. [GNU AGPLv3](https://choosealicense.com/licenses/agpl-3.0/)
3. [Open Software License (OSL)](https://opensource.org/licenses/OSL-3.0)
4. [WTFPL](https://wtfpl.net/)

They also provide an email where an employee could write to ask about the license they want to use for their project or about the license of a component/project they want to use in their own work. There is two type of approvals: case by case or for universal use. 

Gitlab also invites their employees not to use forked code but to contribute changes to upstream, also providing reasons for why this is a good decision: it might become hard to rebase the branch and also there might be other libraries from the same project depending on the original version. 

### Proprietary Information and Assignment Agreement

It is important to observe that on this page, Gitlab has a link to a [PIAA Agreements section](https://about.gitlab.com/handbook/contracts/#piaa-agreements) part of a section about how to create a contract for a new employee. There they explain that: 

> Our PIAA does not grant GitLab any rights in any creations that you may make that are not related to GitLab's business or the work you do for GitLab. That is, you are free to develop those creations without requesting approval in advance from GitLab.

I think this is a very good thing because this addresses questions related to side projects employees do and want to open source. 

---

## Joyent open source policy

### About Joyent
{: #about-joyent }

From their website [https://www.joyent.com](https://www.joyent.com/about): 
> Since our inception, Joyent has lived on the leading edge of technical innovation. Our team pioneered public cloud computing (and hybrid cloud), nurtured and grew Node.js into a de facto standard for web, mobile and IoT architectures, and was among the first to embrace and industrialize containers, compute-centric object storage, and what is now coming to be known as serverless computing. 

You can read their Open Source Policy at [https://github.com/joyent/rfd/blob/master/rfd/0164/README.md](https://github.com/joyent/rfd/blob/master/rfd/0164/README.md) and browse their Github Repositories at [https://github.com/joyent](https://github.com/joyent).

Joyent open-sourced their entire software stack in 2014. 

### Open Source Counsel Office 

First, they talk about creating a role named, Open Source Counsel Office (OSCO) that serves a central point for _"consultation and approval with respect to open source policy"_.

### Licenses

Approved list of licenses that can be used without consulting OSCO: 
1. Mozilla Public License, 1.0, 1.1 and 2.0 variants
2. MIT License
3. Berkeley Software Distribution (BSD), 3-clause, 2-clause, and 0-clause variants
4. Apache License, 1.0, 1.1 and 2.0 variants
5. Common Development and Distribution License (CDDL)
6. PostgreSQL License
7. Python Software Foundation License
8. Public Domain
9. Artistic License
10. zlib/libpng license
11. PHP License
12. ICU License
13. Eclipse Public License

Then they have a list of licenses that can be used for internal use but cannot be used for external use without consulting OSCO: 
1. GNU Public License (GPL), v2 and v3
2. Lesser GNU Public License (LGPL)

And a list of licenses that can be used for internal-only with approval: 
1. Affero General Public License (AGPL)
2. Server Side Public License (SSPL)
3. Confluent Community License
4. Redis Source Available License
5. Any license bearing a Commons Clause addendum

### How to contribute

Further, their policy talks about how actively pushing changes upstream and setting some guidelines for contribution:
1. Personal attribution - where they make very clear that attribution should always be of the engineer who created the code
2. Copyright where they talk about how to write the copyright depending on the license and invite their employees to use company email addresses
3. Copyright notice where they indicate that they prefer to have the license included in the header of every file
4. Contributing source from third parties: where the guideline is to work with OSCO
5. De minimis change where they define that minimize changes does not need to have a copyright notice
6. Conduct which is referring responsibility to employees to report to OSCO or HR any misconduct
7. In case there is a need for Contributor License agreement that should be addressed with OSCO

### Creating an open-source

The last part of this document outlines open-source creation:
1. A place for publishing repositories: [Github Joyent account](https://github.com/joyent)
2. License: the preferred License is [Mozilla Public License Version 2.0](https://www.mozilla.org/en-US/MPL/2.0/)
3. Security: inviting to careful inspection to make sure no secrets are divulged
4. They invite not to use Contributor license agreements as this might be an impediment to contributions
5. There is no formal code of conduct adopted, but they recommend in case it is needed (or advised by OSCO) to use a variant based on Contributor Covenant.

---

## Google Open Source Policy

### About Open-Source at Google

Google has a website dedicated for open-source: [https://opensource.google/docs](https://opensource.google/docs), where you can find their policy. 

Google has so far one of the most comprehensive documented open source policies: it addresses a lot of knowhow about how to create an open-source project (or release code), how to use open-source, and what Google is doing to support open source communities. 

They are part of the [TODO Group](https://todogroup.org). 

You should go ahead and just read it. It is too big to summarise it. 
I will highlight some interesting things I found there that are worth considering when trying to create an open-source policy inside your company.  

### Releasing code as open-source

Google has a 5 step process: 
1. Prepare (there is a Github repo with boilerplate for this [https://github.com/google/new-project](https://github.com/google/new-project))
2. Stage
3. Get approval
4. Release
5. Patching

There is also a good section talking about differences between work-related project and personal project and a lot of good questions like: 
- I want to update a repository that's already gone through the launch process. Do I have to do it again?
- Do I really have to get approval from my manager? This is just a tiny project! What gives?
- What about projects from before I worked at Google?
- This process is a pain, can you automate any of it?
- What happens to my personal projects after I leave Google?

They also talk about Github at Google and where the repositories and how to get access to them. 

### Contributing to open-source

Google encourages contributing to open source projects and, when possible, to use their Google.com email and Google LLC as project author. There is a list of situations when there is no need for review. They are a combination of what kind of license those projects have combined with requirements for CLA and a filtering list provided by Google.

Also, there is a clear list of forbidden patches for any project that has any of the following licenses:
- No License
- [WTFPL](https://opensource.google/docs/thirdparty/licenses/#wtfpl-not-allowed)
- [AGPL](https://opensource.google/docs/using/agpl-policy/) (except those with special exceptions)
- Public domain dedications (including CC0 and Unlicense). Exceptions: United States government projects; BSD0.
- [CC BY-NC-*](https://opensource.google/docs/thirdparty/licenses/#noncommercial)
- Hippocratic License
- Private repositories (unless under a written agreement between Google and a third party)

### Personal projects

Here Google is very direct ([https://opensource.google/docs/iarc/](https://opensource.google/docs/iarc/)): 

> As part of your employment agreement, Google most likely owns the intellectual property (IP) you create while at the company. Because Google's business interests are so wide and varied, this likely applies to any personal project you have. That includes new development on personal projects you created prior to employment at Google.

### Participating to Hackathons

Here Google addresses multiple interesting aspects like: 
1. Subjects which are off-limits
2. Terms of the hackathon
3. What happens when an employee wants to be a judge or organizer
4. Lists of approved and not approved coding sides
5. Bug bounty

In general, employees should not participate in hackathons where there is a request for any assignment of intellectual property rights. There are also there two templates of terms for the short-form and long-form hackathon. 

Also, an important topic addresses are about moving a project into an open-source foundation. 

### Using Open Source

One clear statement here is that AGPL is not allowed to be used at Google. 
Google also requires to add all third_party code into a folder third_party where all non-Google code and data should live. I think this is a sane approach because it makes it easy to know what is the code created inside the company and what code is imported from outside, thus making review strategies more clear and easy to implement. 

I also find very well written and good explanations about what to consider when someone wants to use code from outside Google. One of the clearest recommendations is to look for licenses of open-source code where there is no ambiguity about the following three rights: 
- "the right to make copies (also known as reproduction)"
- "the right to modify and adapt (also known as the right to do derivative works)"
- "the right to distribute the original and modifications."

Open Source Initiative has a list of OSI-approved licenses which give clear rights to users: [https://opensource.org/licenses](https://opensource.org/licenses).

### Growing an open-source ecosystem

Google has a strong involvement in open-source. So in their policy is a big chapter about current initiatives they have to support open sources. In case you want to support open-source inside and outside your company, you should read this. It will give you good ideas about what to do and how. 

---

# Other important things to take into consideration

## How Dropbox uses CLA 

Dropbox requires individuals or companies to agree to their Dropbox Contributor License Agreements. 

Here is the example for the Individual CLA: [https://opensource.dropbox.com](https://opensource.dropbox.com)
Here is the example for Company CLA: [https://opensource.dropbox.com/cla/company/](https://opensource.dropbox.com/cla/company/).

## Why Gitlab transitioned from CLA to DCO

Gitlab [switched](https://about.gitlab.com/blog/2017/11/01/gitlab-switches-to-dco-license/) from Contributor License Agreement to Developer's Certificate of Origin to give developers greater flexibility and portability for their contributions. 
Read here their announcement about this transition here: [https://about.gitlab.com/blog/2017/11/01/gitlab-switches-to-dco-license](https://about.gitlab.com/blog/2017/11/01/gitlab-switches-to-dco-license). They also share there why this decision was made. 

# Resources

A list of links/resources I think are important to read when you are thinking to create an open-source policy: 

1. A list of open-source policies from companies part of TODO Group - [https://github.com/todogroup/policies](https://github.com/todogroup/policies) 
2. Guides and studies from TODO Group - [https://todogroup.org/guides](https://todogroup.org/guides) 
3. An article with a very good review of common open-source software licenses and great comparisons between them. It also has a lot of examples of software using various licenses - [https://medium.com/@moqod_development/understanding-open-source-and-free-software-licensing-c0fa600106c9](https://medium.com/@moqod_development/understanding-open-source-and-free-software-licensing-c0fa600106c9)
4. A good document about things to take into consideration when starting an open-source program: [https://www.linuxfoundation.org/resources/open-source-guides/creating-an-open-source-program](https://www.linuxfoundation.org/resources/open-source-guides/creating-an-open-source-program)
5. WIRED Guide about Open Source, which is not exactly about how to create an open-source policy but very informative about open source in general: [https://www.wired.com/story/wired-guide-open-source-software](https://www.wired.com/story/wired-guide-open-source-software/)
6. A good document about what to take into consideration when creating an open-source program in an enterprise company: [https://www.ibrahimatlinux.com/uploads/6/3/9/7/6397792/compliancepractices_ebook_final.pdf](https://www.ibrahimatlinux.com/uploads/6/3/9/7/6397792/compliancepractices_ebook_final.pdf)
7. A summary of Gartner’s report, Technology Insight for Software Composition Analysis: [https://blog.sonatype.com/gartner-the-crucial-role-of-oss-license-compliance](https://blog.sonatype.com/gartner-the-crucial-role-of-oss-license-compliance)
