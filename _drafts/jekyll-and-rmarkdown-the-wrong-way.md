---
title:  "Jekyll and Rmarkdown (the wrong way)"
date:   2018-11-13 16:09:18 +0000
categories: ["programming", "data visualisation"]
---

[Jekyll](https://jekyllrb.com/) is great. [Rmarkdown](https://rmarkdown.rstudio.com/)
is great. Combined, they should be a truly 
unstoppable force... right? To appropriate [an axiom coined by 
Betteridge](https://en.wikipedia.org/wiki/Betteridge%27s_law_of_headlines),
any rhetorical question with an obvious answer may be answered using a single word:
"no". In short, Jekyll works primarily with [markdown](https://daringfireball.net/projects/markdown/)
files; Rmarkdown files
are conceptually similar, but must be rendered to HTML or markdown before
they can be displayed in their lovely, self-contained goodness -- plots, code
and all. 

Before I jump in, I have to add a minor preamble and a major caveat. 
There exist a number of apparently great and useful guides to this,
including [this one](https://github.com/yihui/blogdown-jekyll) by the brilliant
[Yihui Xie](https://yihui.name/) of knitr and RStudio fame,
and a number of similar workflows like 
[this](https://jfiksel.github.io/2017-01-25-hello-world/), 
[this](http://brendanrocks.com/blogging-with-rmarkdown-knitr-jekyll/),
and [this](https://selbydavid.com/2017/06/16/rmarkdown-jekyll/). 
There is a [github repo](https://github.com/atbradley/jekyll-rmarkdown) aimed
at solving the problem, and a few StackOverflow questions.
I am going to describe a solution for my specific taste, tools and
use cases, and it is by no means a recommendation -- it is simply what works for 
me.

At first, I had hope for an integrated solution - there was talk of calling R
from Ruby to use `knitr`, and even [a readymade .Rmd to .html Jekyll converter on 
Github](https://github.com/atbradley/jekyll-rmarkdown/)!
It is unfortunate that this repository was just home to a Ruby script rather 
than a [rubygem](https://rubygems.org/) for easy installation via `Gemfile`. 
The fact that there is [a pull request (open since 2014)](https://github.com/atbradley/jekyll-rmarkdown/pulls)
aimed at remedying that simple problem is cold comfort. It is significantly 
colder comfort that it also doesn't appear to work at all (for me at least). 
There appeared to be some issues with recognition of filenames.
Some light googling dug up [an issue from 2014](https://github.com/jekyll/jekyll/pull/3147) 
which mentions this behaviour, which apparently has been fixed twice now.

Either way, I lowered my sights. Obviously seamless integration was a bit 
optimistic. Presumably Github Pages doesn't have R on their servers anyway, 
so it was probably a waste of time. 

For most situation, [Yihui's solution](https://github.com/yihui/blogdown-jekyll) 
is great, as it handles Rmarkdown to markdown conversion beautifully,
and even allows you to run a local server, similar to what you get by running
`jekyll serve` on the command line. However, often when I use Rmarkdown
I do so to include [htmlwidgets](http://www.htmlwidgets.org/), and rmarkdown 
doesn't currently handle HTML dependencies,
[as Yihui has noted](https://github.com/yihui/blogdown-jekyll/issues/8).
A few people have come across this
issue, and there is even [a seemingly very elegant solution 
available](http://brendanrocks.com/htmlwidgets-knitr-jekyll/). However,
this solution seemed convoluted to me, and relies on someone's personal
R package (subject to change or disappearance), and I am 
nothing if not overly stubborn, so I decided to roll my own solution.

The solution? Makefile. Always
Makefile, usually with a few standard GNU tools for flavour. 
After all, when the only tool you have
is a hammer, everything starts to look like a nail. If you know Makefile syntax,
I apologise in advance for potentially lethal doses of eye-rolling. If not,
I've tried to detail every step to act as a small practical primer. I can't go
into detail about every tool though, so hopefully I've covered enough to make it 
all clear.

# The Makefile
The first step is a rule for converting
Rmarkdown files to HTML, which will be self-contained (including any htmlwidgets).
We can set up a rule to make any HTML file by rendering an Rmarkdown file of 
the same name using `%`. We just name our target `%.html` (any HTML file)
and our dependency `%.Rmd` (the .Rmd file of the same base name) and then define
how we build our dependency into our target:
```
%.html: %.Rmd
    R --no-save -e 'rmarkdown::render("$<")'
```
This renders `$<`, our dependency `%.Rmd` to a `.html` file 
(think `foo.Rmd` to `foo.html`) -- great! All we have to do is ensure we 
have set our output format in the YAML front matter of the Rmarkdown file:
```
---
output:
  html_document
---
```
Since Jekyll will print this HTML directly within our layout template, 
we can define a rule to "convert" this directly into a markdown file
using `$<` and `$@`, where `$@` refers to the 
target:
```
%.md: %.html
    mv $< $@
```
...right? Not so fast. This is a *fully* self-contained HTML file, so it 
includes things like the `DOCTYPE` declaration, which will show up in the 
rendered Jekyll page unless we do something about it! `grep` to the rescue:
```
%.md: %.html
    cat $< | grep -v DOCTYPE > $@
```
This prints the contents of `$<` to `$@` except any lines that match DOCTYPE
(the `-v` flag in `grep` inverts the selection). Now we're golden, right?
Not quite! How can we use Jekyll front matter, 
since the front matter we put in our Rmarkdown file is used to configure 
the rendering of the HTML file? 

The solution? An arbitrarily defined comment
delimiter, `#?` -- we can preface our Jekyll front matter with that,
extract it from the source file, and print it to our target 
file. I know what you're thinking. *"Inventing your own comment format? For a 
single use case?"* &nbsp; You're beginning to feel dirty. You haven't seen a house of cards like this 
since House of Cards. But bear with me, because believe it or not, it gets 
worse. First we need to extract our comments and print them to the target file:
```
%.md: %.html
    cat "$(basename $<).Rmd" | fgrep '#?' | sed -re "s/#\?[ ]?*//g" > $@
```
First, we `cat` the Rmarkdown file (using GNU make's `basename` command rather 
than the standard GNU `basename` command, since make's one removes the extension),
we find our comment lines with `fgrep` (grep without regular expressions),
we use `sed` to remove our comment characters, and 
finally we redirect the output to the target file.
The astute among you may notice that this will *only* print these special
comment lines. That's no good. We need the `---` lines to delimit the front matter
along with all of our HTML for this to make any sense at all.
So now, our final Makefile, which adds the first delimiter, then the comments,
then the second delimiter, and then the rest of the file excluding the DOCTYPE
declaration:
```
%.md: %.html
    echo "---" > $@ && \
        cat "$(basename $<).Rmd" | fgrep '#?' | sed -re "s/#\?[ ]?*//g" >> $@ && \
        echo "---" >> $@ && \
        cat $< | grep -v DOCTYPE  >> $@

%.html: %.Rmd
    R --no-save -e 'rmarkdown::render("$<")'
```

# Listing pages
So far, so good. Things might not be looking so rosy elsewhere, though.
You probably have a page listing the posts and pages on your site (in my case,
the index file) using some Liquid code that is pretty similar to this:
{% raw %}
```
{% for post in site.posts %}
- [{{post.title}}]({{post.url}})
{% endfor %}
```
{% endraw %}
However, Jekyll has a nasty habit of showing all files, regardless of whether
or not it can display them nicely. Since we don't want to display .Rmd files,
we can just filter this list for only `.md` files:

{% raw %}
```
{% for post in site.posts %}
{% if post.ext == ".md" %}
- [{{post.title}}]({{post.url}})
{% endif %}
{% endfor %}
```
{% endraw %}

# Conclusion
Beautiful. This allows us to write Rmarkdown files into self-contained markdown
documents, which should be displayed just like any other page on the site,
except using inline code, inline plots, and all the wholesome goodness of 
Rmarkdown. And the results? These shall have to wait until next time...
