---
# pandoc --pdf-engine=xelatex -F mermaid-filter -i ml_hw1_theory.md -o Octavian-HW1t.pdf
title: Machine Learning HW4 - Theory
# author: Octavian Neamțu
geometry: margin=1.5cm
# geometry: margin="left=1.5cm,right=1.5cm,top=1cm,bottom=1cm"
fontsize: 12pt
# mainfont: EBGaramond12-Regular.otf
---

\newcommand\ctilde{\ \textasciitilde\ }
\newcommand\sothat{\ \text{s.t.}\ }
\newcommand\gain{\text{gain}}
\newcommand\prob{\mathbb{P}}
\newcommand\tif{\text{\ if\ }}

1.

a) **Question:** To ensure that $\prob[X = i]$ is a valid probability mass function, what constraint should
we put on $\theta = [\theta_1, \theta_2]$?

**Answer:** The sum of all of the probability components has to total 1.

\begin{align*}
\prob[X=1] + \prob[X=2] + \prob[x=3] = 1 \iff \theta_1 + 2\theta_1 + \theta_2 = 1 \iff 3\theta_1 + \theta_2 = 1
\end{align*}

b) **Question:** Write down the joint probability of the data sequence

\begin{align*}
\prob[D | \theta] = \prob\left[\left\{x^{(1)}, .. , x^{(n)}\right\} | \theta \right]
\end{align*}

and the log probability $\log\prob[D | \theta]$.

**Answer:** Since $x^{(i)}$ are i.i.d. then

\begin{align*}
\prob[D | \theta] &= \prod_{i=1}^{n}\prob[x^{(i)} | \theta] \\
            &= \prod_{i=1}^{n}\prob[x^{(i)} | \theta] \\
            &= \prod_{i=1}^{n_1}\theta_1 \prod_{i=1}^{n_2}2\theta_1 \prod_{i=1}^{n_3}\theta_2 \\
            &= \theta_1^{n_1}(2\theta_1)^{n_2}\theta_2^{n_3} \iff \\
l(\theta) = \log\prob[D | \theta] &= n_1 \log(\theta_1) + n_2 \log(2\theta_1) + n_3 \log(\theta_2) \\
            &= n_1 \log(\theta_1) + n_2 \log(2\theta_1) + n_3 \log(1-3\theta_1)
\end{align*}

c) **Question:** Calculate the maximum likelihood estimation $\hat{\theta}$ of $\theta$ based on the sequence D.

**Answer**

\begin{align*}
  \hat{\theta} = \underset{\theta}{\mathrm{argmax}} \ l(\theta) &= n_1 \log(\theta_1) + n_2 \log(2\theta_1) + n_3 \log(1-3\theta_1) \iff \\
  \nabla l(\theta) &= \frac{n_1}{\theta_1} + \frac{n_2}{2\theta_1} - \frac{n_3}{1 - 3\theta_1} = 0 \iff \\
  0 &= \frac{(2n_1 + n_2)(1 - 3\theta_1) - 2n_3\theta_1}{2\theta_1(1 - 3\theta_1)} \iff \\
0 &= \frac{(2n_1 + n_2)(1 - 3\theta_1) - 2n_3\theta_1}{2\theta_1(1 - 3\theta_1)} \iff (\text{assuming } \theta_1 > 0, \theta_2 > 0)\\
  0 &= 2n_1 + n_2 - 6n_1\theta_1 - 3n_2\theta_1 - 2n_3\theta_1 \iff \\
  \hat{\theta_1} &= \frac{2n_1 + n_2}{6n_1 + 3n_2 + 2n_3} \\
  \hat{\theta_2} &= \frac{2n_3}{6n_1 + 3n_2 + 2n_3}
\end{align*}

and it checks out that $\hat{\theta_1} + 2\hat{\theta_1} + \hat{\theta_2} = 1$.

2. **Question:** Let $x^{(i)}$ be i.i.d. from a distribution whose density is

\begin{align*}
  f(x | \beta) = \frac{1}{\beta}\exp\left(-\frac{x}{\beta}\right), 0 \leq x \leq \infty
\end{align*}

Find the MLE of $\beta$.

**Answer:** Since $x^{(i)}$ are i.i.d. then

\begin{align*}
  L(\beta) &= \prod_{i=1}^{n}f(x^{(i)} | \beta) \iff \\
  l(\beta) &= \log\prod_{i=1}^{n}f(x^{(i)} | \beta) \\
    &= \sum_{i=1}^{n}\log f(x^{(i)} | \beta) \\
