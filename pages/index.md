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
  | [contrast](https://cran.r-project.org/web/packages/contrast/index.html) | *Contrasts for linear models in R.* | [![CRAN status](https://www.r-pkg.org/badges/version/contrast)](https://CRAN.R-project.org/package=contrast) | [![](https://cranlogs.r-pkg.org/badges/contrast)](https://cran.r-project.org/package=contrast) |
  | [bayefdr](https://cran.r-project.org/web/packages/bayefdr/index.html) | *Bayesian estimation and optimisation of expected FDR and expected FNR*. | [![CRAN status](https://www.r-pkg.org/badges/version/bayefdr)](https://CRAN.R-project.org/package=bayefdr)  | [![](https://cranlogs.r-pkg.org/badges/bayefdr)](https://cran.r-project.org/package=bayefdr) |



- Bioconductor:

  | Package |Description | Devel | Release | Rank |
  |:--------|-----------:|------:|--------:|-----:|
  | [scater](https://github.com/Alanocallaghan/scater) | *Single cell analysis toolkit.* | [![](http://bioconductor.org/shields/build/devel/bioc/scater.svg)](http://bioconductor.org/checkResults/devel/bioc-LATEST/scater) |[![](http://bioconductor.org/shields/build/release/bioc/scater.svg)](http://bioconductor.org/checkResults/release/bioc-LATEST/scater) | [![](http://bioconductor.org/shields/downloads/release/scater.svg)](http://bioconductor.org/packages/stats/bioc/scater/) |
  | [BASiCS](https://bioconductor.org/packages/devel/bioc/html/BASiCS.html) | *Bayesian model for analysis of single-cell sequencing data.* | [![](http://bioconductor.org/shields/build/devel/bioc/BASiCS.svg)](http://bioconductor.org/checkResults/devel/bioc-LATEST/BASiCS) | [![](http://bioconductor.org/shields/build/release/bioc/BASiCS.svg)](http://bioconductor.org/checkResults/release/bioc-LATEST/BASiCS) | [![](http://bioconductor.org/shields/downloads/release/BASiCS.svg)](http://bioconductor.org/packages/stats/bioc/BASiCS/) |
  | [snifter](https://github.com/Alanocallaghan/snifter) |*R wrapper for the python openTSNE library implementing fast interpolated t-SNE.* | [![](http://bioconductor.org/shields/build/devel/bioc/snifter.svg)](http://bioconductor.org/checkResults/devel/bioc-LATEST/snifter) |[![](http://bioconductor.org/shields/build/release/bioc/snifter.svg)](http://bioconductor.org/checkResults/release/bioc-LATEST/snifter) | [![](http://bioconductor.org/shields/downloads/release/snifter.svg)](http://bioconductor.org/packages/stats/bioc/snifter/) |
  | [densvis](https://github.com/Alanocallaghan/densvis) | *Density-preserving non-linear dimensionality reduction methods.* | [![](http://bioconductor.org/shields/build/devel/bioc/densvis.svg)](http://bioconductor.org/checkResults/devel/bioc-LATEST/densvis) |[![](http://bioconductor.org/shields/build/release/bioc/densvis.svg)](http://bioconductor.org/checkResults/release/bioc-LATEST/densvis) | [![](http://bioconductor.org/shields/downloads/release/densvis.svg)](http://bioconductor.org/packages/stats/bioc/densvis/) |


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
