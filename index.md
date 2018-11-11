---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
---

This is my personal blog. I'll do my best to keep it updated but I make no 
promises! Posts are likely to be a mix of programming, data visualisation, 
statistics and personal topics.

# Pages
{% for p in site.pages %}
{% if page.title != p.title%}
[{{p.title}}]({{p.url}})
{% endif %}
{% endfor %}

# Blog posts
{% for post in site.posts %}
[{{post.title}}]({{post.url}}) ({{post.date | date: "%d %B %Y"}})
{% endfor %}
