---
title:  "Immunity passports and Bayes theorem"
date:   2020-04-08 12:30:00 +0000
categories: ["stats", "Bayes by dummies"]
---

There is growing discussion during the current COVID-19 epidemic about serum 
antibody tests. These can be used to estimate the proportion of individuals
in a population that have recovered from an illness, by detecting antibodies
to the pathogen in a sample of their blood.
In contrast to the RT-PCR tests currently
used to clinically diagnose COVID-19 worldwide, which detect the 
presence of the pathogen at the time of testing, antibody tests can detect
historical infections from recent weeks or months.

Following from the development of these tests, the idea of 
[immunity passports](https://www.theguardian.com/world/2020/mar/30/immunity-passports-could-speed-up-return-to-work-after-covid-19) has been mooted
by a number of outfits and individuals. The idea of an immunity passport is
to allow people who have recovered from COVID-19 to leave lockdown and return
to life more-or-less as normal. Serum antibody tests could be a great way to
do this, as they can detect people who have had mild or asymptomatic cases
in previous weeks, while also giving some idea about the strength of immunity
individuals still possess.

Immunity passports would obviously be a great boon for society and individuals,
both economically and socially. They would allow many businesses to re-open,
and they would allow many individuals to return to work, and to see friends and
family possibly many months before they would otherwise.
However, they also has a number of downsides. The primary downside is that they 
create a [perverse incentive](https://en.wikipedia.org/wiki/Perverse_incentive),
particularly for low-income workers who may be desperate to recover their 
income. A secondary problem arises due to 
[Bayes theorem](https://en.wikipedia.org/wiki/Bayes'_theorem),
and concepts from classification such as the true positive rate (sensitivity)
and false positive rate (fall-out) of a test, and the prevalence of a condition
in the population.

Informally, the problem with immunity passports is that they rely not only on
the **accuracy of the test used**, but also the **proportion of the population
that has the disease**.
This latter is something we never truly know, because it is typically
too time-consuming and expensive to test all individuals in a population, but 
also because no test is exactly perfect. Each test has some tendency to 
produce a positive result when the true result is negative, and vice versa.

We can also express this mathematically, and show that it is a (literally)
textbook case of Bayes theorem in action.
We can denote a positive case (someone who has had the disease) as $$d_+$$,
a positive test as $$t_+$$, and a negative test as $$t_-$$.
We can write this mathematically as $$p(d_+|t_+)$$ or "the probability of having
the disease, given that you have tested positive". This probability is the 
probability of testing positive given that you have the disease times 
the probability that you have the disease, divided by the probability of testing
positive. More simply, it's the product of the test sensitivity and the disease
prevalence, normalised by the probability of testing positive regardless of 
whether you have the disease.

$$
p(d_+|t_+) = \frac{p(t_+|d_+) p(d_+)}{p(t_+|d_+) p(d_+) + p(t_+|d_-) p(d_-)}
$$

For immunity passports to work, you need to have high confidence that positive
test results represent individuals who have had the disease.
A test with a high true positive rate and low false positive rate helps
a lot here, but the disease prevalence has a huge impact as well. If we
have a disease with extremely low prevalence, then the small proportion of false
positives we see by testing the large number of true negatives can vastly 
outnumber the true positives we would see if we tested all truly positive cases.

I've put together a small widget that demonstrates how each parameter affects
the outcomes of population-scale testing, using a disease prevalence that
is likely to be attained in the UK in the coming months,
true positive and false positive rates similar to some antibody tests I have
seen described, and the population of the UK according to Google.

<style>
input {
  /*position: absolute;*/
  /*right: 20%;*/
  width: 20%;
}
</style>


<div class="slidecontainer">
  <label for="positives">Prevalence:
    <div id="posf" style='display:inline;'></div>
  </label>
  <br>
  <input type="range" min="1" max="999" value="50" class="slider" id="positives">
  <br>
  <label for="tp_rate">True positive rate of test:
    <div id="tprf" style='display:inline;'></div>
  </label>
  <br>
  <input type="range" min="1" max="1000" value="900" class="slider" id="tp_rate"> 
  <br>
  <label for="fp_rate">False positive rate of test:
    <div id="fprf" style='display:inline;'></div>
  </label>
  <br>
  <input type="range" min="1" max="1000" value="50" class="slider" id="fp_rate">
  <br>
  <label for="population">Population size:</label>
  <br>
  <input type="text" id="population" name="population" value="67798540">
  <br>
</div>
<br>


<div>
  Given the values selected, if you were tested at random, the probability that 
  you had truly been ill (rounded to two decimal places) 
  is <div id="pdisease" style='display:inline;'> </div>.
  If we tested every person given the specified population size, that would mean 
  that roughly
  <div id="nps" style='display:inline;'> </div> people would test positive,
  of which roughly
  <div id="nfps" style='display:inline;'> </div>
  would be people who have not truly had the disease!
  This shows why "immunity 
  passports" are a really tricky idea to get right.
</div>

<script>
  var pslider = document.getElementById("positives");
  var poutput = document.getElementById("posf");
  var tslider = document.getElementById("tp_rate");
  var toutput = document.getElementById("tprf");
  var fslider = document.getElementById("fp_rate");
  var foutput = document.getElementById("fprf");
  var pdisease = document.getElementById("pdisease");
  var popfield = document.getElementById("population");
  var nfps = document.getElementById("nfps");
  var nps = document.getElementById("nps");

  function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }
  function roundToTwoDigits(x) {
    return Math.round((x + 1e-15) * 100) / 100;
  }
  function updateValues() {
    poutput.innerHTML = (pslider.value / 10) + "%";
    toutput.innerHTML = (tslider.value / 10) + "%";
    foutput.innerHTML = (fslider.value / 10) + "%";
    population = popfield.value;

    positives = pslider.value / 1000;
    tp_rate = tslider.value / 1000;
    fp_rate = fslider.value / 1000;

    negatives = 1 - positives;

    fps = negatives * fp_rate;
    tps = positives * tp_rate;
    tns = negatives * (1 - fp_rate);
    fns = positives * (1 - tp_rate);

    prob_disease_given_p = tps / (tps + fps);
    pdisease.innerHTML = roundToTwoDigits(prob_disease_given_p);
    // pdisease.innerHTML = prob_disease_given_p;
    nps.innerHTML = numberWithCommas(Math.round(population * (tps + fps)));
    nfps.innerHTML = numberWithCommas(Math.round(population * (fps)));
  }

  updateValues();
  pslider.oninput = updateValues;
  tslider.oninput = updateValues;
  fslider.oninput = updateValues;
</script>

