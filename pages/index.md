---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
permalink: /
---

This is my personal blog. I'll do my best to keep it updated but I make no 
promises! Posts are likely to be a mix of programming, data visualisation, 
statistics and personal topics.

# Pages
{% for p in site.pages %}
{% if page.title != p.title%}
- [{{p.title}}]({{p.url}})
{% endif %}
{% endfor %}


# Blog posts {%include RSS.html %}
{% for post in site.posts %}
{% if post.ext == ".md" %}
- [{{post.title}}]({{post.url}}) ({{post.date | date: "%d %B %Y"}}) - *{{post.categories | array_to_sentence_string}}*
{% endif %}
{% endfor %}

# Package sites
- [heatmaplyExamples](https://alanocallaghan.github.io/heatmaplyExamples/): 
    *vignettes demonstrating the utility of 
    [heatmaply](https://github.com/talgalili/heatmaply) for various applications*
- [plotlyvignettes](https://alanocallaghan.github.io/plotlyvignettes):
    *vignettes relating to my 
    [plotlyutils](https://github.com/Alanocallaghan/plotlyutils) 
    package. Was used as the basis for a talk at an 
    [Edinburgh Bioinformatics](http://www.bioinformatics.ed.ac.uk/) meeting
    (2018-11-08)*.
