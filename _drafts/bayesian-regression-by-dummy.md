---
title:  "Bayesian regression by dummy"
date:   2019-12-10 12:00:00 +0000
categories: "stats"
---

Another item in the infinite stream of "things I said I'd do but didn't make 
time for". This week, we have a walkthrough of Bayesian linear regression. 
In particular, the process of re-writing the posterior, $$p(\beta, \sigma^2)$$,
such that it is normal with respect to $$(\beta - \hat{\beta})$$.
A secondary step which was relevant to me was deriving
the full conditionals for $$\beta$$ and $$\sigma^2$$.


This is one of many things I have come across during my Ph.D. that have made me
feel stupid. I find this quite alright. I know that I am "stupid"
relative to other people. I also know that if you do not encounter people 
much smarter than you, you will likely not learn as quickly as you might
otherwise. However it was very disheartening to find lots of different 
resources that skipped over a fairly tricky step that seemed important. 
I thought it would be useful for me to talk through this process, and it might
be useful for somebody either as a sanity check for their work or 


The likelihood of this model is
$$
p(y | X, \beta, \sigma^2) \propto (\sigma^2)^{-\frac{n}{2}}
\exp\left(\frac{1}{2\sigma^2}(y- X \beta)^{\rm T}(y- X \beta)\right)
$$.


We can sensibly focus on the log of the parts of this expression that relate
to the regression coefficients $$\beta$$, $$(y - X\beta)^{\rm T}(y - XB)$$.
This is said (without explanation) to be equal to the expression
<!-- (y - X \beta)^{\rm T}(y- X \beta) =  -->
$$
(y- X \hat{\beta})^{\rm T}(y- X \hat{\beta}) + (\beta - \hat{\beta})^{\rm T}(X^{\rm T}X)(\beta - \hat{\beta})
$$ where $$\hat{\beta}$$ are the ordinary least squares coefficients.

I found this pretty confusing, and while this wasn't the element of Bayesian 
regression that I was directly interested in, I wanted to know what was going on 
there. The referenced book gives slightly more detail, mentioning that we 
want to "complete the square", but this is still pretty vague. It writes the 
problem as

$$
\begin{align}
  (y - X\beta)^{\rm T}(y - XB) = & \ \beta^{\rm T} X^{\rm T} X \beta - \beta^{\rm T} X^{\rm T} y - y^{\rm T} X\beta + y^{\rm T}y \\
  = & \ (\beta - \hat{\beta})^{\rm T}X^{\rm T}X(\beta - \hat{\beta}) + S \\
  \text{where} \ S = & \ (y - X\hat{\beta})^{\rm T}(y - X\hat{\beta}) \\
  \text{and} \ \hat{\beta} = & \ (X^{\rm T}X)^{-1}X^{\rm T}y
\end{align}
$$

Two key results that are used throughout this are that 
$$(X^{-1})^{\rm T} = (X^{\rm T})^{-1}$$ and that $$(XY)^{\rm T} = Y^{\rm T}X^{\rm T}$$.
So what do we do here to complete the square? Well, working back from the last 
result, we can expand the expression (fair warning: it's rather lengthy)

$$
\begin{align}
  (\beta - \hat{\beta})^{\rm T}X^{\rm T}X(\beta - \hat{\beta}) + (y - X\hat{\beta})^{\rm T}(y - X\hat{\beta})
  = & \ \beta^{\rm T}X^{\rm T}X\beta - \beta^{\rm T}X^{\rm T}X \hat{\beta} 
    - \hat{\beta}^{\rm T} X^{\rm T}X\beta + \hat{\beta}^{\rm T} X^{\rm T} X \hat{\beta} \\
    & + y^{\rm T}y - y^{\rm T} X\hat{\beta} - \hat{\beta}^{\rm T} X^{\rm T} y + \hat{\beta}^{\rm T} X^{\rm T} X \hat{\beta}
\end{align}
$$

Unfortunately this isn't really any more clear or obvious to me! If we replace 
$$\hat{\beta}$$ with $$(X^{\rm T}X)^{-1}X^{\rm T}y$$ we might get a bit closer, though.
Using the two results mentioned above, we can show that

$$
\begin{align}
  \hat{\beta}^{\rm T} = & ((X^{\rm T}X)^{-1}X^{\rm T}y)^{\rm T} \\
  = & (X^{\rm T}y)^{\rm T}((X^{\rm T}X)^{-1})^{\rm T} \\
  = & y^{\rm T}X((X^{\rm T}X)^{\rm T})^{-1} \\
  = & y^{\rm T} X (X^{\rm T} (X^{\rm T})^{\rm T})^{-1} \\
  \hat{\beta}^{\rm T} = & y^{\rm T}X(X^{\rm T}X)^{-1}
\end{align}
$$ 

Using this result, we can rewrite our previous expression as

$$
\begin{align}
  \beta^{\rm T}X^{\rm T}X\beta 
    & - \beta^{\rm T}X^{\rm T}X(X^{\rm T}X)^{-1}X^{\rm T}y \\
    & - y^{\rm T}X(X^{\rm T}X)^{-1}X^{\rm T}X\beta \\
    & + y^{\rm T}X(X^{\rm T}X)^{-1}X^{\rm T}X(X^{\rm T}X)^{-1}X^{\rm T}y \\
    & + y^{\rm T}y \\
    & - y^{\rm T} X (X^{\rm T}X)^{-1} X^{\rm T} y \\
    & - y^{\rm T} X (X^{\rm T}X)^{-1} X^{\rm T} y \\
    & + y^{\rm T}X (X^{\rm T}X)^{-1} X^{\rm T} X (X^{\rm T}X)^{-1} X^{\rm T} y
\end{align}
$$

Since we know that by definition $$(X^{\rm T}X)(X^{\rm T}X)^{-1} = I$$, we can reduce this 
expression considerably, and it starts to become familiar:

$$
\beta^{\rm T} X^{\rm T} X \beta - \beta^{\rm T} X^{\rm T}y - y^{\rm T} X \beta
    + y^{\rm T}y
    + 2y^{\rm T}X (X^{\rm T}X)^{-1} X^{\rm T}y 
    - 2y^{\rm T} X (X^{\rm T}X)^{-1} X^{\rm T} y
$$

So, as is usually the case, completing the square meant adding and subtracting
the same quantity from the expression, in this case 
$$2y^{\rm T}X (X^{\rm T}X)^{-1} X^{\rm T}y$$. 


With this rewritten likelihood, we can search for a conjugate prior. 


Using the normal-inverse-gamma prior, the posterior becomes

Therefore the full conditional for $$\beta$$ is 

and the full conditional for $$\sigma^2$$ is