&= \sum_{i=1}^{n}\log \left(\frac{1}{\beta}\exp\left(-\frac{x^{(i)}}{\beta}\right)\right) \\
&= \sum_{i=1}^{n}\log \frac{1}{\beta} - \frac{x^{(i)}}{\beta} \\
&= n\log \frac{1}{\beta} - \frac{\sum_{i=1}^{n}x^{(i)}}{\beta}
\end{align*}

To find $\underset{\beta}{\mathrm{argmax}}\ l(\beta)$ let's look at the derivative

\begin{align*}
\nabla l(\beta) = n\frac{1}{\frac{1}{\beta}}\left(-\frac{1}{\beta^2}\right) + \frac{\sum_{i=1}^{n}x^{(i)}}{\beta^2} &= 0 \iff \\
-n\frac{1}{\beta} + \frac{\sum_{i=1}^{n}x^{(i)}}{\beta^2} &= 0 \iff (\text{assuming } \beta > 0) \\
\hat{\beta} &= \frac{\sum_{i=1}^{n}x^{(i)}}{\beta}
\end{align*}

3.

a) **Question:** Assume that you want to investigate the proportion ($\theta$) of defective items manufactured
at a production line. You take a random sample of 30 items and found 5 of them were
defective. Assume the prior of $\theta$ is a uniform distribution on $[0, 1]$. Please compute
the posterior of $\theta$. It is sufficient to write down the posterior density function upto a
normalization constant that does not depend on $\theta$.

**Answer:** Knowing our sample is i.i.d.

\begin{align*}
  \prob[\theta] &= \int_0^1 x dx = 1 \text{(prior)}\\
  \prob[x^{(i)} = \text{defect} | \theta] &= \theta \\
  \prob[x^{(i)} = \text{good} | \theta] &= 1 - \theta \\
  \prob[D] &= \text{const} \\
  \prob[\theta | D] &= \frac{\prob[D | \theta]\prob[\theta]}{\prob[D]} \\
  &= \frac{\prod_{i=1}^{n}\prob[x^{(i)} | \theta] \times 1}{\prob[D]} \\
  &= \frac{\theta^5(1-\theta)^{25}}{\prob[D]}
\end{align*}

b) **Question:** Assume an observation $D := \{x^{i}\}$ is i.i.d. drawn from a Gaussian distribution
$\mathcal{N}(\mu, 1)$, with an unknown mean $\mu$ and a variance of 1. Assume the prior distribution of
$\mu$ is $\mathcal{N}(0, 1)$. Please derive the posterior distribution $p(\mu | D)$ of $\mu$ given data $D$.

**Answer:** Knowing our sample is i.i.d. then $\prob[D | \mu] = \prod_{i = 1}^{n} \prob[x^{(i)} | \mu]$
and using the same notation for $A$ and $B$ for the coefficients of $\mu$ from the quadratic from lecture

\begin{align*}
  \prob[\mu] &= \mathcal{N}(0, 1) = \frac{1}{\sqrt{2\pi}} \exp\left(-\frac{\mu^2}{2}\right) \text{(prior)} \\
  \prob[x^{(i)} | \mu] &= \frac{1}{\sqrt{2\pi}} \exp\left(-\frac{(x^{(i)} - \mu)^2}{2}\right) \\
  \prob[D] &= \text{const} \\
  \prob[\mu | D] &= \frac{\prob[D | \mu]\prob[\mu]}{\prob[D]} \\
  &= \frac{\prod_{i=1}^{n}\prob[x^{(i)} | \mu]\times\prob[\mu]}{\prob[D]} \\
&= \frac{\prod_{i=1}^{n} \frac{1}{\sqrt{2\pi}} \exp\left(-\frac{(x^{(i)} - \mu)^2}{2}\right) \times \frac{1}{\sqrt{2\pi}} \exp\left(-\frac{\mu^2}{2}\right)}{\prob[D]} \\
&= \frac{\frac{1}{(2\pi)^{\frac{n+1}{2}}} \exp\left(\sum_{i=1}^{n}-\frac{(x^{(i)} - \mu)^2}{2} -\frac{\mu^2}{2}\right)}{\prob[D]} \iff \\
A &= \sum_{i=1}^{n}1 + 1 = n + 1 \\
B &= \sum_{i=1}^{n}x^{(i)} \\
\mu_p &= \frac{\sum_{i=1}^{n}x^{(i)}}{n+1} \iff \\
\prob[\mu | D] &\propto \mathcal{N}(\mu_p, 1)
\end{align*}

