---
# pandoc --pdf-engine=xelatex -i personal_statement.md -o personal_statement.pdf
title: Machine Learning HW1 - Theory
# author: Octavian Neamțu
geometry: margin=1.5cm
# geometry: margin="left=1.5cm,right=1.5cm,top=1cm,bottom=1cm"
fontsize: 12pt
# mainfont: EBGaramond12-Regular.otf
---

\newcommand\ctilde{\ \textasciitilde\ }

1. *Question:* Let $D$ be a distribution on the domain ${ \{-1, 1\} }^n$ and let
$f, g : \{-1, 1\}^n \rightarrow \{-1, 1\}$ be two Boolean functions. Prove that

$$\mathbb{P}_{x \ctilde D}[f(x) \neq g(x)] = \frac{1 - \mathbb{E}_{x \ctilde D}[f(x)g(x)]}{2}$$

*Answer:*

Notice that we can partition the distribution into 2 disjoint sets: $D_{=} = \{ x \ctilde D | f(x) = g(x) \}$
and $D_{\neq} = \{ x \ctilde D | f(x) \neq g(x) \}$.

By definition,

\begin{equation}
  \mathbb{E}_{x \ctilde D}[f(x)g(x)] = \mathbb{P}_{x \ctilde D_{=}} \frac{\sum_{x \ctilde D_{=}} f(x)g(x)}{dim(D_{=})} +
    \mathbb{P}_{x \ctilde D_{\neq}} \frac{\sum_{x \ctilde D_{\neq}} f(x)g(x)}{dim(D_{\neq})}
\end{equation}

Using the fact that $g(x_=) = f(x_=)$ for $x_= \ctilde D_{=}$ and $g(x_\neq) = -f(x_\neq)$ for $x_\neq \ctilde D_{\neq}$ (since $f(x_\neq) = 1$ implies $g(x_\neq) = -1$ and $f(x_\neq) = -1$ implies $g(x_\neq) = 1)$ then

\begin{align*}
  f(x_=)g(x_=) &= f^2(x_=) = (1 \text{\ or\ } -1)^2 = 1
  \\
  f(x_\neq)g(x_\neq) &= f(x_\neq)(-f(x_\neq)) = -f^2(x_\neq) = -1
\end{align*}

Therefore

\begin{align*}
  \mathbb{E}_{x \ctilde D}[f(x)g(x)] &= \mathbb{P}_{x \ctilde D_{=}} \frac{\sum_{x \ctilde D_{=}} 1}{dim(D_{=})} +
    \mathbb{P}_{x \ctilde D_{\neq}} \frac{\sum_{x \ctilde D_{\neq}} -1}{dim(D_{\neq})} \iff
  \\
  \mathbb{E}_{x \ctilde D}[f(x)g(x)] &= \mathbb{P}_{x \ctilde D_{=}} - \mathbb{P}_{x \ctilde D_{\neq}}
\end{align*}

Knowing that $\mathbb{P}_{x \ctilde D_=} = 1 - \mathbb{P}_{x \ctilde D_{\neq}}$

\begin{align*}
  \mathbb{E}_{x \ctilde D}[f(x)g(x)] &= (1 - \mathbb{P}_{x \ctilde D_{\neq}}) - \mathbb{P}_{x \ctilde D_{\neq}} \iff
  \\
  \mathbb{P}_{x \ctilde D}[f(x) \neq g(x)] &= \frac{1 - \mathbb{E}_{x \ctilde D}[f(x)g(x)]}{2}
\end{align*}

Q.E.D

Question: Would this still be true if the domain were some other domain, such as $\mathbb{R}^n$?
