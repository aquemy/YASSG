---
Title: Réconcilier mathématiciens et physiciens via les distributions
Date: 2014-08-14 16:41
Category: Mathématiques
Tags: Mathématiques
Lang: fr
---

[TOC]


# Introduction

On entend souvent les mathématiciens ou plutôt les étudiants en mathématiques s'esclaffer avec dédain du manque de rigueur de nos amis et confrères physiciens voire de leur reprocher de « sauter » des étapes que l'on considérerait essentielles en mathématiques et de fait, invalider leurs calculs.

Ce petit article est là pour essayer de réconcilier les puristes chevronnés et les utilisateurs pas forcément au fait des fondements mathématiques sur lesquels reposent leurs outils. Il ne s'agit cependant pas de faire un cours sur la théorie des distributions mais de présenter l'outil et quelques caractéristiques essentielles pour les applications, justifiant bon nombre de comportements du physicien. Aussi, on finira par une application directe à la résolution de systèmes différentiels loin d'être évidents, justifiant au passage une approche dite par « calcul symbolique » développée par les physiciens avant la justification mathématique.

L'objectif de cette très brève introduction est donc plutôt de vous inciter à en apprendre davantage sur cette fabuleuse notion qu'est la distribution en mettant à la lumière du jour à la fois des propriétés qui simplifient la vie de tous, et des applications à des problèmes non-triviaux qui deviennent dès lors d'une simplicité enfantine.

# L'objet de toutes les convoitises

Paul Dirac, grand physicien et mathématicien, célèbre entre autres pour sa prévision de l'existence de l'antimatière, utilisait, pour les besoins de son sujet de prédilection, la mécanique quantique, un bien curieux objet que l'on appelle aujourd'hui distribution de dirac du côté des mathématiciens ou impulsion ou masse de Dirac du côté des physiciens[^1]. Cet objet, noté $\delta$, est défini de la manière suivante :

$$\begin{aligned}[t]
\delta(0) = +\infty \\
\forall t\in \mathbb{R}^*,~~ \delta(t) = 0 \\
\int_\mathbb{R}  \delta(t)dt = 1
\end{aligned}$$

Ceux d'entre vous, chers lecteurs, qui possèdent quelques notions de mathématiques, en particulier d'intégration, sauterons au plafond de voir un tel objet ! Comment une telle fonction peut-elle exister ? En effet, la théorie de l'intégration de Lebesgue (qui englobe celle de Riemann pour ceux qui ne la connaisse pas), montre qu'une fonction nulle presque partout[^2] est d'intégrale nulle ! Aussi, l'intégrale devrait ici être nulle ce qui n'est pas le cas.

Cette affaire aurait pu en rester à l'état de délire de physicien mais en réalité, les travaux utilisant cette _fonction_ se révélèrent tous très fructueux dans la pratique, tout en restant non-fondés du point de vue mathématique. C'est alors que Laurent Schwartz s'intéressa au problème qui ne cessa alors de le remuer durant de longs mois et fini par le conduire à donner naissance à la théorie des distributions pour enfin réconcilier physiciens et mathématiciens.

Il n'obtint pas le prix Nobel de la paix pour cela, mais pourra tout de même se consoler d'une très belle médaille Fields pour cette théorie des distributions.

Qu'on se le dise tout de suite, la dirac n'est **pas** une fonction, c'est une distribution. Le concept de distribution est une généralisation de l'analyse classique en étendant la notion de fonctions.

Dans un premier temps, il nous faudra aborder brièvement l'espace des fonctions _tests_ avant de pouvoir définir une distribution. Dans un second temps on donnera rapidement quelques propriétés spectaculaires des distributions.

# L'espace des fonctions tests

L'idée des distributions est qu'une distribution est caractérisée par l'effet qu'elle peut avoir sur certaines fonctions. Pour pouvoir travailler sur l'ensemble de toutes les distributions, il nous faut un domaine commun que l'on note $\mathcal D$ et qui s'appelle l'ensemble des fonctions tests.

