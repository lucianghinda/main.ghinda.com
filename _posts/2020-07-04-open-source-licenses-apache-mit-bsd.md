---
redirect_from:
  - /blog/opensource/2020/open-source-licenses-apache-mit-bsd.html
layout: post
title: A developer's guide to the most common open-source licenses (MIT, Apache 2.0, BSD)
categories: opensource
tags: 
- licenses 
- reviews
- decisions  
- howtodecide
author:
  twitter: lucianghinda
description: "An almost comprehensive guide about what kind of licenses to choose when creating a new open-source project: MIT or Apache 2.0 or BSD" 
toc: true
image: 
  path: /assets/images/cards/open-source-licenses-guide.png
  width: 2400
  height: 1200
---

_Notice: Please be aware that I am not a lawyer, and what I write here is based on some other sources from the internet, among which very few are from lawyers._ 

Please note this is a long article covering the following topics: 

- [Summary](#summary)
- [Comparisons between MIT, Apache 2.0 License and BSD licenses](#comparisons-between-mit-apache-20-license-and-bsd-licenses):
    + [Permissions, conditions and limitations](#permissions-conditions-and-limitations)
    + [Protection for the author/contributors](#protection-for-the-authorcontributors)
        * [Warranty](#warranty)
        * [Limitation of Liability](#limitation-of-liability)
- [MIT License](#mit-license)
    + [MIT License facts and figures](#mit-license-facts-and-figures)
    + [MIT License: permissions, conditions and limitations](#mit-license-permissions-conditions-and-limitations)
    + [Risks for choosing MIT License](#risks-for-choosing-mit-license)
        * [What is left out or unclear](#what-is-left-out-or-unclear)
        * [Possible risks from difference versions](#possible-risks-from-difference-versions)
    + [Compatibilities with other open-source licenses](#compatibilities-with-other-open-source-licenses)
    + [Open source policies recommending it as default](#open-source-policies-recommending-it-as-default)
    + [Example of projects using MIT License](#example-of-projects-using-mit-license)
- [Apache 2.0 License](#apache-license-20)
    + [Apache License 2.0 Facts and figures](#apache-license-20-facts-and-figures)
    + [Apache License 2.0: permissions, conditions and limitations](#apache-license-20-permissions-conditions-and-limitations)
    + [Risks for choosing Apache 2.0](#risks-for-choosing-apache-license-20)
    + [Compatibilities with other open source licenses](#compatibilities-with-other-open-source-licenses-1)
    + [Recommendations to use Apache 2.0 License](#recommendations-to-use-apache-20-license)
    + [Example of projects using Apache 2.0 License](#example-of-projects-using-apache-20-license)
- [BSD License](#bsd-license)
    + [BSD License Facts and Figures](#bsd-license-facts-and-figures)
    + [BSD License: Permissions, conditions and limitations](#bsd-license-permissions-conditions-and-limitations)
        * [BSD 2 Clause License](#bsd-2-clause-license)
        * [BSD 3-Clause License](#bsd-3-clause-license)
    + [Risks for choosing BSD License](#risks-for-choosing-bsd-license)
    + [BSD License compatibility with other open source licenses](#bsd-license-compatibility-with-other-open-source-licenses)
    + [Examples of projects using BSD License](#examples-of-projects-using-bsd-license)
- [More resources](#more-resources)
    + [Combining licenses](#combining-licenses)

---

# Summary

As I embarked into doing an open-source project, among the first things to decide is what kind of open-source license should it have. After reading a lot of materials, I will write here my recommendations and also some reviews of the most used licenses in open-source projects.

I will start with what I would recommend: 

1. I would choose Apache License 2 for a finite project which can be installed directly and used. Think about something like a full web app, or a desktop application. This is because it can create trust in installing the application and using it without any concern about patents. 

2. I would choose the MIT License for plugins, gems, packages, libraries. Think about Nodejs packages or Ruby gems. I recommend this because MIT License is easier to understand (can be read in a minute), and thus more developers will use the creation, and it is used a lot in the community. 

3. A good alternative is the BSD License, either 2-Clause or 3-Clause, in case there are concerns about using your name/brand to promote derivative work or by users of the software.

A strong indication for choosing Apache License 2.0 is [the analysis of 75 open source projects across 35 companies](https://medium.com/@raulk/list-of-companies-and-popular-projects-by-the-open-source-licenses-they-use-35a53eaf1c80) where Apache License 2.0 is the most used one.  

All three licenses analyzed here seems are recommended by well-known groups/foundations in the open-source community ([FSF](https://www.fsf.org), [OSI](https://opensource.com), [Debian](https://www.debian.org), [Fedora](https://fedoraproject.org)): 
- Free Software Foundation - [list of GPL compatible licenses](https://www.gnu.org/licenses/license-list.html#GPLCompatibleLicenses)
- Open Source Initiative - [list of OSI approved licenses](https://opensource.org/licenses/alphabetical)
- Debian Foundation - [list of licenses](https://www.debian.org/legal/licenses/) which follow the [Debian Free Software Guidelines](https://www.debian.org/social_contract#guidelines)
- Fedora Foundation - [list of right licenses](https://fedoraproject.org/wiki/Licensing:Main?rd=Licensing#SoftwareLicenses) that are OK for Fedora

*Their main advantages*:
1. All 3 of them allow derivative work, sub-licensing, commercial use, and distribution.
2. They can be combined with any other license - including copy-left licenses (of course, under the new license), so developers don't need to restrict what to include in their open-source software.
3. They are supported by default by [Github](https://github.com) and [Gitlab](https://gitlab.com) when creating a new repository, and they are acknowledged as compatible with Free Software and Open Source Software by FOSS, OSI, Debian, and Fedora (see links provided above). 


*Their main disadvantage*: 

There is a risk specifically for the developer that someone might take the code and use it in an unintended way (including making it part of a proprietary, non-open source software), and there is no legal ground to stop that.

---

# Comparisons between MIT, Apache 2.0 License and BSD licenses

## Permissions, conditions and limitations

![Comparision of open-source licenses - extract]({{ "/assets/images/articles/2020/06/23/permissions-and-conditions-comparison-open-source-licenses.png" | absolute_url }}){:.full-width-img.rounded.shadow}

_Image source: [snyk.io](https://snyk.io/blog/mit-apache-bsd-fairest-of-them-all)_

![Comparision of open-source licenses - extract from Wikipedia]({{ "/assets/images/articles/2020/06/23/permissions-and-conditions-comparison-open-source-licenses-wikipedia-extract.png" | absolute_url }}){:.full-width-img.rounded.shadow}

_Image source: [wikipedia.org](https://en.wikipedia.org/wiki/Comparison_of_free_and_open-source_software_licences)_

## Protection for the author/contributors

Two possible risks that might arise from putting something out as an open-source for the authors could be: 

1. To be required to offer a warranty for the end-users.
2. To be liable in case some loss happens to end-users while using the software.

### Warranty

Regarding warranty, all three licenses are pretty clear about what is not covered. 

<table class="full-width-content shadow" style="font-size: 70%">
    <thead>
        <th>MIT License - Warranty Disclaimer</th>
        <th>Apache License 2.0 - Warranty Disclaimer</th>
        <th>BSD 2-Clause or 3-Clause - Warranty Disclaimer</th>
    </thead>
    <tr>
        <td> 
            THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. 
        </td>
        <td>
            THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. | Disclaimer of Warranty. Unless required by applicable law or agreed to in writing, Licensor provides the Work (and each Contributor provides its Contributions) on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied, including, without limitation, any warranties or conditions of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE. You are solely responsible for determining the appropriateness of using or redistributing the Work and assume any risks associated with Your exercise of permissions under this License.
        </td>
        <td>
            THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
        </td>
    </tr>
</table>

### Limitation of Liability

The same is right about Limitation of Liability: 

<table class="full-width-content shadow" style="font-size: 70%">
    <thead>
        <th>MIT License</th>
        <th>Apache License 2.0</th>
        <th>BSD 2-Clause or 3-Clause</th>
    </thead>
    <tr>
        <td> 
            IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
        </td>
        <td>
            Limitation of Liability. In no event and under no legal theory, whether in tort (including negligence), contract, or otherwise, unless required by applicable law (such as deliberate and grossly negligent acts) or agreed to in writing, shall any Contributor be liable to You for damages, including any direct, indirect, special, incidental, or consequential damages of any character arising as a result of this License or out of the use or inability to use the Work (including but not limited to damages for loss of goodwill, work stoppage, computer failure or malfunction, or any and all other commercial damages or losses), even if such Contributor has been advised of the possibility of such damages.
        </td>
        <td>
            IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
        </td>
    </tr>
</table>

Notice that MIT and BSD have writing in ALL CAPS, even if this might not make any difference ([kemitchell.com](https://writing.kemitchell.com/2016/09/21/MIT-License-Line-by-Line.html)): 
> Courts have criticized the Bar for pretending as much, and most everyone agrees all-caps does more to discourage reading than compel it.

---

# MIT License

## MIT License facts and figures

Type of license: _PERMISSIVE_

The full content of MIT License can is here: [https://opensource.org/licenses](https://opensource.org/licenses/MIT) or here [https://spdx.org/licenses/MIT.html](https://spdx.org/licenses/MIT.html). There is one minor difference between these two versions regarding the explicit requirements to include the liability paragraph. 

![Difference between SPDX and OSI version of MIT License]({{ "/assets/images/articles/2020/06/23/MIT-license-comparision-between-spdx-osi.png" | absolute_url }}){:.full-width-img.rounded.shadow}

_Left: SPDX License, Right: Opensource/Debian MIT License_

Free Software Foundation, OSI, Debian, and Fedora include MIT License in their lists of free software or open-source software licenses. 


It is recommended by [https://choosealicense.com](https://choosealicense.com) (created by Github) with the explanation: 
> The [MIT License](https://choosealicense.com/licenses/mit/) is short and to the point. It lets people do almost anything they want with your project, like making and distributing closed source versions.

According to [this study](https://resources.whitesourcesoftware.com/blog-whitesource/top-open-source-licenses-trends-and-predictions), the MIT License is the most used license with 27% usage. 
A [public search on Github](https://github.com/search?q=license%3Amit&type=Repositories&ref=advsearch&l=&l=) for how many repositories are using MIT License found over 4 million results. 

## MIT License: permissions, conditions and limitations

[tldrlegal.com](https://tldrlegal.com) does an excellent summary of what the OSI license allows: 
> A short, permissive software license. Basically, you can do whatever you want as long as you include the original copyright and license notice in any copy of the software/source.

A [Wikipedia page](https://en.wikipedia.org/wiki/Comparison_of_free_and_open-source_software_licences) describes a comparison between various licenses and looks at 7 possible permissions. Here is what is says about MIT License:

<table style="font-size: 80%" class="full-width-content shadow"> 
    <thead>
        <th>Actions</th>
        <th>Permission</th>
    </thead>
    <tr>
        <td>Linking of the licensed code with code licensed under a different licence (e.g. when the code is provided as a library)</td>
        <td>YES</td>
    </tr>   
    <tr>
        <td>Distribution of the code to third parties</td>
        <td>YES</td>
    </tr>
    <tr>
        <td>Modification of the code by a licensee</td>
        <td>YES</td>
    </tr>
    <tr>
        <td>Protection of licensees from patent claims made by code contributors regarding their contribution, and protection of contributors from patent claims made by licensees</td>
        <td>MANUALLY</td>
    </tr>
    <tr>
        <td>May be used privately (e.g. internal use by a corporation)</td>
        <td>YES</td>
    </tr>
    <tr>
        <td>Whether modified code may be licensed under a different licence</td>
        <td>YES</td>
    </tr>
    <tr>
        <td>Use of trademarks associated with the licensed code or its contributors by a licensee</td>
        <td>YES</td>
    </tr>
</table>

From an open-source handbook created by [FINOS](https://www.finos.org), we have the following summary:

<table style="font-size: 80%" class="full-width-content shadow"> 
    <thead>
        <th>Binary or Source Code</th>
        <th>Actions</th>
        <th>Requirements</th>
    </thead>
    <tr>
        <td rowspan="2">Binary Form</td>
        <td>Distribution, <strong>unmodified</strong></td>
        <td>
            <i>Provide copy of license</i><br>
            and <br>
            <i>Provide copyright notice</i>
        </td>
    </tr>   
    <tr>
        <td>Distribution, <strong>modified</strong></td>
        <td>
            <i>Provide copy of license</i><br>
            and <br>
            <i>Provide copyright notice</i>
        </td>
    </tr>  
    <tr>
        <td rowspan="2">Source Code</td>
        <td>Distribution, <strong>unmodified</strong></td>
        <td>
            <i>Provide copy of license</i><br>
            and <br>
            <i>Provide copyright notice</i>
        </td>
    </tr>  
    <tr>
        <td>Distribution, <strong>modified</strong></td>
        <td>
            <i>Provide copy of license</i><br>
            and <br>
            <i>Provide copyright notice</i>
        </td>
    </tr>  
</table>

Also a good description of what this license allows or not can be read here [writing.kemitchell.com](https://writing.kemitchell.com/2016/09/21/MIT-License-Line-by-Line.html) and here [opensource.com](https://opensource.com/article/18/3/patent-grant-mit-license). 

Some highlights from these two documents: 

1. Because the language is broad and open-ended, then there is no restriction on what the licensee can do with the Software. Kyle Mitchell says about this: 
> "It gives licensees a strong argument against any claim by a licensor that they didn't give permission for the licensee to do that specific thing with the software, even if the thought clearly didn't occur to either side when the license was given."

2. It does not cover the patent license explicitly. Mitchell says that there might be legal concerns for licensee about "getting sued for copyright infringement and getting sued for patent infringement". His exact statement says: 
> "The general language “deal in” and some of the example verbs, especially “use”, point toward a patent license, albeit a very unclear one. The fact that the license comes from the copyright holder, who may or may not have patent rights in inventions in the software, as well as most of the example verbs and the definition of “the Software” itself, all point strongly toward a copyright license."

3. A member of Red Hat Legal team thinks that:
> "There is nothing that would lead one to believe that the licensor wanted to preserve their right to pursue patent infringement claims against the use of software”

4. The MIT License has some conditions for using the Software: 
> If you give someone a copy of the software, you need to include the license text and any copyright notice.
> 
> …
> You can’t pretend that the MIT code is your own proprietary code, or provided under some other license. Those receiving get to know their rights under the “public license”.

## Risks for choosing MIT License

### What is left out or unclear 

Still there are a lot of concerns expresses (not exactly from lawyers) that: 

1. The MIT License does not cover explicitely the patents rights
2. The MIT License does not cover explicitly the trademarks restrictions

Sources for rising these concerns: [one](https://github.com/SmartColumbusOS/TechnicalWorkingGroup/issues/12), [two](https://www.quora.com/What-are-the-pros-and-cons-of-the-MIT-license), [three](https://snyk.io/blog/mit-apache-bsd-fairest-of-them-all/).


### Possible risks from difference versions

One important thing to consider when talking about "MIT License" is that there are many variants of this license, but it is not versioned. So it is tough to understand about what version of this license people are talking about.

It seems like a lot of projects use the MIT License - Expat as it is presented by [Debian](https://www.debian.org/legal/licenses/mit) and is the same as the one recommended by [Opensource.org](https://opensource.org/licenses/MIT). 
[Gnu.org](https://www.gnu.org/licenses/license-list.html) names this license "Expat License" and warns against naming it "MIT License" because MIT used many licenses for their software: 
> Some people call this license "the MIT License," but that term is misleading since MIT has used many licenses for software. It is also ambiguous since the same people also call the [X11 license](https://www.gnu.org/licenses/license-list.html#X11License) "the MIT License," failing to distinguish them. We recommend not using the term "MIT License."


To see a long list of what people call MIT License can be found at this link: [https://fedoraproject.org/wiki/Licensing:MIT](https://fedoraproject.org/wiki/Licensing:MIT).


Also, research from 2015 - "On the Variability of the BSD and MIT Licenses" by Trevor Maryka, Daniel M. German, and German Poo-Caamano - found 11 separate license versions. The study data are available here [turingmachine.org/../mit-bsd](http://turingmachine.org/2015/mit-bsd), and for a summary of differences, you should look directly at this file [turingmachine.org/../mitx11.txt](http://turingmachine.org/2015/mit-bsd/mitx11.txt). 

## Compatibilities with other open-source licenses

MIT is a permissive license allowing you to re-license the derivative work under any license ([source](https://law.stackexchange.com/questions/6081/can-i-bundle-mit-licensed-components-in-a-apache-2-0-licensed-project)). 
In general, when you combine the MIT License with any other open source license, the resulting derivative work will not be MIT License. When you combine Public Domain, or MIT Licensed components, the result derivative work can be MIT License. 


A more detailed graph of what licenses can be used with what licenses were created avid A. Wheeler: [dwheeler.com](https://dwheeler.com/essays/floss-license-slide.html). 

## Open source policies recommending it as default

There are some companies which are suggesting MIT License as default one for new open-source projects: 

* Buffer [is recommending](https://open.buffer.com/guide-open-source) the use of MIT License in their open-source guide. 
* Joyent [is also recommending](https://github.com/joyent/rfd/blob/master/rfd/0164/README.md) the use of the MIT License as the default choice.

## Example of projects using MIT License

* [Babel](https://github.com/babel/babel/blob/master/LICENSE)
* [Dotnet Runtime](https://github.com/dotnet/runtime/blob/master/LICENSE.TXT)
* [Ruby on Rails](https://github.com/rails/rails/blob/master/MIT-LICENSE)
* [Visual Studio Code](https://github.com/microsoft/vscode/blob/master/LICENSE.txt)
* [Vue.js](https://github.com/vuejs/vue/blob/dev/LICENSE)
* [React](https://github.com/facebook/react/blob/master/LICENSE)

---

# Apache License 2.0

## Apache License 2.0 Facts and figures

Type of license:  _PERMISSIVE_

Apache License 2.0 can be found on the [Apache Foundation website](https://www.apache.org/licenses/LICENSE-2.0.txt) or at [OSI website](https://opensource.org/licenses/Apache-2.0) or at [Software Package Data Exchange website](https://spdx.org/licenses/Apache-2.0.html).

A search on Github on how many repositories are using this license found 1.284.000 projects under Apache License 2.0

Free Software Foundation, OSI, Debian and Fedora are all including Apache License 2.0 in their lists of free software or open source software licenses.

## Apache License 2.0: permissions, conditions and limitations

Here is a brief summary as described by [Choose a License](https://choosealicense.com/licenses/apache-2.0): 

> A permissive license whose main conditions require preservation of copyright and license notices. Contributors provide an express grant of patent rights. Licensed works, modifications, and larger works may be distributed under different terms and without source code.

Another short summary of this license from [White Source Software](https://resources.whitesourcesoftware.com/blog-whitesource/top-10-apache-license-questions-answered) could be:

> You can freely use, modify, distribute and sell a software licensed under the Apache License without worrying about the use of software: personal, internal or commercial.

Summary of permissions, conditions and limitations: 

![Apache 2.0 License summary of permissions, conditions and limitation]({{ "/assets/images/articles/2020/06/23/apache-2-0-license-summary-of-permissions.png" | absolute_url }}){:.full-width-img.shadow.rounded}

_Image source: [choosealicense.com]( https://choosealicense.com/licenses/)_

A [Wikipedia page](https://en.wikipedia.org/wiki/Comparison_of_free_and_open-source_software_licences) describes a comparison between various licenses and looks at 7 possible permissions. Here is what is says about Apache License 2.0:

<table style="font-size: 80%" class="full-width-content shadow"> 
    <thead>
        <th>Actions</th>
        <th>Permission</th>
    </thead>
    <tr>
        <td>Linking of the licensed code with code licensed under a different licence (e.g. when the code is provided as a library)</td>
        <td>YES</td>
    </tr>   
    <tr>
        <td>Distribution of the code to third parties</td>
        <td>YES</td>
    </tr>
    <tr>
        <td>Modification of the code by a licensee</td>
        <td>YES</td>
    </tr>
    <tr>
        <td>Protection of licensees from patent claims made by code contributors regarding their contribution, and protection of contributors from patent claims made by licensees</td>
        <td>YES</td>
    </tr>
    <tr>
        <td>May be used privately (e.g. internal use by a corporation)</td>
        <td>YES</td>
    </tr>
    <tr>
        <td>Whether modified code may be licensed under a different licence</td>
        <td>YES</td>
    </tr>
    <tr>
        <td>Use of trademarks associated with the licensed code or its contributors by a licensee</td>
        <td>NO</td>
    </tr>
</table>

From an open source handbook created by [FINOS](https://www.finos.org) we have the following summary 

<table style="font-size: 80%" class="full-width-content shadow"> 
    <thead>
        <th>Binary or Source Code</th>
        <th>Actions</th>
        <th>Requirements</th>
    </thead>
    <tr>
        <td rowspan="2">Binary Form</td>
        <td>Distribution, <strong>unmodified</strong></td>
        <td>
            <i>Provide copy of license</i>
        </td>
    </tr>   
    <tr>
        <td>Distribution, <strong>modified</strong></td>
        <td>
            <i>Provide copy of license </i><br>
            and <br>
            <i>Modified files must include “prominent notices” of the modifications</i>
        </td>
    </tr>  
    <tr>
        <td rowspan="2">Source Code</td>
        <td>Distribution, <strong>unmodified</strong></td>
        <td>
            <i>Provide copy of license</i><br>
            and <br>
            <i>Retain all notices</i>
        </td>
    </tr>  
    <tr>
        <td>Distribution, <strong>modified</strong></td>
        <td>
            <i>Provide copy of license</i><br>
            and <br>
            <i>Modified files must include “prominent notices” of the modifications and Retain all notices</i>
        </td>
    </tr>  
</table>

Other important things to take into consideration about this License: 

1. “If anyone intentionally sends a contribution for an Apache-licensed software to its authors, this contribution can automatically be used under the Apache License” - [toptal.com](https://www.toptal.com/open-source/developers-guide-to-open-source-licenses)
2. It explicitly asks for unmodified parts of the software to retain Apache License - [whitesourcesoftware.com](https://resources.whitesourcesoftware.com/blog-whitesource/top-10-apache-license-questions-answered)
3. “It requires you to explicitly list out all the modifications that you’ve done in the original software” - [whitesourcesoftware.com](https://resources.whitesourcesoftware.com/blog-whitesource/top-10-apache-license-questions-answered)
4. The patent grant should have a positive effect on Users who should not be afraid that any Contributor might pursue royalties from their contribution to the project - [opensource.com](https://opensource.com/article/18/2/how-make-sense-apache-2-patent-license)
5. Finally, the patent licenses granted will be terminated immediately in case the Licensee decides to file a litigation against the Licensor. 

Kem Mitchell includes indirectly in an [article](https://writing.kemitchell.com/2019/10/03/Open-Standards.html) the Apache License 2.0 as a better license than MIT License of BSD: 

> The open licensing state-of-the-art has evolved, and releases under old licenses picked specifically for lack of clear patent permission won’t be greeted as good faith open source, but as legal traps, especially for organizations without access to savvy counsel. 

Paul H. Arne from Morris, Manning & Martin, L.L.P published a whitepaper about [“Open Source Software Licenses: Perspectives of the End User  and the Software Developer“](https://www.mmmlaw.com/files/documents/publications/article_238.pdf) where they state: 

> The Apache license is well-constructed, relatively easy to read, and provides a different approach to open source licensing from other open-source software licenses

## Risks for choosing Apache License 2.0

One thing consider is that you cannot combine Apache License 2.0 with GPL v2 ([oss-watch.ac.uk](http://oss-watch.ac.uk/resources/apache2) and [gnu.org](https://www.gnu.org/licenses/license-list.html)). 

Another aspect to consider is that a “contributor can modify the code and then sell it as proprietary software” - [mmmlaw.com](https://www.mmmlaw.com/files/documents/publications/article_238.pdf).

## Compatibilities with other open source licenses

As described here, Apache License 2.0 cannot be combined with GPL/LGPL v1 and v2. This means that code released under Apache License 2.0 cannot be used in GPL v1 and v2 software. So if this kind of compatibility is needed, then Apache License 2.0 should not be chosen. 

If MIT Licensed code is combined with Apache License 2.0 code, then the derivative code might be Apache License 2.0. 


## Recommendations to use Apache 2.0 License

[GNU](https://www.gnu.org/licenses/license-list.html) recommends to use Apache License 2.0 over MIT/Expat license. 

Google recommends to use Apache License 2.0 [opensource.google](https://opensource.google/docs/releasing/)

## Example of projects using Apache 2.0 License

* [kubernetes](https://github.com/kubernetes/kubernetes/blob/master/LICENSE)
* [tensorflow](https://github.com/tensorflow/tensorflow/blob/master/LICENSE)
* [android core](https://github.com/aosp-mirror/platform_system_core/blob/master/NOTICE)
* [Swift programming language](https://github.com/apple/swift/blob/master/LICENSE.txt)

---

# BSD License

## BSD License Facts and Figures

Type of license:  _PERMISSIVE_

Initially there was a [4 clause license](https://spdx.org/licenses/BSD-4-Clause.html),  which usually now can be identified by the name `BSD 4-Clause "Original" or "Old" License`. This version was incompatible with GNU GPL and it included a clause to acknowledge the authors of any components under this license in any advertising material. 

This clause - the advertising clause - was removed and thus BSD 3-Clause license was created. Then also the non-endorsement clause was removed so BSD 2-Clause license was born. 

Among them, BSD 2-Clause is the most permissive license.  

The commonly used BSD licenses are: 

1. BSD 2 Clause: full content of license can be found here ([opensource.org](https://opensource.org/licenses/BSD-2-Clause)) or here ([spdx.org](https://spdx.org/licenses/BSD-2-Clause.html)). Github and Gitlab are using the SPDX version. 

Differences between the OSI version and SPDX versions for BSD 2 Clause are the following:

![Diff between OSI version and SPDX versions for BSD 2 Clause]({{ "/assets/images/articles/2020/06/23/bsd-2-clause-license-difference-osi-spdx.png" | absolute_url }}){:.full-width-img.shadow.rounded}

2. BSD 3 Clause: full content of license can be found here ([opensource.org](https://opensource.org/licenses/BSD-3-Clause)) or here ([spdx.org](https://spdx.org/licenses/BSD-3-Clause.html)). Github and Gitlab are using the SPDX version. 

Differences between OSI version and SPDX version for BSD 3-Clause are: 

![Diff between OSI version and SPDX versions for BSD 3 Clause]({{ "/assets/images/articles/2020/06/23/bsd-3-clause-license-difference-osi-spdx.png" | absolute_url }}){:.full-width-img.shadow.rounded}


On Github there are almost [80.000 projects](https://github.com/search?q=license%3Absd-2-clause&type=Repositories&ref=advsearch&l=&l=) (data from July 2020) using BSD 2 clause and almost [180.000 projects](https://github.com/search?q=license%3Absd-3-clause&type=Repositories&ref=advsearch&l=&l=) (data from July 2020) using BSD 3 clause. 

When creating a new project [Github.com](https://github.com) offers the option to choose between two types of BSD License (both of them are the SPDX versions and the naming convention is the same): 

1. BSD 2-Clause “Simplified” License - which is the same as the [SPDX BSD 2-Clause license](https://spdx.org/licenses/BSD-2-Clause.html)
2. BSD 3-Clause “New” or “Revised” License - which is the same as the [SPDX BSD 3-Clause License](https://spdx.org/licenses/BSD-3-Clause.html)

![Choosing a license for a project on Github.com]({{ "/assets/images/articles/2020/06/23/github-opensource-project-choose-license.png" | absolute_url }}){:.full-width-img.shadow.rounded}

The same goes for [Gitlab.org](https://gitlab.org), which offers the same 2 types of BSD Licenses that match the SPDX versions: 

![Choosing a license for a project on Gitlab.org]({{ "/assets/images/articles/2020/06/23/gitlab-opensource-project-choose-license.png" | absolute_url }}){:.full-width-img.shadow.rounded}

## BSD License: Permissions, conditions and limitations

### BSD 2 Clause License

From [tldrlegal.com](https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)) : 

> The BSD 2-clause license allows you almost unlimited freedom with the software so long as you include the BSD copyright notice in it (found in Fulltext). Many other licenses are influenced by this one.

From the open source handbook created by [FINOS](https://www.finos.org) we have the following summary: 

<table style="font-size: 80%" class="full-width-content shadow"> 
    <thead>
        <th>Binary or Source Code</th>
        <th>Actions</th>
        <th>Requirements</th>
    </thead>
    <tr>
        <td rowspan="2">Binary Form</td>
        <td>Distribution, <strong>unmodified</strong></td>
        <td>
            <i>Provide copy of license</i>
            <br> and <br>
            <i> Provide copyright notice </i>
        </td>
    </tr>   
    <tr>
        <td>Distribution, <strong>modified</strong></td>
        <td>
            <i>Provide copy of license</i>
            <br> and <br>
            <i> Provide copyright notice </i>
        </td>
    </tr>  
    <tr>
        <td rowspan="2">Source Code</td>
        <td>Distribution, <strong>unmodified</strong></td>
        <td>
            <i>Provide copy of license</i>
            <br> and <br>
            <i> Provide copyright notice </i>
        </td>
    </tr>  
    <tr>
        <td>Distribution, <strong>modified</strong></td>
        <td>
            <i>Provide copy of license</i>
            <br> and <br>
            <i> Provide copyright notice </i>
        </td>
    </tr>  
</table>

### BSD 3-Clause License

From [tldrlegal.com](https://tldrlegal.com/license/bsd-3-clause-license-(revised): 

> The BSD 3-clause license allows you almost unlimited freedom with the software so long as you include the BSD copyright and license notice in it (found in Fulltext). 

This [Wikipedia page](https://en.wikipedia.org/wiki/Comparison_of_free_and_open-source_software_licences) describes a comparison between various licenses and looks at 7 possible permissions. Here is what is says about BSD 3-Clause License:

<table style="font-size: 80%" class="full-width-content shadow"> 
    <thead>
        <th>Actions</th>
        <th>Permission</th>
    </thead>
    <tr>
        <td>Linking of the licensed code with code licensed under a different licence (e.g. when the code is provided as a library)</td>
        <td>YES</td>
    </tr>   
    <tr>
        <td>Distribution of the code to third parties</td>
        <td>YES</td>
    </tr>
    <tr>
        <td>Modification of the code by a licensee</td>
        <td>YES</td>
    </tr>
    <tr>
        <td>Protection of licensees from patent claims made by code contributors regarding their contribution, and protection of contributors from patent claims made by licensees</td>
        <td>MANUALLY</td>
    </tr>
    <tr>
        <td>May be used privately (e.g. internal use by a corporation)</td>
        <td>YES</td>
    </tr>
    <tr>
        <td>Whether modified code may be licensed under a different licence</td>
        <td>YES</td>
    </tr>
    <tr>
        <td>Use of trademarks associated with the licensed code or its contributors by a licensee</td>
        <td>
            MANUALLY
            <br>
            <blockquote style="font-size: 100%">
             "You may not use the names of the original company or its members to endorse derived products"   
            </blockquote> <a href="https://tldrlegal.com/license/bsd-3-clause-license-(revised)">source tldrlegal.com</a>

        </td>
    </tr>
</table>

## Risks for choosing BSD License

BSD License (2-Clause and 3-Clause) does not grant any patent rights - [whitesourcesoftware.com](https://resources.whitesourcesoftware.com/blog-whitesource/top-10-bsd-licenses-questions-answered).  

Among software creators, there might be concerns regarding how competition might be inspired by their open source and use the knowledge to gain dominance. 

Here is a possible answer to this from a resource on the [FreeBSD.org](https://www.freebsd.org/doc/en_US.ISO8859-1/articles/bsdl-gpl/article.html) website: 

> Under a BSD license, if one company came to dominate a product niche that others considered strategic, the other companies can, with minimal effort, form a mini-consortium aimed at re-establishing parity by contributing to a competitive BSD variant that increases market competition and fairness. This permits each company to believe that it will be able to profit from some advantage it can provide, while also contributing to economic flexibility and efficiency. The more rapidly and easily the cooperating members can do this, the more successful they will be. A BSD license is essentially a minimally complicated license that enables such behavior.

BSD 2-Clause is almost similar to MIT License - [according to this answer on Stackexchange](https://opensource.stackexchange.com/questions/217/what-are-the-essential-differences-between-the-bsd-and-mit-licences) - so for users of the created software under BSD 2 Clause, there might be concerns regarding possible patent risks. 

## BSD License compatibility with other open source licenses

BSD License is compatible with proprietary or open-source licenses. The only restriction is that 4-Clause BSD is not compatible with GNU GPL. 
The [David A. Wheeler graph](https://dwheeler.com/essays/floss-license-slide.html) can be used to see what license goes with what license. 

## Examples of projects using BSD License

* [GO Programming Language](https://github.com/golang/go/blob/master/LICENSE)
* [Django Python Framework](https://github.com/django/django/blob/master/LICENSE)
* [NumPy](https://github.com/numpy/numpy/blob/master/LICENSE.txt)
* [Nginx](https://github.com/nginx/nginx/blob/master/docs/text/LICENSE)

# More resources

First, you should check [the list of open-source licenses](https://opensource.org/licenses/category) as it is defined by OSI.

Then here is a list of [open-source licenses with various comments](https://www.gnu.org/licenses/license-list.html) from the GNU perspective for each one of them:.

Another good place to read about what kind of permissions or restrictions open-source licenses have is [this handbook](https://www.finos.org/blog/announcing-the-open-source-license-compliance-handbook) created by FINOS.

Then you can also check [choosealicense website](https://choosealicense.com) friendly website created by Github.

[A good study](https://resources.whitesourcesoftware.com/blog-whitesource/top-open-source-licenses-trends-and-predictions) about open source licenses. I found interesting the shift from copyleft to permissive license published by [WhiteSource](https://resources.whitesourcesoftware.com/blog-whitesource/top-open-source-licenses-trends-and-predictions).

Other articles talking about open source licenses: 

1. [Developer’s Guide to Open Source Licenses](https://www.toptal.com/open-source/developers-guide-to-open-source-licenses)
2. [A list of other possible open source licenses](https://polyformproject.org/licenses) with different permissions
3. [The Legal Side of Open Source section](https://opensource.guide/legal) at [Open Source Guides](https://opensource.guide)


## Combining licenses

Important resources to read about combining licenses:

* David Wheeler ["license slide" figure](https://dwheeler.com/essays/floss-license-slide.html)
* Janelia FlyEM Project page about [Open Source Licenses and their Compatibility](https://janelia-flyem.github.io/licenses.html) based on David Wheeler license slide article. 

In case a project has multiple licenses, then the resulting derivative work should comply with requirements from all licenses, and most probably will need to include all licenses in its license file. 
[This discussion](https://opensource.stackexchange.com/questions/7384/proper-way-of-migrating-mit-licensed-code-to-apache-2-0-license) on Open Source StackExchange is very clear about what needs to be done. 

# Final words

It might be that I got some things wrong or something is missing so if you have feedback please send it to ideas@ghinda.com. 

In case you just want to comment on this, here is the [Hacker News discussion](https://news.ycombinator.com/item?id=23737838). 

