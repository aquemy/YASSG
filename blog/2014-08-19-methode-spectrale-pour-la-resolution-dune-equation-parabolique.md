---
Title: Méthode spectrale pour la résolution d'une équation parabolique
Date: 2014-08-19 20:40
Category: Mathématiques
Tags: Mathématiques
Lang: fr
---

[TOC]

# Introduction et définition du problème

L'objectif de cet article est de présenter l'application d'une approche spectrale pour la résolution d'équation d'évolution de type parabolique. L'étude théorique sera mêlée et guidée par la résolution pratique d'un problème type.

Soit $a\frac{\partial^2 u}{\partial x^2} + b\frac{\partial^2 u}{\partial xy} + c\frac{\partial^2 u}{\partial y^2} + d\frac{\partial u}{\partial x} + e\frac{\partial u}{\partial y} + fu = g$ une équation aux dérivées partielles linéaire du second ordre avec $a,b,c,d,e,f$ des constantes. Une telle équation est dite parabolique lorsque $b^2-4ac=0$ et respectivement elliptique et hyperbolique pour des quantités strictement inférieures ou supérieures à 0.

Un problème est dit d'évolution s'il dépend du temps. Un problème qui n'est pas d'évolution est dit stationnaire et peut être dans une certaine mesure vu comme la limite à l'infini d'un problème d'évolution. Ainsi, si l'étude du Laplacien peut être vu comme la limite de l'équation de la chaleur pour un temps tendant vers l'infini.

Le problème étudié est le suivant :