Cet ensemble contient les fonctions de $\mathbb{R}$ dans $\mathbb{C}$ qui sont infiniment dérivables et à support compact. Pour simplifier mon propos, ici un support compact signifie que pour chaque fonction de $\mathcal D$ il existe un intervalle $[a,b]$, différent pour chaque fonction évidemment, tel que la fonction est nulle en dehors de cet intervalle.

Une fonction $\phi \in \mathcal D$ est appelée une fonction test. On associe alors à cet ensemble une relation *extrêmement* forte de convergence :

$$
\phi_n \underset{\mathcal D}{\to} \phi  \Leftrightarrow  \begin{cases}
\exists[a,b], ~ \forall n, ~~  \phi_n = 0~~\text{hors de } [a,b]\\
\phi = 0~~\text{hors de } [a,b] \\
\forall k, ~~ \phi_n^{(k)} \underset{u}{\to} \phi^{k}
\end{cases}
$$

En d'autres termes, une suite de fonctions tests converge dans $\mathcal D$ si et seulement si il existe un intervalle hors duquel tous les éléments de la suite sont nuls, que la fonction limite est nulle en dehors de cet intervalle et que toute suite dérivée converge vers la dérivée de la limite.

# L'espace des distributions

Nous voila au coeur du sujet. On appelle distribution toute forme linéaire continue sur l'espace $\mathcal D$. On dit que l'espace des distributions est le dual topologique de $\mathcal D$ et on le note en conséquence $\mathcal{D}'$.

Ainsi, une distribution se définit comme suit :

$$T \colon
\begin{aligned}
\mathcal{D} &\to \mathbb{C}\\
\phi & \to <T,\phi>
\end{aligned}$$

Avec les propriétés de linéarité et de continuité :

- $<T, a\phi + b\varphi> = a<T, \phi> + b<T,\varphi>$
- Si $\phi_n \to \phi$ alors $<T, \phi_n> \to <T, \phi>$

On dit que $T_n \overset{\mathcal{D}'}{\to} T$ si et seulement si $\forall \phi \in \mathcal{D}, ~~ <T_n, \phi> \to <T,\phi>$.

Les raisons de la notation entre chevrons dépassent le cadre de ce petit article frivole mais il faut cependant insister sur le fait que $<T,\phi> = T(\phi)$ c'est à dire l'évaluation de la distribution $T$ en la fonction $\phi$.

Ces définitions sont très jolies mais ne permettent pas de resituer la dirac et encore moins de comprendre en quoi est-ce qu'une distribution généralise les fonctions usuelles. C'est pourquoi on va étudier une classe particulière de distributions appelée l'espace des distributions régulières.

## Distribution régulières et singulières

Rappelons que l'on dénote par $L^1_{\text{loc}}$ l'ensemble des fonction de $\mathbb{R}$ dans $\mathbb{C}$ qui sont mesurables et localement intégrables, c'est à dire que $\forall a < b \in \mathbb{R},~~ \int_a^b \vert f(x) \vert dx < \infty$ (qui est un critère suffisant d'intégrabilité au sens de Lebesgue).

Il est relativement aisé de voir que si $f \in L^1_{\text{loc}}$ et $\phi \in \mathcal D$ alors le produit $f\phi$ est intégrable. Alors, toute fonction $f \in L^1_{\text{loc}}$ définit une distribution que l'on peut noter $f$ (pour des raisons techniques d'identification passées sous silence ici), de la façon suivante :

$$f \colon \phi \in \mathcal{D} \to <f,\phi> \overset{def}{=} \int_{-\infty}^{+\infty} f(x)\phi(x)dx$$

On peut ainsi identifier $L^1_{\text{loc}}$ à un sous ensemble de l'espace des distributions $\mathcal{D}'$. Ce sous-ensemble définit l'espace des distributions **régulières**. Par excès d'originalité, toute distribution qui n'est pas régulière est **singulière** !

