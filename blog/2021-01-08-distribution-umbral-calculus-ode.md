---
Title: Distributions, Laplace Transform and Initial Value Problem
Date: 2021-01-09 20:40
Category: Mathematics
Tags: Mathematics
Lang: en
---

[TOC]


# Introduction

In this article, we are interested in solving Initial Value Problem (IVP) using a special isomorphism between the algebraic fractions in $\delta'$ and the usual algebraic fractions. For that, we will use the space of distributions with compact and positive support and observe that the convolution of two distributions behaves like the multiplication over a field.

Usually, this approach to solve an IVP simply presents Laplace transforms as a tool, without much explanation about where it comes from and why it works. I took a different approach with the point of view of distributions which is the natural space to perform convolution. In my opinion, it leads to naturally observe the similar structure between this particular subspace of distributions and the polynomials. On top of that, the concrete example presented which is solving a non-homogenous ordinary differential system with constant coefficients, would not even require the mention of Laplace transform, nor to compute explicitely the transformation, but using only a symbolic table derivated directly from a simple convolution equation and observing the effect of convolving with the derivatives of the dirac distribution.

This article starts by presenting the space of distributions and in particular the regular distributions, as well as the convolution operator.

# Space of Distributions

We denote by $\mathcal D$ the set of test functions.
A test function $\phi \in \mathcal D$ is a function from $\phi: \mathbb{R}^n \mapsto \mathbb{R}$. The set of test functions is associated with an extremely strong notion of convergence:

$$
\phi_n \underset{\mathcal D}{\to} \phi  \Leftrightarrow  \begin{cases}
\exists[a,b], ~ \forall n, ~~  \phi_n = 0~~\text{outside of } [a,b]\\
\phi = 0~~\text{outside of } [a,b] \\
\forall k, ~~ \phi_n^{(k)} \underset{u}{\to} \phi^{k}
\end{cases}
$$

In other words, the tests functions have a compact support and are $C^{+\infty}$.

The space of distribution is the topological dual of $\mathcal D$, denoted $\mathcal{D}^*$, i.e., a distribution $T$ is a continuous linear map on $\mathcal D$. In other words,

$$T \colon
\begin{aligned}
\mathcal{D} &\to \mathbb{C}\\
\phi & \to <T,\phi>
\end{aligned}$$

with the following properties:


- $<T, a\phi + b\varphi> = a<T, \phi> + b<T,\varphi>$
- Si $\phi_n \to \phi$ alors $<T, \phi_n> \to <T, \phi>$