$$
(P)\begin{cases}
\frac{\partial u}{\partial t} - \Delta u = f(x,y,t)\in L^2(\Omega ), \Omega= ]0,1[\times]0,1[\times ]0,T[\cr
u(x,0,t)=\frac{x^2}{2}\cr
u(x,1,t)=\frac{-(x-1)^2}{2}e^{-t}\cr
\frac{\partial u}{\partial n}(0,y,t) = -ye^{-t}\cr
\frac{\partial u}{\partial n}(1,y,t) = 1-y\cr
u(x,y,0) = sin(2\pi y)-x^2y+xy-\frac{y}{2}+\frac{x^2}{2} \end{cases}
$$

Le problème modélise donc la diffusion de la chaleur au cours du temps sur une plaque carrée d'un matériau homogène, chauffée selon une source $f$ quelconque, d'énergie finie. La condition au bord de Dirichlet nous renseigne sur le comportement de la chaleur sur les bords verticaux, et la condition au bord de Neumann nous renseigne sur la direction de la chaleur sur les bords horizontaux.

Enfin, la condition initiale nous renseigne sur la distribution initiale de la chaleur sur la plaque.

# Opération de relèvement

Les conditions au bord n'étant pas homogènes, il nous faut tout d'abord transformer le problème $(P)$ en un problème homogène.

Pour cela on pose $w(x,y,t) = \phi(x,y) + u(x,y,t)$. À la vue des conditions au bord, on cherche donc une surface réglée $\phi(x,y)$ telle que $(P)$ soit homogène en $w$.

## Recherche de la surface réglée

Nous cherchons $\phi(x,y) = g_1(x) + yg_2(y)$.

À l'aide des conditions au bords nous obtenons :

$$\begin{cases}w(x,0,t) = \phi(x,0) + u(x,0,t) = 0 \Rightarrow \boxed{g_1(x) = -\frac{x^2}{2}}\\
w(x,1,t) = \phi(x,1) + u(x,1,t) = 0 \Rightarrow \boxed{g_2(x) = (x^2 - x + \frac{1}{2})e^{-t}}\end{cases}$$

Ainsi la fonction $\phi$ cherchée est la suivante :

$$\boxed{\phi(x,y) = -\frac{x^2}{2} + y(x^2 - x + \frac{1}{2})e^{-t}}$$

## Réécriture du problème homogène

Nous avons $w(x,y,t) = \phi(x,y) + u(x,y,t)$, donc par linéarité de l'opérateur Laplacien, nous avons $- \Delta u(x,y,t) = \Delta \phi(x,y) - \Delta w(x,y,t)$. De même, $\frac{\delta u}{\delta t}(x,y,t) = \frac{\delta w}{\delta t}(x,y,t) - \frac{\delta \phi}{\delta t}(x,y,t)$

Ainsi $\frac{\delta w}{\delta t}(x,y,t) - \Delta w(x,y,t) = f(x,y,t) + \Delta \phi(x,y,t) - \frac{\delta \phi}{\delta t}(x,y,t)$.

Par définition de $\phi$ :

$$\frac{\delta u}{\delta t}(x,y,t) - \Delta \phi = 1-y(1+e^{-t}(x^2-x+\frac{3}{2}))$$

Cela nous permet d'écrire l'équivalence suivante :

$$(P) \Leftrightarrow (P_h)\begin{cases}
\frac{\partial w}{\partial t} - \Delta w = f(x,y,t) + 1-y(1+e^{-t}(x^2-x+\frac{3}{2})), f\in L^2(\Omega ), \Omega=  ]0,1[\times]0,1[\times ]0,T[\cr
w(x,0,t)=0\cr
w(x,1,t)=0\cr
\frac{\partial w}{\partial n}(0,y,t) = 0\cr
\frac{\partial w}{\partial n}(1,y,t) = 0\cr
w(x,y,0) = sin(2\pi y)-x^2y+xy-\frac{y}{2}+\frac{x^2}{2} \end{cases}$$

# Résolution problème spectral associé à $(P_h)$

Dans un premier temps nous nous intéressons uniquement à la partie spatiale du problème. Le Laplacien étant un opérateur linéaire et compact, cherchons ses valeurs $\lambda_k$ et les fonctions propres associées $w_k$, solution de l'équation : 

$$-\Delta w = \lambda w~~(PS)$$

Ces solutions existent presque partout dans $L^2(\Omega)$ grace au théorème de décomposition spectrale suivant:

Soit $V$ et $H$ deux espaces de Hilbert réels de dimension infinie. On suppose que $V \subset H$ avec injection compacte (c'est à dire que l'opérateur d'inclusion est continu et compact) et que $V$ est dense dans $H$. Soit $a(.,.)$ une forme bilinéaire symétrique continue et $V$-elliptique. Alors les valeurs propres du problème $\forall v\in V,~~~ a(u,v) = \lambda<u,v>_H$ forment une suite croissante $(\lambda_k)_{k \geq 1}$ de réels positifs qui tend vers l'infini, et il existe une basse hilbertienne de $H$, $(u_k)_{k \geq 1}$, de vecteurs propres associées :

$$u_k \in V, {\text{ et }} a(u_k,v) = \lambda_k<u_k,v_k>_H, ~~~ \forall v \in V$$

En outre, $(\frac{u_k}{\sqrt{\lambda_k}})_{k \geq 1}$ est une base hilbertienne mais de l'espace $V$ muni du produit scalaire $a(.,.)$ (et pas son produit scalaire canonique).

La démonstration de ce théorème est assez longue et fait elle même appel au théorème de décomposition spectrale d'un opérateur compact dans un Hilbert. C'est par ailleurs la raison pour laquelle on a besoin de la compacité de l'opérateur d'inclusion et de sa continuité. Les détails peuvent se trouver dans [^1].

Pour tenir compte des conditions de Dirichlet sur un bord, on choisit $V=H_0^1(\Omega)$ et $H=L^2(\Omega)$. Une approche variationnelle appliquée à $-\Delta w = \lambda w$, conduit naturellement à trouver $a(u,v) = \int_{\Omega} \nabla u . \nabla v dx = \lambda \int_{\Omega} uv dx= \lambda <u,v>_{L^2(\Omega)}$. D'après le théorème de Rellich, $H_0^1(\Omega)$ est bien compactement inclus dans $L^2(\Omega)$. Comme l'espace des fonctions tests $\cal{D}(\Omega)$ est dense dans les deux espaces, on en déduit que $H_0^1(\Omega)$ est dense dans $L^2(\Omega)$ et l'on peut appliquer le théorème spectral ci-dessus, démontrant l'existence de solution du problème aux valeurs propres.

Pour retourner au problème d'origine, une formule de Green suffit, en tenant compte des conditions au bords et en utilisant le théorème de trace pour conclure. On peut plus simplement passer par les distributions, ayant déjà vérifiée l'injection compacte et continue :

$$\begin{matrix}~  \int_{\Omega} \nabla u . \nabla v dx = \lambda \int_{\Omega} uv dx\cr
\Leftrightarrow < \nabla u , \nabla v > = \lambda < u, v>\cr
\Leftrightarrow -< \Delta u , v > = \lambda < u, v>\end{matrix}$$

D'où $-\Delta u = \lambda u$ au sens des distributions. De la densité de $\cal D$ dans $H_0^1$ et $L^2$ et par l'injection canonique compacte, on en déduit l'équivalence au sens de $L^2$.

Maintenant que l'on s'est convaincu de l'existence des solutions de $(PS)$, il s'agit d'expliciter ces solutions. Pour cela, on va considérer une séparation des variables en posant : $w(x,t)=X(x)Y(y)$.

A partir des conditions au bord nous pouvons déduire que :

$$\begin{cases}w(x,0) = 0 = X(x)Y(0) \Rightarrow \boxed{Y(0)=0}\\
w(x,1) = 0 = X(x)Y(1)\Rightarrow \boxed{Y(1)=0}\end{cases}$$

$$\frac{\delta w}{\delta x}(0,y) = X_(x)Y(y) \Rightarrow \boxed{\begin{cases} X'(0)=0\\X'(1)=0\end{cases}}$$

Ainsi : 

$$\begin{matrix}~ (PS) & \Leftrightarrow & -X"(x)Y(y) - X(x)Y"(y) = \lambda X(x)Y(y) \cr
& \Leftrightarrow &-\frac{X"(x)}{X(x)} - \frac{Y"(y)}{Y(y)} = \lambda \cr
&\Rightarrow &
    \begin{cases}
        - \frac{X"(x)}{X(x)}=\alpha~~~(*)\cr
        - \frac{Y"(y)}{Y(y)}=\beta~~~(**)\cr
        \alpha+\beta = \lambda
    \end{cases}
\end{matrix}$$


La résolution ne pose aucun soucis puisque $(*)$ et $(**)$ sont des équations différentielles linéaire du second ordre à coefficients constants. Une simple analyse de l'équation caractéristique nous donne la forme de la solution et les conditions sur $X'$ et $Y$ déduites des conditions au bord du problème homogène permettent d'éliminer des solutions qui sont identiquement nulles et donc pas intéressante ni d'un point de vue mathématique et encore moins d'un point de vue physique.

### Résolution de $(*)$

$$- \frac{X"(x)}{X(x)}=\alpha \Rightarrow -X"(x) - \alpha X(x) = 0$$

De l'équation caractéristique nous trouvons :

$$\Delta = -4\alpha$$

On distingue alors 3 cas :

### $\alpha > 0$

Ainsi $\Delta < 0$ et $X$ est de la forme $X(x) = A_x cos(\sqrt \alpha x) + B_x sin(\sqrt \alpha x)$.

On en déduit que $X'(x) = -\sqrt \alpha A_x sin(\sqrt \alpha x) + \sqrt \alpha B_x cos(\sqrt \alpha x)$.

Des conditions aux limites on en déduit que :

$$\begin{cases}X'(0) = \sqrt \alpha B_x = 0 \Rightarrow B_x = 0\\
X'(1) = -\sqrt \alpha A_x sin(\sqrt \alpha) = 0 \Rightarrow sin(\sqrt \alpha) = 0\end{cases}$$

On en déduit que $\alpha_k = k^2\pi^2, \forall k>0$ et donc $X_k(x) = A_xcos(k\pi x), \forall k>0$.

### $\alpha = 0$

Ainsi $\Delta = 0$ et $X$ est de la forme $X(x) = A_xx + B_x$. On en déduit que $X'(x) = -\sqrt \alpha A_x sin(\sqrt \alpha x) + \sqrt \alpha B_x cos(\sqrt \alpha x)$.

Des conditions aux limites on en déduit que :

$$X'(0) = A_x = 0$$

Donc $X(x) = B_x$, solution constante.

### $\alpha < 0$

Ainsi $\Delta < 0$ et $X$ est de la forme $X(x) = A_xe^{-\sqrt(-\alpha)x} + B_xe^{\sqrt(-\alpha)x}$. Des conditions aux limites on en déduit que $A_x = B_x = 0$. Donc $X \equiv 0$, ce qui n'est pas intéressant.

### Formulation finale

Finalement, nous pouvons regrouper les deux écritures en une seule, sous la forme suivante :

$$X_k(x) = C_xcos(k\pi x), \forall k \geq 0$$

Avec : 

$$C_x = \begin{cases}
 B_x & \text{ si } k=0 \cr
 A_x & \text{ si } k>0
\end{cases}$$

## Résolution de $(**)$

De la même manière nous résolvons l'équation $(**)$.
De l'équation caractéristique nous trouvons :

$$\Delta = -4\beta$$

On distingue alors 3 cas :

### Cas $\beta > 0$

Ainsi $\Delta < 0$ et $Y$ est de la forme $Y(y) = A_y cos(\sqrt \beta x) + B_y sin(\sqrt \beta x)$.

Des conditions aux limites on en déduit que :

$$\begin{cases}Y(0) = 0 \Rightarrow A_y = 0\\
Y(1) = 0 \Rightarrow sin(\sqrt \beta) = 0\end{cases}$$

On en déduit que $\beta_k = k^2\pi^2, \forall k>0$ et donc $Y_k(y) = A_ysin(k\pi y), \forall k>0$.

### Cas $\beta = 0$

Ainsi $\Delta = 0$ et $Y$ est de la forme $Y(y) = A_yy + B_y$.

Des conditions aux limites on en déduit que :

$$\begin{cases}Y(0) = B = 0\\
Y(1) = A = 0\end{cases}$$

Donc $Y \equiv 0$, ce qui n'est pas intéressant.

### Cas $\beta > 0$

Ainsi $\Delta < 0$ et $Y$ est de la forme $Y(y) = A_ye^{-\sqrt(-\beta)y} + B_ye^{\sqrt(-\beta)y}$.

Des conditions aux limites on en déduit que $A_y = B_y = 0$.

Donc $Y \equiv 0$, ce qui n'est pas intéressant.


### Formulation finale

La solution de $(**)$ s'écrit donc :

$$Y_k(y) = B_ysin(k\pi y), \forall k > 0$$

# Réecriture du problème dans la base propre

Par la résolution de $(*)$ et $(**)$ nous en déduisant que les valeurs propres et vecteurs propres de l'opérateur Laplacien sont :

$$\begin{cases}
w_{k,l}(x,y) = Csin(l\pi y)cos(k\pi x)\\
\lambda _k = \pi^2(l^2 + k^2)
\end{cases}, \forall k \geq 0$$

D'après le théorème de Riesz-Fredholm cité plus haut, il existe une base hilbertienne (orthonormale par définition) de fonctions propres de $L^2(\Omega)$ appartenant à $H^1_0(\Omega)$ et une suite croissante de valeurs propres positives qui tendent vers l'infini.

## Normalisation des vecteurs de base

Avant de réécrire le problème dans la base de fonctions propres ainsi trouvées, déterminons la constante $C$ telle que la base soit orthonormale dans $L^2(\omega)$.

Résolvons :

$$\begin{matrix}
~ \vert \vert w_{l,k}\vert \vert_{L^2(\Omega)} = 1 & \Leftrightarrow & \int_0^1 \int_0^1 C^2sin^2(l \pi y) cos^2(k \pi x) dxdy \cr
& \Leftrightarrow & C^2
\underset{\frac{1}{2}}{\underbrace{\int_0^1 sin^2(l \pi y) dy}}
\underset{\frac{1}{2}}{\underbrace{\int_0^1 cos^2(k \pi x) dx}}\cr
& \Leftrightarrow &
    \begin{cases}
         C = \sqrt 2 & \text{ si } k=0 \cr
         C = 2 & \text{ sinon }
    \end{cases}
\end{matrix}$$

## Réécriture du problème dans la base propre

On peut écrire notre solution dans la base orthonormée trouvée :

$$ w(x,y) = \sum_{l,k}\xi_{l,k}(t)w_{l,k}(x,y)~~~ (S)$$

D'après l'énoncé du problème, $f\in L^2(\omega)$, ce qui implique que l'on peut également l'exprimer dans la base trouvée :

$$f(x,y) =  \sum_{l,k}f_{l,k}(t)w_{l,k}(x,y)$$

Avec $f_{l,k}(t) = <f(x,y,t), w_{l,k}(x,y)>_{L^2(\omega)}$, soit la projection de $f$ sur les vecteurs de la base hilbertienne ${w}_{l,k}$.

On peut donc réécrire le problème initial en $w$ de la manière suivante :

$$\begin{matrix}
~ & \frac{\partial w}{\partial t} - \Delta w = f(x,y,t) + 1-y(1+e^{-t}(x^2-x+\frac{3}{2})) & \cr
 \Leftrightarrow & \frac{\partial }{\partial t}\sum_{l,k}\xi_{l,k}(t)w_{l,k}(x,y) - \Delta \sum_{l,k}\xi_{l,k}(t)w_{l,k}(x,y) & \cr
 & = \sum_{l,k}f_{l,k}(t)w_{l,k}(x,y) + 1-y(1+e^{-t}(x^2-x+\frac{3}{2}))
\end{matrix}$$

En tant normal, il faudrait, pour une résolution complètement explicite, faire la projection de $1-y(1+e^{-t}(x^2-x+\frac{3}{2})$ sur la base de ${L^2(\omega)}$ trouvée, mais cela représente assez peu d'intérêt pour l'exercice.

On se contentera de poser $\overset{\sim }{f}(x,y) = f(x,y) + 1-y(1+e^{-t}(x^2-x+\frac{3}{2})$.

Cela permet de réécrire le problème de la manière suivante :

$$\frac{\partial }{\partial t}\sum_{l,k}\xi_{l,k}(t)w_{l,k}(x,y) - \Delta \sum_{l,k}\xi_{l,k}(t)w_{l,k}(x,y) = \sum_{l,k}\overset{\sim }{f}_{l,k}(t)w_{l,k}(x,y)$$

Nous utilisons la linéarité des opérateurs de dérivation pour faire entrer le Laplacien et la dérivée temporelle dans la somme et nous utilisons la relation $\Delta w = -\lambda w$ pour factoriser de la sorte :

$$\sum_{l,k}[\xi'_{l,k}(t) - \lambda_{l,k} \xi_{l,k}(t)]w_{l,k}(x,y) = \sum_{l,k}\overset{\sim }{f}_{l,k}(t)w_{l,k}(x,y)$$

Ce qui revient à résoudre une équation différentielle ordinaire :

$$\xi'_{l,k}(t) - \lambda_{l,k} \xi_{l,k}(t) = \overset{\sim }{f}_{l,k}(t)$$

# Résolution de l'équation différentielle ordinaire

La résolution de l'EDO se fait très simplement, en s'aidant des conditions initiales pour obtenir les $\xi_0$ et l'expression explicite des $\overset{\sim }{f}_{l,k}(t)$ en $0$.

La technique qui marche à tous les coups est évidemment la variation de la constante. Je laisse au lecteur le soin de faire ces calculs afin d'obtenir les $\xi_{l,k}(t)$.

# Solution finale

Une fois l'EDO résolue, le travail est terminé. Si réellement une expression explicite est désirée, il suffit de remplacer les $w_{l,k}$, les $\xi_{l,k}$, qui dépendent explicitement des $\overset{\sim }{f}_{l,k}$ dans l'expression de $(S)$.

On pourrait éventuellement travailler un peu plus pour donner, dans un cadre plus général, le lien entre les $\xi_{l,k}$, les $\overset{\sim }{f}_{l,k}$ et les valeurs propres. De même, si le terme source $f$ est donné explicitement, il faut calculer sa projection sur notre base afin d'obtenir une solution complètement explicite.

[^1]: _Analyse Numérique et Optimisation_, G. Allaire, Chapitre 7.