Venons en maintenant aux choses intéressantes : les propriétés de ces fameuses distributions.

## Ce qui va vous faire aimer les distributions

La dérivée d'une distribution ? Pas de soucis, elle existe toujours et est donnée par la formule suivante, assez simple à démontrer dans le cas de distributions régulières :

Soit $T$ une distribution, alors, $\forall \phi \in \mathcal D,~~ <T', \phi> = - <T, \phi'>$. On peut même généraliser très facilement à la dérivée d'ordre $k$ : $<T^{k}, \phi> = (-1)^k <T, \phi^{k}>$.

Notons que la dérivée de $T$ est toujours une distribution, ce qui justifie par récurrence l'existence de la dérivée à tout ordre. Une seconde remarque serait de dire que si $T$ est dérivable au sens des fonctions, alors la dérivée au sens des fonctions et la dérivée au sens des distributions coïncident. En ce sens les distributions généralisent les fonctions en donnant une notion de dérivée plus faible que celle des fonctions. En effet, une fonction non-dérivable au sens classique peut admettre une dérivée au sens des distributions.

Enchainons sur les propriétés remarquables :

- Une suite dérivées de distributions converge vers la dérivée de la limite, ce qui s'exprime par :
Si $T_n \to T$ alors $T'_n \to T'$
- Corollaire de la propriété précédente : la dérivée de la somme est la somme des dérivées :
$(\sum T_n)' = \sum T'_n$
- Toute limite simple de distributions est une distribution !

Cela n'a l'air de rien mais cela implique de manière très naturelle tout ce qui peut faire sauter un plafond un mathématicien non initié aux distributions lorsqu'il voit un physicien travailler : inversion de somme et intégrale, inversion de limite et intégrale, etc. Le tout sans aucune justification préalable si ce n'est que $T$ est une distribution.

## Et les couacs dans tout ça ?

Évidemment, il existe un petit inconvénient aux distributions. On peut démontrer qu'il n'y a pas de définition générale possible pour la multiplication de distributions. Comme nous le verrons, en pratique cela n'a pas beaucoup d'importance puisqu'une autre opération s'apparente à la multiplication.

On peut cependant dire qu'il est possible de multiplier une distribution par une fonction infiniment dérivable. Cela se passe tout simplement et naturellement de la manière suivante :

Soit $\rho \in C^{\infty}$ et $T \in \mathcal{D}'$ alors $\rho T$ est une distribution et $< \rho T, \phi> = < T, \rho \phi>$.

Remarquons que c'est évident si $T$ est une distribution régulière, mais cela ne l'est pas nécessairement pour une distribution singulière.

## Vous reprendez bien un peu de dirac ?

