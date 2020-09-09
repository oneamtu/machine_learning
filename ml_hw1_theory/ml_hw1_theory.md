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
\newcommand\sothat{\ \text{s.t.}\ }

1. *Question:* Let $D$ be a distribution on the domain ${ \{-1, 1\} }^n$ and let
$f, g : \{-1, 1\}^n \rightarrow \{-1, 1\}$ be two Boolean functions. Prove that

$$\mathbb{P}_{x \ctilde D}[f(x) \neq g(x)] = \frac{1 - \mathbb{E}_{x \ctilde D}[f(x)g(x)]}{2}$$

*Answer:*

Notice that we have 2 complementary events: $A_{=} = \{ x | f(x) = g(x) \}$
and $A_{\neq} = \{ x | f(x) \neq g(x) \}$. Thus $\mathbb{P}_{x \ctilde D}[A_=] + \mathbb{P}_{x \ctilde D}[A_\neq] = 1$.

By definition,

\begin{align*}
\mathbb{E}_{x \ctilde D}[f(x)g(x)] &= \sum_{x}f(x)g(x)D(x) \\
  &= \sum_{x \in A_=}f(x)g(x)D(x) + \sum_{x \in A_\neq}f(x)g(x)D(x)
\end{align*}

Using the fact that $g(x_=) = f(x_=)$ for $x_= \in A_{=}$ and $g(x_\neq) = -f(x_\neq)$ for $x_\neq \in A_{\neq}$ (since $f(x_\neq) = 1$ implies $g(x_\neq) = -1$ and $f(x_\neq) = -1$ implies $g(x_\neq) = 1)$ then

\begin{align*}
  f(x_=)g(x_=) &= f^2(x_=) = (1 \text{\ or\ } -1)^2 = 1 \\
  f(x_\neq)g(x_\neq) &= f(x_\neq)(-f(x_\neq)) = -f^2(x_\neq) = -1
\end{align*}

Therefore

\begin{align*}
  \mathbb{E}_{x \ctilde D}[f(x)g(x)] &= \sum_{x \in A_=}1*D(x) + \sum_{x \in A_\neq}(-1)*D(x) \\
    &= \mathbb{P}_D[A_=] - \mathbb{P}_D[A_\neq] \\
    &= (1 - \mathbb{P}_D[A_\neq]) - \mathbb{P}_D[A_\neq] \\
    &= 1 - 2\mathbb{P}_D[A_\neq] \iff \\
  \mathbb{P}_{x \ctilde D}[f(x) \neq g(x)] &= \frac{1 - \mathbb{E}_{x \ctilde D}[f(x)g(x)]}{2}
\end{align*}

Q.E.D.

*Question:* Would this still be true if the domain were some other domain, such as $\mathbb{R}^n$?

