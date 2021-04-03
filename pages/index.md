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
  - [heatmaply](https://cran.r-project.org/web/packages/heatmaply/index.html) [![CRAN
status](https://www.r-pkg.org/badges/version/heatmaply)](https://CRAN.R-project.org/package=heatmaply)  
  *Interactive cluster heatmaps in R*
  - [bayefdr](https://cran.r-project.org/web/packages/bayefdr/index.html) [![CRAN
status](https://www.r-pkg.org/badges/version/bayefdr)](https://CRAN.R-project.org/package=bayefdr)  
  *Bayesian estimation and optimisation of expected FDR and expected FNR*.
  - [contrast](https://cran.r-project.org/web/packages/contrast/index.html) [![CRAN
status](https://www.r-pkg.org/badges/version/contrast)](https://CRAN.R-project.org/package=contrast)  
  *Contrasts for linear models in R*


- Bioconductor
  - [snifter](https://alanocallaghan.github.io/snifter/): devel [![](http://bioconductor.org/shields/build/devel/bioc/snifter.svg)](http://bioconductor.org/checkResults/devel/bioc-LATEST/snifter) | release [![](http://bioconductor.org/shields/build/release/bioc/snifter.svg)](http://bioconductor.org/checkResults/release/bioc-LATEST/snifter)   
    *R wrapper for the python openTSNE library implementing fast interpolated t-SNE*.
  - [densvis](https://github.com/Alanocallaghan/densvis): devel [![](http://bioconductor.org/shields/build/devel/bioc/densvis.svg)](http://bioconductor.org/checkResults/devel/bioc-LATEST/densvis) release [![](http://bioconductor.org/shields/build/release/bioc/densvis.svg)](http://bioconductor.org/checkResults/release/bioc-LATEST/densvis)  
    *Density-preserving non-linear dimensionality reduction methods.*
  - [scater](https://github.com/Alanocallaghan/scater) devel: [![](http://bioconductor.org/shields/build/devel/bioc/scater.svg)](http://bioconductor.org/checkResults/devel/bioc-LATEST/scater) release [![](http://bioconductor.org/shields/build/release/bioc/scater.svg)](http://bioconductor.org/checkResults/release/bioc-LATEST/scater)   
    *Single cell analysis toolkit*
  - [BASiCS](https://bioconductor.org/packages/devel/bioc/html/BASiCS.html) devel [![](http://bioconductor.org/shields/build/devel/bioc/BASiCS.svg)](http://bioconductor.org/checkResults/devel/bioc-LATEST/BASiCS) release [![](http://bioconductor.org/shields/build/release/bioc/BASiCS.svg)](http://bioconductor.org/checkResults/release/bioc-LATEST/BASiCS)  
    *Bayesian model for analysis of single-cell sequencing data*

- Misc:
  - [heatmaplyExamples](https://alanocallaghan.github.io/heatmaplyExamples/):  
      *vignettes demonstrating the utility of 
      [heatmaply](https://github.com/talgalili/heatmaply) for various applications*
  - [plotlyvignettes](https://alanocallaghan.github.io/plotlyvignettes):  
      *vignettes relating to my 
      [plotlyutils](https://github.com/Alanocallaghan/plotlyutils) 
      package. Was used as the basis for a talk at an 
      [Edinburgh Bioinformatics](http://www.bioinformatics.ed.ac.uk/) meeting
      (2018-11-08)*.
  - [agitated](https://alanocallaghan.github.io/agitated/):  
    *A re-implementation of UpSet plots*.