!!! note "Remarque:"
    La démonstration qui suit est une démonstration « historique » qui ne s'applique qu'à la dirac dans le sens où l'on considère $\phi$ simplement continue et non pas appartenant à l'espace des fonctions tests (c'est à dire à support compact, infiniment dérivable). Elle n'utilise aucune notation et notion que l'on a explicitée plus haut dans l'article.

Avant de pouvoir définir la convolution, que l'on pourrait voir comme la multiplication de distributions, il est important de revenir sur la dirac. C'est l'exemple historique et essentiel de distribution singulière et également ce qui fera office d'élément neutre pour la convolution, comme $1$ est neutre pour la multiplication dans le corps des scalaires.

On commencera par la démonstration un peu technique mais d'intérêt historique qui montre que la dirac est une distribution.

Commençons par prendre une suite de fonctions $f_n$ positives telle que $\int_{-\infty}^{+\infty}f_n(x)dx = 1$ et soit nulle en dehors d'un intervalle $[a_n,b_n]$ avec $a_n$ et $b_n$ qui tendent vers $0$. Prenons également une fonction $\phi$ positive et continue.

Ainsi, on a $\int_{-\infty}^{+\infty}\phi(x)f_n(x)dx = \int_{a_n}^{b_n}\phi(x)f_n(x)dx$.

Notons $m_n = min(\phi(x) ~\vert~ x\in [a_n,b_n])$ et $M_n = max(\phi(x)~\vert~x\in [a_n,b_n])$.

Par définition, nous avons :

$$m_n \int_{a_n}^{b_n}f_n(x)dx \leq \int_{a_n}^{b_n}\phi(x)f_n(x)dx \leq M_n \int_{a_n}^{b_n}f_n(x)dx$$

Comme $\int_{-\infty}^{+\infty}f_n(x)dx = \int_{a_n}^{b_n}f_n(x)dx = 1$, car le support de $f_n$ est $[a_n,b_n]$, on a alors :

$$m_n  \leq \int_{a_n}^{b_n}\phi(x)f_n(x)dx \leq M_n$$

D'après le théorème de la moyenne, on peut trouver un $c_n \in [a_n, b_n]$ tel $\int_{a_n}^{b_n}\phi(x)f_n(x)dx = \phi(c_n)\int_{a_n}^{b_n}f_n(x)dx$, mais comme on a $a_n \leq c_n \leq b_n$ et que $a_n \to 0$ et $b_n \to 0$, cela implique que $c_n \to 0$ et donc, après passage à la limite, on obtient $\int_{-\infty}^{+\infty}\phi(x)f_n(x)dx = \phi(0)$.

On retrouve donc une définition de la dirac cohérente avec son utilisation. L'effet de la dirac sur une fonction continue $\phi$ est de retourner cette fonction évaluée en $0$ : $\delta(\phi) = \phi(0)$, que l'on préfère noter en mathématiques $<\delta, \phi>$.

De fait, même si l'on ne dispose pas d'une définition analytique au sens usuel du terme pour la dirac, on peut en définir sa dérivée :

$$<\delta', \phi> = -<\delta, \phi'> = -\phi'(0)$$

!!! note "Remarque:"
    Pour éviter toute confusion, il nous faut introduire une notation pratique nous permettant d'indiquer la variable muette qui lie la distribution et la fonction test. On notera ainsi $<S_x, \phi(x)>$ pour expliciter le fait que $S$ va influer sur $\phi$ au travers de la variable $x$. $x$ est évidemment muette : $<S_x, \phi(x)> = <S_y, \phi(y)>$.

Cependant, on peut également définir la translatée d'une distribution de manière très simple. Si l'on translate de $\tau$ la distribution $T$ : $<\tau T, \phi> = <T, -\tau \phi>$. Comme ce n'est pas très visuelle et pratique, on note plutôt la translatée par $a$ : $<T_{x-a}, \phi(x+a)>$. Aussi dans le cas de la dirac, translater par $a$ revient à évaluer la fonction $\phi$ au point $-a$ mais par abus commode de notation, on note $\delta_a = \phi(a)$.

Montrons à présent l'intérêt de la dérivation au sens des distributions. Prenons une fonction continue par morceaux en présentant des « sauts » au niveau de l'ensemble des points $\{a_i\}$, c'est à dire que la limite à droite et à gauche d'un point existe et sera notée respectivement $f(a_i^+)$ et $f(a_i^-)$. Et on notera $\Delta a_i = f(a_i^+) - f(a_i^-)$. Enfin, on note $\{f\}'$ la dérivée de la fonction $f$ au sens des fonctions. On peut donc écrire cette fonction $f(x)=\sum_i f(x)1_{\{a_i <~x~\leq a_{i+1}\}}(x)$.

La fonction $f$ est bien intégrable localement, et donc elle définit une distribution (régulière). On peut la dériver au sens des distributions :

$$\begin{aligned}
<f',\phi> & = -<f,\phi'> \\
& =  -\int_{-\infty}^{+\infty}\sum_i f(x)1_{\{a_i < ~x~ \leq a_{i+1}\}}(x) \phi'(x) dx \\
& =  -\sum_i -\int_{a_i}^{a_{i+1}}f(x)\phi'(x)\\
& =  -\sum_i([f(x)\phi(x)]_{a_i}^{a_{i+1}} - \int_{a_i}^{a_{i+1}} \{f\}'\phi(x)dx)~~~ \text{Par une intégration par parties}\\
& = \int_{-\infty}^{+\infty} \{f\}'\phi(x) dx + \sum_i \delta f(a_i)\phi(a_i)
\end{aligned}$$

C'est à dire que $<f',\phi> = <\{f\}',\phi> + \sum_i\delta f(a_i)<\delta_{a_i},\phi>$, que l'on peut écrire plus simplement au sens des distributions : $f' = \{f\}' + \sum_i\delta f(a_i)\delta_{a_i}$.

Si l'on prend l'exemple simple d'une fonction étagée, c'est à dire constante par morceaux avec limite à gauche et à droite, on voit bien la dérivée au sens classique est nulle alors que la dérivée au sens des distributions ne l'est pas et porte l'information sur les discontinuités : une masse de dirac en chaque point de discontinuité facteur du « saut ».

Une autre question importante à laquelle cette dérivation permet de répondre est : quelle est donc la primitive de la dirac ? On peut vérifier très facilement qu'il s'agit de la fonction de Heaviside, notée $H$, qui vaut $0$ pour un argument négatif et $1$ pour un argument positif. De fait, il s'agit d'une fonction constante par morceaux et l'on obtient $H' = \delta$, ce qui sera très utile pour le calcul symbolique que l'on présentera en fin d'article.

## La convolution, la « multiplication » des distributions

Il faut évidemment faire un petit rappel du produit de convolution de fonctions. Soit $f$ et $g$ deux fonctions mesurables, alors $f$ et $g$ sont convolables si et seulement si pour presque tout $x$ :

$$h(x) = \int \vert f(u)g(x-u)\vert du < +\infty$$

On définit alors le produit de convolution :

$$f \star g(x) = \int f(u)g(x-u) du, \text{presque partout} $$

Le produit de convolution est évidemment commutatif. Il possède des propriétés régularisantes sur la fonction $f$. Ainsi, par exemple, si l'on prend $g(x) = \frac 1 {2h} 1_{[-h,h]}(x)$, $f \star g$ représente les moyennes mobiles de $f$, très utilisées pour obtenir la tendance de courbes bruitées (par exemple d'évolution de taux bancaires).

Comme toujours en mathématiques lorsque l'on généralise une notion, on va essayer de généraliser les opérations qui s'applique à l'objet d'origine. En l'occurrence, on va essayer de généraliser la notion de produit de convolution pour les distributions.

Sans donner de démonstration, on dira que $S$ et $T$ sont convolables, si et seulement si, $\forall \phi \in \mathcal D$, l'expression $<S_x, <T_y, \phi(x+y)>>$ est bien définie.

La convolution de distribution est donc l'analogue à la composition de fonctions en quelque sorte. Sauf que la définit est quelque peut imprécise : quand est-ce qu'une telle expression est bien définie ? Cela nous amènerait malheureusement des considérations un peu plus techniques que jusqu'à présent et de fait, on donnera vaguement, de manière imprécise les quelques éléments suivants :

$\epsilon'$ est l'ensemble des distributions à support compact et $D_+'$ est l'ensemble des distributions à support positif, c'est à dire inclu dans $[0,+\infty[$. De manière assez simpliste, cela signifie que votre distribution sera nulle en dehors de ce support, pour n'importe quelle fonction $\phi$.

En réalité, ce cas correspond à une majorité si ce n'est la totalité des applications physiques où le temps commence à $0$ (on parle de phénomène causal).

La bonne nouvelle est que si $S$ ou $T$ est à support compact, alors le produit de convolution entre $S$ et $T$ existe !

Notons également l'importance de la dirac pour le produit de convolution. En effet, la dirac est l'élement neutre de pour l'opération $\star$. En voici la démonstration :

$$<\delta \star T, \phi> = <\delta_x, <T_y, \phi(x+y)>> = <T_y, \phi(0+y)> = <T,\phi>$$

L'autre sens se fait très facilement (ou en justifiant la commutativité de l'opération).