*Answer:* Not necessarily, depending on some fundamental assumptions. If we are working in
ZFC, then by using the axiom of choice we can construct a wacky non-measurable set $W$ by the [Vitali method](https://archive.org/details/axiomchoicelectu00herr_278/page/n132/mode/2up) on the pre-image of our distribution $D$ so that $W \subset D^{-1}(\mathbb{R}^n)$. Then we can pick $f$ as

\begin{align*}
  f(x) &=
    \begin{cases}
      \text{-1} \text{ if } x \in W \\
      \text{1} \text{ if } x \notin W
    \end{cases}
  \\
  g(x) &= 1
\end{align*}

Then $\mathbb{P}[f(x) \neq g(x)] = \int_WD(x)dx$ which is not well-defined.

Assuming that the sets $A_=$ and $A_\neq$ are measurable, then the result holds by a similar argument to our previous one:

\begin{align*}
\mathbb{E}_{x \ctilde A}[f(x)g(x)] &= \int_{A_=}f(x)g(x)D(x)dx + \int_{A_\neq}f(x)g(x)D(x)dx \\
  &= \int_{A_=}1*D(x)dx + \int_{A_\neq}(-1)*D(x)dx \\
  &= \int_{A_=}D(x)dx - \int_{A_\neq}D(x)dx \\
  &= \mathbb{P}_=- \mathbb{P}_\neq \\
  &= 1 - 2\mathbb{P}_\neq \iff \\
  \mathbb{P}_{x \ctilde D}[f(x) \neq g(x)] &= \frac{1 - \mathbb{E}_{x \ctilde D}[f(x)g(x)]}{2}
\end{align*}

2. *Question:* Let $f$ be a decision tree with $t$ leaves over the variables $x = (x_1, ... , x_n) \in \{−1, 1\}^n$.
Explain how to write $f$ as a multivariate polynomial $p(x_1, ... , x_n)$ such that for ever
input $x \in \{−1, 1\}^n, f(x) = p(x)$.

*Answer:*

I initially started with a more complicated proof, but I'm hoping a simpler one that can
be extensible will be clearer.

Assume that the tree's leaf values are $l_1, l_2 ... l_t \in \{-1, 1\}$. We can define $f$ as

$$
  f(x) =
    \begin{cases}
      l_1 \text{ if } \lor_j\land_{k = 1}^n x_k = v_{1jk} \\
      l_2 \text{ if } \lor_j\land_{k = 1}^n x_k = v_{2jk} \\
      ... \\
      l_t \text{ if } \lor_j\land_{k = 1}^n x_k = v_{tjk} \\
    \end{cases}
$$

Doesn't look much like a tree, but you can read it as this:

The function will return the value of leaf $l_i$ if each of the values in the input matches a
particular path in the tree determined by values $v_{ijk}$ for some $i$ and $j$.

For example:

~~~mermaid
graph TD
    x1-->l1;
    x1-->x2;
    x2-->l2;
    x2-->l3
~~~

$$
  f_{\text{eg}}(x) =
    \begin{cases}
      l_1 \text{ if } (x_1 = -1 \land x_2 = -1) \lor (x_1 = -1 \land x_2 = 1) \\
      l_2 \text{ if } (x_1 = 1 \land x_2 = -1) \\
      l_3 \text{ if } (x_1 = 1 \land x_2 = 1) \\
    \end{cases}
$$

Note that the or implies that multiple input values can lead to the same path; this
is because some $x_i$ values don't count towards some particular paths.

Let's look at the inverse images of f:

\begin{align*}
  f^{-1}(1) &= N_{1} = \{ v = (v_1, ..., v_n) \in \{-1, 1\}^n | f(v) = 1 \} \\
  f^{-1}(-1) &= N_{-1} = \{ v = (v_1, ..., v_n) \in \{-1, 1\}^n | f(v) = -1 \}
\end{align*}

$N_1$ and $N_{-1}$ are disjoint; if a value was to be in both sets, then $f(v) = 1 = -1$,
which is a contradiction.

Define

\begin{align*}
  I_v(x) &= \prod_{k = 1}^n\frac{(x_k + v_k)^2}{2^2} \\
  p(x) &= (1)\sum_{v \in N_{1}}I_v(x) + (-1)\sum_{v \in N_{-1}}I_v(x)
\end{align*}

Pick $x = a = (a_1, ... , a_n) \in \{−1, 1\}^n$.

Then $\forall v \neq a \exists k \sothat v_k \neq a_k$, otherwise $v_k$ would agree with $a_k$ on all values $k$, so $v$ would have to equal $a$ (contradiction).
This implies that $v_k = -a_k$ (via binarity of the space).
So $I_v(a) = 0$ since at least one of the terms of the product will be $v_k + a_k = 0$.

When $v = a$ then

\begin{align*}
I_v(a) = \prod_{k = 1}^n\frac{(a_k + v_k)^2}{2^2}
= \prod_{k = 1}^n\frac{(2a_k)^2}{2^2}
= \prod_{k = 1}^n(1 \text{ or } -1)^2
= 1
\end{align*}

If $f(a) = 1$, then $a \in N_1$ so $p(a) = (1)\cdot(I_a(a) + \sum_{v \in N_1, v \neq a}I_v(a)) + (-1)\cdot(\sum_{v \in N_{-1}, v \neq a}I_v(a)) = (1)(1 + 0) + (-1)0 = 1$.

If $f(a) = -1$, then, by a similar argument, $p(a) = -1$.

Thus $f(x) = p(x)$ for any $x$.

Q.E.D.

Note 1: you could drop the "ors" and thus some of the redundant terms in the polynomial
to only cover the relevant paths to a leaf. It would make the proof more complicated, but
that's probably the more compact form.

Note 2: You can apply the same proof for any label domain, not just the binary one.
