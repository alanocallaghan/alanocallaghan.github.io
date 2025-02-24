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
- [*Curriculum vitae*]({{site.url}}/assets/cv.pdf)

# Blog posts {%include RSS.html %}
{% for post in site.posts %}
{% if post.ext == ".md" %}
- [{{post.title}}]({{post.url}}) ({{post.date | date: "%d %B %Y"}}) - *{{post.categories | array_to_sentence_string}}*
{% endif %}
{% endfor %}

# Package sites

Here are some links to R packages I've written or contributed to:

- CRAN packages:

  | Package | Description | Version | Downloads |
  |:--------|------------:|--------:|----------:|
  | [heatmaply](https://cran.r-project.org/web/packages/heatmaply/index.html) | *Interactive cluster heatmaps in R.* | [![CRAN status](https://www.r-pkg.org/badges/version/heatmaply)](https://CRAN.R-project.org/package=heatmaply)  | [![](https://cranlogs.r-pkg.org/badges/heatmaply)](https://cran.r-project.org/package=heatmaply) |
  | [iheatmapr](https://cran.r-project.org/web/packages/iheatmapr/index.html) | *Interactive cluster heatmaps in R.* | [![CRAN status](https://www.r-pkg.org/badges/version/iheatmapr)](https://CRAN.R-project.org/package=heatmaply)  | [![](https://cranlogs.r-pkg.org/badges/iheatmapr)](https://cran.r-project.org/package=iheatmapr) |
  | [contrast](https://cran.r-project.org/web/packages/contrast/index.html) | *Contrasts for linear models in R.* | [![CRAN status](https://www.r-pkg.org/badges/version/contrast)](https://CRAN.R-project.org/package=contrast) | [![](https://cranlogs.r-pkg.org/badges/contrast)](https://cran.r-project.org/package=contrast) |
  | [bayefdr](https://cran.r-project.org/web/packages/bayefdr/index.html) | *Bayesian estimation and optimisation of expected FDR and expected FNR*. | [![CRAN status](https://www.r-pkg.org/badges/version/bayefdr)](https://CRAN.R-project.org/package=bayefdr)  | [![](https://cranlogs.r-pkg.org/badges/bayefdr)](https://cran.r-project.org/package=bayefdr) |



- Bioconductor:

  | Package | Devel | Release | Issues | Pull requests |
  |:-------:|------:|--------:|-------:|--------------:|
  | [scater](https://github.com/Alanocallaghan/scater) | [![](http://bioconductor.org/shields/build/devel/bioc/scater.svg)](http://bioconductor.org/checkResults/devel/bioc-LATEST/scater) |[![](http://bioconductor.org/shields/build/release/bioc/scater.svg)](http://bioconductor.org/checkResults/release/bioc-LATEST/scater) | [![GitHub issues](https://img.shields.io/github/issues/Alanocallaghan/scater)](https://github.com/Alanocallaghan/scater/issues) | [![GitHub pulls](https://img.shields.io/github/issues-pr/Alanocallaghan/scater)](https://github.com/Alanocallaghan/scater/pulls) |
  | [snifter](https://github.com/Alanocallaghan/snifter) | [![](http://bioconductor.org/shields/build/devel/bioc/snifter.svg)](http://bioconductor.org/checkResults/devel/bioc-LATEST/snifter) |[![](http://bioconductor.org/shields/build/release/bioc/snifter.svg)](http://bioconductor.org/checkResults/release/bioc-LATEST/snifter) | [![GitHub issues](https://img.shields.io/github/issues/Alanocallaghan/snifter)](https://github.com/Alanocallaghan/snifter/issues) | [![GitHub pulls](https://img.shields.io/github/issues-pr/Alanocallaghan/snifter)](https://github.com/Alanocallaghan/snifter/pulls) |
  | [densvis](https://github.com/Alanocallaghan/densvis) | [![](http://bioconductor.org/shields/build/devel/bioc/densvis.svg)](http://bioconductor.org/checkResults/devel/bioc-LATEST/densvis) |[![](http://bioconductor.org/shields/build/release/bioc/densvis.svg)](http://bioconductor.org/checkResults/release/bioc-LATEST/densvis) | [![GitHub issues](https://img.shields.io/github/issues/Alanocallaghan/densvis)](https://github.com/Alanocallaghan/densvis/issues) | [![GitHub pulls](https://img.shields.io/github/issues-pr/Alanocallaghan/densvis)](https://github.com/Alanocallaghan/densvis/pulls)|
  | [BASiCStan](https://bioconductor.org/packages/devel/bioc/html/BASiCStan.html) | [![](http://bioconductor.org/shields/build/devel/bioc/BASiCStan.svg)](http://bioconductor.org/checkResults/devel/bioc-LATEST/BASiCStan) | [![](http://bioconductor.org/shields/build/release/bioc/BASiCStan.svg)](http://bioconductor.org/checkResults/release/bioc-LATEST/BASiCStan) | [![GitHub issues](https://img.shields.io/github/issues/Alanocallaghan/BASiCStan)](https://github.com/Alanocallaghan/BASiCStan/issues) | [![GitHub pulls](https://img.shields.io/github/issues-pr/Alanocallaghan/BASiCStan)](https://github.com/Alanocallaghan/BASiCStan/pulls) |


- Misc:
  - [heatmaplyExamples](https://alanocallaghan.github.io/heatmaplyExamples/):  
    Vignettes demonstrating the utility of 
    [heatmaply](https://github.com/talgalili/heatmaply) for various applications
  - [plotlyutils](https://github.com/Alanocallaghan/plotlyutils):  
    Some functions for creating nice interactive plots using the plotly R and JS
    libraries.
  - [nalar](https://github.com/Alanocallaghan/plotlyutils):  
    A personal R library I use for common analysis tasks. May be published on
    CRAN eventually.
  - [plotlyvignettes](https://alanocallaghan.github.io/plotlyvignettes):  
    Vignettes relating to my 
    [plotlyutils](https://github.com/Alanocallaghan/plotlyutils) 
    package. Was used as the basis for a talk at an 
    [Edinburgh Bioinformatics](http://www.bioinformatics.ed.ac.uk/) meeting
    (2018-11-08).

- Teaching materials:  
  I have also contributed to and maintain some teaching materials:

  | Name | Website | Source |
  |:-----|:--------|:-------|
  |High dimensional statistics with R | [Carpentries Incubator](https://carpentries-incubator.github.io/high-dimensional-stats-r/) | [GitHub](https://github.com/carpentries-incubator/high-dimensional-stats-r/)
  |Orchestrating single cell analysis (landing) | [Bioconductor](http://bioconductor.org/books/release/OSCA/) | [GitHub](https://github.com/OSCA-source/OSCA/)
  |Orchestrating single cell analysis (multisample) | [Bioconductor](http://bioconductor.org/books/release/OSCA.multisample/) | [GitHub](https://github.com/OSCA-source/OSCA.multisample/)


  <!-- - [agitated](https://alanocallaghan.github.io/agitated/):  
    *A re-implementation of UpSet plots*. -->