Encore mieux ! Regardons l'effet de la dérivée de la dirac par produit de convolution :

$$<T\star \delta', \phi> = <T_x,<\delta'_y, \phi(x+y)>> = <T_x, -<\delta_y, \phi'(x+y)>> = <T', \phi> $$

C'est à dire que $T\star \delta' = T'$ et par extension $T \star \delta^{(k)} = T^{(k)}$ !

# Initiation au calcul symbolique

Nous sommes désormais prêt à nous attaquer au calcul symbolique ! En fait, pas tout à fait. Pour justifier l'utilisation du calcul symbolique, il nous faut énoncer un petit théorème très facile à vérifier :

$(D_+', +, \times, \star)$ est une algèbre associative, commutative et unitaire. $\times$ dénote la multiplication scalaire. C'est important car cela nous permettra de créer un isomorphisme entre les fractions rationnelles en $\delta'$ et les fraction rationnelles « usuelles ». On notera la composée $n$ fois de la convolution de $T$ par lui même, par $T^{\star n}$.

Avant de se lancer corps et âme, étudions juste une petite équation de convolution toute mignonne, et l'inverse des polynômes en $\delta'$.

Soit $A,B \in D_+'$, on cherche $X\in D_+'$ tel que $A\star X = B$, ou pour simplifier, $A\star X = \delta$. C'est à dire répondre à la question : est-ce que toute distribution de $D_+'$ admet un inverse pour l'opération de convolution ? La réponse est oui : cet inverse existe et est unique !

Remarquons que $\delta'' = \delta' \star \delta' = (\delta')^{\star^2}$ et aussi qu'un polynome en $\delta'$ est défini par $P(\delta') = \delta^{(n)} + a_{n-1}\delta^{(n-1)}+\ldots+a_0\delta$. Ainsi, si $T\in D_+'$ alors $P(\delta')\star T = T^{(n)}+ a_{n-1}T^{(n-1)}+\ldots+a_0T$.