We say that $T_n \overset{\mathcal{D}'}{\to} T$ if and only if $\forall \phi \in \mathcal{D}, ~~ <T_n, \phi> \to <T,\phi>$.



## Regular Distributions

We denote by  $L^1_{\text{loc}}$  the set of measurable and locally integrable functions, i.e. $\forall a < b \in \mathbb{R},~~ \int_a^b \vert f(x) \vert dx < \infty$.

It is relatively easy to see that if $f \in L^1_{\text{loc}}$ et $\phi \in \mathcal D$ then the product $f\phi$ is integrable. Then, any function $f \in L^1_{\text{loc}}$ uniquely defines a distribution, denoted $f$ by abuse of notation:

$$f \colon \phi \in \mathcal{D} \to <f,\phi> \overset{def}{=} \int_{-\infty}^{+\infty} f(x)\phi(x)dx$$

Therefore, we can identify $L^1_{\text{loc}}$ as a subset of the space of distributions $\mathcal{D}'$. This subset defines *regular* distributions. A distribution that is not regular is singular.

## Convolution, the *multiplication* of distributions

Given $f$ and $g$, two measurable functions, then the $f$ and $g$ can be convolved if and only if for almost all $x$

$$h(x) = \int \vert f(u)g(x-u)\vert du < +\infty$$

Then, we define convolution between two functions by:

$$f \star g(x) = \int f(u)g(x-u) du, \text{almost everywhere}$$

Convolution obviously has the commutativity property. It has regularization property on $f$. For instance, if we take $g(x) = \frac 1 {2h} 1_{[-h,h]}(x)$, $f \star g$ represents the moving average of $f$.

We can generalize the convolution operator for the space of distributions. We say that $S$ and $T$ are convolvable if and only if $\forall \phi \in \mathcal D$, the expression $<S_x, <T_y, \phi(x+y)>>$ is well-defined.

At first sight, convolution of distributions looks like composition of functions. Obviously, one might wonder when this expression is well-defined. Unfortunately, we would have to introduce the space of Schwartz distributions, which is outside the scope of this article. Therefore, we will only invoke $D_+'$, the space of distributions with positive and compact support, i.e a subset of $[0,+\infty[$.

The good news is that the convolution is well-defined for any function of $D_+'$.
In particular, the dirac distribution is the neutral element for $\star$. Indeed,

$$<\delta \star T, \phi> = <\delta_x, <T_y, \phi(x+y)>> = <T_y, \phi(0+y)> = <T,\phi>$$

Finally, let us consider the effect of the derivated dirac by the convolution operator:

$$<T\star \delta', \phi> = <T_x,<\delta'_y, \phi(x+y)>> = <T_x, -<\delta_y, \phi'(x+y)>> = <T', \phi> $$

That is to say $T\star \delta' = T'$ and $T \star \delta^{(k)} = T^{(k)}$.

The convolution of a distribution $T$ by the $k$-th derivative of the dirac distribution is the $k$-th derivative of the distribution!


# Laplace Transform and the algebra over $D_+'$


$(D_+', +, \times, \star)$ is an associative, commutative and unitary algebra. Precisely, it is a Banach \*-algebra usually denoted $L^1(G)$.
$\times$ denotes the scalar multiplication. We denote by $T^{\star n}$ the $n$ times composition of the convolution of $T$ by itself.
For any locally integrable function $f$, $Hf$ belongs to $D_+'$ where $H$ is the Heavyside distribution[^3].

[^3]: If the product of two distribution is not defined in general, the product of a distribution by a $C^{\infty}$ function is not a problem.

Notice that $\delta'' = \delta' \star \delta' = (\delta')^{\star^2}$ and that a polynomial of $\delta'$ is defined by $P(\delta') = \delta^{(n)} + a_{n-1}\delta^{(n-1)}+\ldots+a_0\delta$. Therefore, if $T\in D_+'$ then $P(\delta')\star T = T^{(n)}+ a_{n-1}T^{(n-1)}+\ldots+a_0T$.

We can create an isomorphism $\mathcal L$ between algebraic fractions in $\delta'$ and the usual algebraic fractions such that:

$$\begin{array}{c  c  c}
\star & \leftrightarrow & \times\\
\delta & \leftrightarrow & 1\\
c\delta & \leftrightarrow & c \\
\delta' & \leftrightarrow & p \\
\delta^{(n)} & \leftrightarrow & p^n\\
P(\delta') & \leftrightarrow & P(p)
\end{array}$$

In particular, $\mathcal L$ needs to satisfy the following conditions:
$\mathcal L\{ f \star g\} = F(s)G(s)$ and $\mathcal L^{-1}\{ f g\} = (f \star g)(t)$ where $F = Hf$ and $G = Hg$.

This transformation is known as Laplace transform and can be explicited by:

$$\forall f\in L^1_{\text{loc}}, ~ \mathcal L[f](\lambda) = \int_0^{+\infty} f(t)e^{-\lambda t}dt$$

However, we do not need to compute any transformation analytically, and we can just work with the property of our newly defined algebra.

It is easy to show that $P(\delta')^{\star -1} \leftrightarrow \frac 1 {P(p)}$. Hence, $Q(\delta')\star P(\delta')^{\star -1} \leftrightarrow \frac {Q(p)} {P(p)}$.

Another remarkable relation is given by
$He^{\lambda t} = (\delta'-\lambda \delta)^{\star -1} \leftrightarrow \frac 1 {p - \lambda}$

!!! remark "Proof:"
	We have $\delta = \delta' \star H$. Multiplying each side by $e^{\lambda t}$ leads to:
	$\delta' \star He^{\lambda t} = \lambda e^{\lambda t} H + \delta e^{\lambda t}$
	but $\delta e^{\lambda t} = 1$ and therefore $\delta' \star He^{\lambda t} - \lambda He^{\lambda t} = 1$

	And therefore, $He^{\lambda t} = (\delta'-\lambda \delta)^{\star -1}$ which can be directly transformed into $\frac 1 {p - \lambda}$.


## Some examples of correspondance

From the previous relation, we can deduce the following one:

$H\frac {t^{n-1}}{(n-1)!} e^{\lambda t} \leftrightarrow \frac 1 {(p - \lambda)^n}$

In particular $\lambda = 0$ : $H\frac {t^{n-1}}{(n-1)!} \leftrightarrow \frac 1 {p^n}$

Obviously, with the exponential decomposition, we can obtain the relations with all trigonometric functions:

 - $H \frac {sin (\omega t)}{\omega } \leftrightarrow \frac 1 {p^2 + \omega^2}$
 - $H cos (\omega t) \leftrightarrow \frac p {p^2 + \omega^2}$
 - $H \frac {sh (\omega t)}{\omega } \leftrightarrow \frac 1 {p^2 - \omega^2}$
 - $H ch (\omega t) \leftrightarrow \frac p {p^2 - \omega^2}$

 A list of Laplace transform for some usual functions can be found [here](https://en.wikipedia.org/wiki/List_of_Laplace_transforms).


# Application to the Initial Value Problem (IVP)


Consider the following system of ordinary differential equations:

$$\left\{\begin{aligned}
x'+y' = f\\
x+y''=g
\end{aligned}\right.$$

with $f$ and $g$ in $L^1_{\text{loc}}$, given, and the initial values $x(0)$, $y(0)$ and $y'(0)$ also given.

This system is non-homogeneous because of $f$ and $g$, coupled because the dependent variables appear in more than one equation, and linear.

To solve this, the first step is to transform our system in $D_+'$ by defining $X = Hx$, $Y=Hy$, $F=Hf$ et $G=Hg$ , définie par $0$ sur $\mathbb{R}^{-}$ et $1$ sur $\mathbb{R}^{+}$.

To completely rewrite the system, we need to obtain $X'$ as well as $Y'$ and $Y''$. By applying the derivative of Heaviside, we obtain $X'=Hx'+x(0)\delta$ and $Y'=Hy'+y(0)\delta$.
Doing the same for $Y'$ leads to $Y''=Hy''+y'(0)\delta + y(0)\delta'$.

Thus, our system is equivalent to the following in $D_+'$:

$$\left\{\begin{aligned}
X'+Y'& = F + (x(0)+y(0))\delta\\
X+Y''& = G + y(0)\delta'+y'(0)\delta
\end{aligned}\right.$$

The second step is to apply Laplace transform to obtain a pure algebraic system:

$$\left\{\begin{aligned}
pX + pY & = F + x(0)+y(0)\\
X+p^2Y & = G + y(0)p+y'(0)
\end{aligned}\right.$$

Which is equivalent to:

$$\begin{aligned}
\begin{pmatrix}
p & p\\
1 & p^2
\end{pmatrix}  & \begin{pmatrix}
X \\
Y
\end{pmatrix} & = & \begin{pmatrix}
F + x(0)+y(0) \\
G + y(0)p+y'(0)
\end{pmatrix}
\end{aligned}$$

In other words, our initial system is equivalent to a the linear system $AZ = B$.

The determinant of $A(p)$ is $det(A(p)) = p(p^2-1)$ such that we can calculate the inverse of $A$ and solve this sytem very easily.

$$A(p)^{-1} = \frac 1 {p(p^2-1)} \begin{pmatrix}
p^2 & -p\\
-1 & p
\end{pmatrix}$$

Therefore,

$$\begin{aligned}
\begin{pmatrix}
X \\
Y
\end{pmatrix} & = & \frac 1 {p(p^2-1)} \begin{pmatrix}
p^2 & -p\\
-1 & p
\end{pmatrix} &
\begin{pmatrix}
F + x(0)+y(0) \\
G + y(0)p+y'(0)
\end{pmatrix}
\end{aligned}$$

To obtain $X$ and $Y$, it is enough to apply the inverse of Laplace transform. 
For $x$:
$X = (x(0)+y(0))\frac p {p(p^2-1)} - y(0)\frac p {p^2 -1} - y'(0)\frac 1 {p^2 -1} + F \frac p {p^2 -1} - G \frac 1 {p^2 -1}$

For $t>0$, we have $x(t) = x(0)ch(t) - y'(0)sh(t)+\int_0^tf(s)ch(t-s)-g(s)sh(t-s)ds$.

Using a partial fracton decomposition, we obtain $y(t) = -x(0)(ch(t) -1)+y'(0)sh(t)+\int_0^tg(s)sh(t-s)-f(s)(ch(t-s)-1)ds$.

A basic verification consists in taking $t=0$ to observe that we verify the initial conditions.


To summarize, the method consists in rewriting the problem in $D_+'$, then expressing the system in a symbolic form, which is implicitely applying Laplace transform. The new problem is basically a linear system that can easily be solved for $p$. Once the solution obtained, the solution to the original problem can be found thanks to the inverse transformation.


# Conclusion

In this article, I tried to show another point of view on Laplace transform, and in particular, how it is possible to leverage the convolution algebra to avoid to have to explicitely compute Laplace transforms (or to refer to tables).
The isomorphism between the algebraic fractions in $\delta'$ and the usual algebraic fractions is absolutely remarkable and beautiful because it allows to solve analytically complex non-homogeneous, coupled and linear systems of ordinary differential equation without manipulating a single integral, but with basic algebra.

Notice that the method holds for systems without constant coefficient, but requires to solve more complex convolution equations to determine the correspondance. In some cases, it might be easier to refer to tables of Laplace transform. But it is obviously less beautiful!