Pour faciliter nos calculs, on introduit le calcul symbolique :

$$\begin{array}{c  c  c}
\star & \leftrightarrow & \times\\
\delta & \leftrightarrow & 1\\
c\delta & \leftrightarrow & c \\
\delta' & \leftrightarrow & p \\
\delta^{(n)} & \leftrightarrow & p^n\\
P(\delta') & \leftrightarrow & P(p)
\end{array}$$

On peut montrer facilement (exercice pour le lecteur) que $P(\delta')^{\star -1} \leftrightarrow \frac 1 {P(p)}$ et de fait $Q(\delta')\star P(\delta')^{\star -1} \leftrightarrow \frac {Q(p)} {P(p)}$.

On donnera également cette relation qui se montre extrêmement facilement :
$He^{\lambda t} \leftrightarrow (\delta'-\lambda \delta)^{\star -1} \leftrightarrow \frac 1 {p - \lambda}$

C'est, disons le, la seule relation à connaître vulgairement *par coeur*, même si l'on peut la retrouver facilement. À partir de celle-ci on peut retrouver l'ensemble des exemples que je donne juste après.

## Quelques exemples de correspondances

$H\frac {t^{n-1}}{(n-1)!} e^{\lambda t} \leftrightarrow \frac 1 {(p - \lambda)^n}$

Et en particulier pour $\lambda = 0$ : $H\frac {t^{n-1}}{(n-1)!} \leftrightarrow \frac 1 {p^n}$

Évidemment, avec la décomposition de l'exponentielle, on peut obtenir toutes les relations entre les fonctions trigonométriques :

 - $H \frac {sin (\omega t)}{\omega } \leftrightarrow \frac 1 {p^2 + \omega^2}$
 - $H cos (\omega t) \leftrightarrow \frac p {p^2 + \omega^2}$
 - $H \frac {sh (\omega t)}{\omega } \leftrightarrow \frac 1 {p^2 - \omega^2}$
 - $H ch (\omega t) \leftrightarrow \frac p {p^2 - \omega^2}$

Je vous invite vivement à essayer de trouver vous même les équivalents à partir de $He^{\lambda t}$ et son équivalent symbolique pour constater de la simplicité enfantine de laquelle ils résultent.

## Application à la résolution de systèmes différentiels de Cauchy

Jusqu'ici le calcul symbolique s'est apparenté à un casse tête pour aucun bénéfice. Pourquoi donc faire correspondre à un polynôme en $\delta'$ un polynome en $p$ ou tout simplement l'opération de convolution avec le produit usuel ?

La réponse est très simple : cela permet de résoudre des systèmes différentiels compliqués à l'aide d'opérations algébriques très simples sur les polynômes !

Rentrons dans le vif du sujet.

$$\left\{\begin{aligned}
x'+y' = f\\
x+y''=g
\end{aligned}\right.$$

Avec $f$ et $g$ appartenant à $L^1_{\text{loc}}$, données, et les conditions initiales $x(0)$, $y(0)$ et $y'(0)$ donnés.

Il s'agit donc de déterminer une fonction $x$ et $y$ satisfaisant ces contraintes. Cela se passe en plusieurs étapes.

La première, pour pouvoir travailler avec notre calcul symbolique, est de transformer notre système dans $D_+'$. Pour cela, il s'agit simplement de poser $X = Hx$, $Y=Hy$, $F=Hf$ et $G=Hg$ où $H$ est la distribution de Heaviside [^3], définie par $0$ sur $\mathbb{R}^{-}$ et $1$ sur $\mathbb{R}^{+}$.

De fait, pour réécrire le système il nous faut $X'$ ainsi que $Y'$ et $Y''$. Par application de la dérivée sur la distribution de Heaviside, on obtient $X'=Hx'+x(0)\delta$ et de la même manière $Y'=Hy'+y(0)\delta$.
On applique la même chose à $Y'$ : $Y''=Hy''+y'(0)\delta + y(0)\delta'$.

Et donc, notre système est équivalent dans $D_+'$ à :

$$\left\{\begin{aligned}
X'+Y'& = F + (x(0)+y(0)\delta\\
X+Y''& = G + y(0)\delta'+y'(0)\delta
\end{aligned}\right.$$

La seconde étape est de transcrire ce système symboliquement :

$$\left\{\begin{aligned}
pX + pY & = F + x(0)+y(0)\\
X+p^2Y & = G + y(0)p+y'(0)
\end{aligned}\right.$$

Ce qui donne en écriture matricielle :

$$\begin{aligned}[t]
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

Ce qui est en fait un système linéaire équivalent à $AZ = B$.

Le déterminant de $A(p)$ est $det(A(p)) = p(p^2-1)$ et de fait, on peut calculer l'inverse de $A$ et résoudre ce système très facilement.

$$A(p)^{-1} = \frac 1 {p(p^2-1)} \begin{pmatrix}
p^2 & -p\\
-1 & p
\end{pmatrix}$$

Et ainsi,

$$\begin{aligned}[t]
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

Ainsi, on peut obtenir $X$ et $Y$ très facilement, et la solution au problème initiale on faisant l'étape inverse de correspondance. Voici l'exemple détaillé pour $x$ et on donnera la solution directement pour $y$.

$X = (x(0)+y(0))\frac p {p(p^2-1)} - y(0)\frac p {p^2 -1} - y'(0)\frac 1 {p^2 -1} + F \frac p {p^2 -1} - G \frac 1 {p^2 -1}$

Pour $t>0$, on a alors $x(t) = x(0)ch(t) - y'(0)sh(t)+\int_0^tf(s)ch(t-s)-g(s)sh(t-s)ds$.

C'est un tout petit peu plus « délicat » pour obtenir $y$ car il faut faire une séparation en fractions simples et on obtient $y(t) = -x(0)(ch(t) -1)+y'(0)sh(t)+\int_0^tg(s)sh(t-s)-f(s)(ch(t-s)-1)ds$.

Il est évidemment possible de faire une vérification d'usage avec $t=0$ et l'on retrouve bien nos conditions initiales.


En résumé, la méthode consiste à réécrire le problème dans $D_+'$ (on peut évidemment s'attaquer à des problèmes pour une variable à valeur négative, il suffit de « retourner » le temps et de séparer le problème en deux parties), puis à écrire le problème sous forme symbolique. De fait, on se ramène à la résolution d'un système linéaire. Une fois la solution exprimée en fonction de $p$, on repasse dans l'espace initial grâce à nos correspondances bien utiles !

Cela vous semble compliqué pour résoudre ce genre de problèmes ? Essayez-donc de résoudre ce problème par des méthodes plus traditionnelles et vous verrez le gain immédiatement. Il suffit ici de manipuler des polynomes, un calcul de déterminant et d'inverse d'une matrice, ainsi qu'éventuellement une décomposition en fractions simples, ce qui est au programme de L1 d'algèbre. On ne manipule JAMAIS directement d'intégrale et de calcul compliqué. Cerise sur le gateau, cette méthode permet de trouver des solutions qu'une approche classique ne permet pas de trouver, notamment grâce à la propriété étonnante de la dirac qui est de conserver les points de discontinuité en passant à la dérivée.

# Le mot de la fin

Un petit mot de la fin pour citer encore plus de bienfaits des distributions. Elles ont permis notamment d'unifier de nombreuses notions de dérivées, plus faibles que la dérivée usuelle dans un tas d'applications physiques. Ces applications physiques sont d'une extrême utilité, notamment pour la résolution d'équations différentielles linéaires, non-linéaires, stationnaires ou d'évolutions.

C'est ainsi que pour résoudre un problème du type diffusion de la chaleur :

$\frac {\delta u} \delta t - \Delta u = 0$ avec $u(0,t) = 0$ et $u(x,0) = u_0$ (problème d'évolution, avec limite de Dirichlet (chaleur nulle sur le bord du domaine) et une condition de Cauchy (une certaine distribution de chaleur au temp initial), alors au lieu de résoudre directement le problème et obtenir ce que l'on appelle une solution **forte**, on passe par une formulation dite faible, plus simple à résoudre, qui donne une solution dite **faible**. A partir de la solution faible on montre très facilement (avec les distributions) l'unicité entre la solution faible et forte !

Pour ceux que cela intéresse, la formulation forte est une formulation du type :

$$a(u,v) = L(v)$$

Sous certaines hypothèses (bilinéarité, continuité et ellipticité de la forme $a$, et continuité et linéarité pour $$L$) on peut appliquer le théorème de Lax-Milgram, dérivant de Riesz, qui garantit l'existence et l'unicité de la solution à cette formulation.

[^1]: On entend également parler de « fonction de Dirac » mais ce terme n'est pas exact même s'il peut se comprendre historiquement, avant la découverte des distributions.
[^2]: Attention, la notion de « presque partout » est clairement définie et parfaitement mathématique. Grosso modo, il s'agit d'une propriété qui est vraie sauf pour un ensemble non-mesurable. On renvoie à la théorie de la mesure.
[^3]: Si le produit de deux distributions n'est pas faisable en générale, le produit d'une distribution et d'une fonction $C^{\infty}$, comme l'est l'exponentielle, ne pose aucun soucis.
