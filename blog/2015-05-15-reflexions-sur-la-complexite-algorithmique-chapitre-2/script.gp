#################################################################################
#
#################################################################################

reset

set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 512, 280 
set output 'encadrement.png'

set clip two
set style fill  transparent solid 0.50 noborder
set key title "Domaine"
set key inside left top vertical Left reverse enhanced autotitles nobox
set key noinvert samplen 1 spacing 1 width 0 height 0 
set style function filledcurves y1=0
set title "Encadrement du nombre d’opérations" 
set xrange [ 0.00000 : 100.00000 ] noreverse nowriteback
set xlabel "Taille de l’instance"
set ylabel "Nombre d’opérations"
unset colorbox

f1_min(x)=x*x
f1_max(x)=x*x*log(x)/2
f2_min(x)=0
f2_max(x)=x*x+2000*abs(cos(x))
f3_min(x)=5000
f3_max(x)=x**(6./5)*log(x**5+2*x**3+7*x**2)+5000
plot '+' using 1:(f1_max($1)):(f1_min($1)) with filledcurves closed lc rgb "forest-green" title "f", \
	 '+' using 1:(f2_max($1)):(f2_min($1)) with filledcurves closed lc rgb "gold" title "g", \
	 '+' using 1:(f3_max($1)):(f3_min($1)) with filledcurves closed lc rgb "red" title "h"

#################################################################################
#
#################################################################################

reset

set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 512, 280 
set output 'encadrement2.png'

set clip two
set style fill  transparent solid 0.50 noborder
set key title "Domaine"
set key inside left top vertical Left reverse enhanced autotitles nobox
set key noinvert samplen 1 spacing 1 width 0 height 0 
set style function filledcurves y1=0
set title "Encadrement asymptotique du nombre d’opérations" 
set xrange [ 0.00000 : 100.00000 ] noreverse nowriteback
#set yrange [ 0 : 100 ] noreverse nowriteback
set xlabel "Taille de l’instance"
set ylabel "Nombre d’opérations"
unset colorbox

f1_min(x)=x*x
f1_max(x)=x*x*log(x)
f2_min(x)=0
f2_max(x)=x*x
f3_min(x)=5000
f3_max(x)=x**(6./5)*log(x**5)+5000
plot '+' using 1:(f1_max($1)):(f1_min($1)) with filledcurves closed lc rgb "forest-green" title "f", \
	 '+' using 1:(f2_max($1)):(f2_min($1)) with filledcurves closed lc rgb "gold" title "g", \
	 '+' using 1:(f3_max($1)):(f3_min($1)) with filledcurves closed lc rgb "red" title "h"


#################################################################################
#
#################################################################################

reset

set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 512, 280 
set output 'encadrement3.png'

set clip two
set xlabel "Taille de l’instance"
set ylabel "Nombre d’opérations"
#set key title "Domaine"
set key inside left top vertical Left reverse enhanced autotitles nobox
set key noinvert samplen 1 spacing 1 width 0 height 0 
set style function filledcurves y1=0
#set title "Encadrement asymptotique du nombre d’opérations" 
set xrange [ 0.00000 : 100.00000 ] noreverse nowriteback
#set yrange [ 0 : 100 ] noreverse nowriteback
unset colorbox

f1_min(x)=x*x
f1_max(x)=x*x*log(x)
f2_min(x)=0
f2_max(x)=x*x
f3_min(x)=5000
f3_max(x)=x**(6./5)*log(x**5)+5000

g1_min(x)=x*x
g1_max(x)=x*x*log(x)/2
g2_min(x)=0
g2_max(x)=x*x+2000*abs(cos(x))
g3_min(x)=5000
g3_max(x)=x**(6./5)*log(x**5+2*x**3+7*x**2)+5000

set style fill  transparent solid 0.50 noborder
set style fill transparent pattern 4 border
plot '+' using 1:(g1_max($1)):(g1_min($1)) with filledcurves closed lc rgb "forest-green" title "Exact" fs solid, \
	 '+' using 1:(f1_max($1)):(f1_min($1)) with filledcurves closed lc rgb "forest-green" title "Asymptotique"

#################################################################################
#
#################################################################################

reset

set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 512, 280 
set output 'encadrement32.png'

set clip two
set xlabel "Taille de l’instance"
set ylabel "Nombre d’opérations"
#set key title "Domaine"
set key inside left top vertical Left reverse enhanced autotitles nobox
set key noinvert samplen 1 spacing 1 width 0 height 0 
set style function filledcurves y1=0
#set title "Encadrement asymptotique du nombre d’opérations" 
set xrange [ 0.00000 : 10000000.00000 ] noreverse nowriteback
#set yrange [ 0 : 100 ] noreverse nowriteback
unset colorbox

f1_min(x)=x*x
f1_max(x)=x*x*log(x)
f2_min(x)=0
f2_max(x)=x*x
f3_min(x)=5000
f3_max(x)=x**(6./5)*log(x**5)+5000

g1_min(x)=x*x
g1_max(x)=x*x*log(x)/2
g2_min(x)=0
g2_max(x)=x*x+2000*abs(cos(x))
g3_min(x)=5000
g3_max(x)=x**(6./5)*log(x**5+2*x**3+7*x**2)+5000

set style fill  transparent solid 0.50 noborder
set style fill transparent pattern 4 border
plot '+' using 1:(g1_max($1)):(g1_min($1)) with filledcurves closed lc rgb "forest-green" title "Exact" fs solid, \
	 '+' using 1:(f1_max($1)):(f1_min($1)) with filledcurves closed lc rgb "forest-green" title "Asymptotique" 

#################################################################################
#
#################################################################################

reset

set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 512, 280 
set output 'encadrement4.png'
set xlabel "Taille de l’instance"
set ylabel "Nombre d’opérations"
set clip two

#set key title "Domaine"
set key inside left top vertical Left reverse enhanced autotitles nobox
set key noinvert samplen 1 spacing 1 width 0 height 0 
set style function filledcurves y1=0
#set title "Encadrement asymptotique du nombre d’opérations" 
set xrange [ 0.00000 : 100.00000 ] noreverse nowriteback
#set yrange [ 0 : 100 ] noreverse nowriteback
unset colorbox

f1_min(x)=x*x
f1_max(x)=x*x*log(x)
f2_min(x)=0
f2_max(x)=x*x
f3_min(x)=5000
f3_max(x)=x**(6./5)*log(x**5)+5000

g1_min(x)=x*x
g1_max(x)=x*x*log(x)/2
g2_min(x)=0
g2_max(x)=x*x+2000*abs(cos(x))
g3_min(x)=5000
g3_max(x)=x**(6./5)*log(x**5+2*x**3+7*x**2)+5000

set style fill  transparent solid 0.50 noborder
set style fill transparent pattern 4 border
plot '+' using 1:(g2_max($1)):(g2_min($1)) with filledcurves closed lc rgb "gold" title "Exact" fs solid, \
	 '+' using 1:(f2_max($1)):(f2_min($1)) with filledcurves closed lc rgb "gold" title "Asymptotique"
	 	 
#################################################################################
#
#################################################################################

reset

set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 512, 280 
set output 'encadrement5.png'
set xlabel "Taille de l’instance"
set ylabel "Nombre d’opérations"
set clip two

#set key title "Domaine"
set key inside left top vertical Left reverse enhanced autotitles nobox
set key noinvert samplen 1 spacing 1 width 0 height 0 
set style function filledcurves y1=0
#set title "Encadrement asymptotique du nombre d’opérations" 
set xrange [ 0.00000 : 100.00000 ] noreverse nowriteback
#set yrange [ 0 : 100 ] noreverse nowriteback
unset colorbox

f1_min(x)=x*x
f1_max(x)=x*x*log(x)
f2_min(x)=0
f2_max(x)=x*x
f3_min(x)=0
f3_max(x)=x**(6./5)*log(x**5)

g1_min(x)=x*x
g1_max(x)=x*x*log(x)/2
g2_min(x)=0
g2_max(x)=x*x+2000*abs(cos(x))
g3_min(x)=5000
g3_max(x)=x**(6./5)*log(x**5+2*x**3+7*x**2)+5000

set style fill  transparent solid 0.50 noborder
set style fill transparent pattern 4 border
plot '+' using 1:(g3_max($1)):(g3_min($1)) with filledcurves closed lc rgb "red" title "Exact" fs solid, \
	 '+' using 1:(f3_max($1)):(f3_min($1)) with filledcurves closed lc rgb "red" title "Asymptotique"
	 	 
#################################################################################
#
#################################################################################

reset

set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 512, 280 
set output 'encadrement6.png'
set xlabel "Taille de l’instance"
set ylabel "Nombre d’opérations"
set clip two

#set key title "Domaine"
set key inside left top vertical Left reverse enhanced autotitles nobox
set key noinvert samplen 1 spacing 1 width 0 height 0 
set style function filledcurves y1=0
#set title "Encadrement asymptotique du nombre d’opérations" 
set xrange [ 0.00000 : 1000.00000 ] noreverse nowriteback
#set yrange [ 0 : 100 ] noreverse nowriteback
unset colorbox

f1_min(x)=x*x
f1_max(x)=x*x*log(x)
f2_min(x)=0
f2_max(x)=x*x
f3_min(x)=0
f3_max(x)=x**(6./5)*log(x**5)

g1_min(x)=x*x
g1_max(x)=x*x*log(x)/2
g2_min(x)=0
g2_max(x)=x*x+2000*abs(cos(x))
g3_min(x)=5000
g3_max(x)=x**(6./5)*log(x**5+2*x**3+7*x**2)+5000

set style fill  transparent solid 0.50 noborder
set style fill transparent pattern 4 border
plot '+' using 1:(g3_max($1)):(g3_min($1)) with filledcurves closed lc rgb "red" title "Exact" fs solid, \
	 '+' using 1:(f3_max($1)):(f3_min($1)) with filledcurves closed lc rgb "red" title "Asymptotique"
	 	 
#################################################################################
#
#################################################################################

reset

set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 512, 280 
set output 'ecart_asymptotique.png'
set xlabel "Taille de l’instance"
set ylabel "Ratio exact / estimation"
set clip two

#set key title "Domaine"
set key inside right center vertical Left reverse enhanced autotitles nobox
set key noinvert samplen 1 spacing 1 width 0 height 0 
set style function filledcurves y1=0
set title "Ratio de la différence entre la valeur exacte et l’estimation aymptotique." 
set xrange [ 0.00000 : 1000.00000 ] noreverse nowriteback
set yrange [ -0.1 : 1.1 ] noreverse nowriteback
unset colorbox

f1_max(x)=x*x*log(x)
f2_max(x)=x*x
f3_max(x)=x**(6./5)*log(x**5)

g1_max(x)=(x*x*log(x))/2
g2_max(x)=x*x+2000*abs(cos(x))
g3_max(x)=x**(6./5)*log(x**5+2*x**3+7*x**2)+5000

f(x)=abs(g1_max(x)-f1_max(x))/g1_max(x)
g(x)=abs(g2_max(x)-f2_max(x))/g2_max(x)
h(x)=abs(g3_max(x)-f3_max(x))/g3_max(x)

set style fill  transparent solid 0.50 noborder
set style fill transparent pattern 4 border
plot f(x) title "f" w line lc rgb "forest-green", \
	 g(x) title "g" w line lc rgb "gold", \
	 h(x) title "h" w line lc rgb "red"

#################################################################################
#
#################################################################################

reset

set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 512, 280 
set output 'ecart_asymptotique_zoom.png'
set xlabel "Taille de l’instance"
set ylabel "Ratio exact / estimation"
set clip two

#set key title "Domaine"
set key inside right top vertical Left reverse enhanced autotitles nobox
set key noinvert samplen 1 spacing 1 width 0 height 0 
set style function filledcurves y1=0
set title "Ratio de la différence entre la valeur exacte et l'estimation aymptotique." 
set xrange [ 0.00000 : 100.00000 ] noreverse nowriteback
set yrange [ -0.1 : 1.1 ] noreverse nowriteback
unset colorbox

f1_max(x)=x*x*log(x)
f2_max(x)=x*x
f3_max(x)=x**(6./5)*log(x**5)

g1_max(x)=(x*x*log(x))/2
g2_max(x)=x*x+2000*abs(cos(x))
g3_max(x)=x**(6./5)*log(x**5+2*x**3+7*x**2)+5000

f(x)=abs(g1_max(x)-f1_max(x))/g1_max(x)
g(x)=abs(g2_max(x)-f2_max(x))/g2_max(x)
h(x)=abs(g3_max(x)-f3_max(x))/g3_max(x)

set style fill  transparent solid 0.50 noborder
set style fill transparent pattern 4 border
plot g(x) title "g" w line lc rgb "gold", \
	 h(x) title "h" w line lc rgb "red"

#################################################################################
#
#################################################################################	 	 	 	 

set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 512, 280 
set output 'histogramme.png'
set clip two
set style fill  transparent solid 0.25 border 0.25
set boxwidth 0.5 absolute
set title "Multiplication de la capacité par 2."
set xlabel "Nombre d’insertions"
set ylabel ""
set xrange [0.1 : 10.9]
set yrange [0 : 20]
set xtic 1
set ytic 2
moy(x)=2.5
cap(x)=7.5
plot cap(x) title "Moyenne de la capacité" w line lc rgb "red", \
	 moy(x) title "Moyenne du nombre d’opérations" w line lc rgb "forest-green", \
	'histogramme.txt' u ($1):($3) i 0 title 'Capacité' with boxes lc rgb "red", \
	'histogramme.txt' u ($1):($2) i 0 title "Nombre d’opérations" with boxes lc rgb "forest-green"
	 
#################################################################################
#
#################################################################################	 	 	 	 

set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 512, 280 
set output 'histogramme2.png'
set clip two
set style fill  transparent solid 0.25 border 0.25
set boxwidth 0.5 absolute
set title "Ajout de 3 à la capacité."
set xlabel "Nombre d’insertions" 
set xrange [0.1 : 10.9]
set yrange [0 : 20]
set xtic 1
set ytic 2
moy(x)=2.8
cap(x)=6.6
plot cap(x) title "Moyenne de la capacité" w line lc rgb "red", \
	 moy(x) title "Moyenne du nombre d’opérations" w line lc rgb "forest-green", \
	'histogramme.txt' u ($1):($3) i 1 title 'Capacité' with boxes lc rgb "red", \
	'histogramme.txt' u ($1):($2) i 1 title "Nombre d’opérations" with boxes lc rgb "forest-green"
	 
#################################################################################
#
#################################################################################	 	 	 	 

set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 512, 280 
set output 'histogramme3.png'
set clip two
set style fill  transparent solid 0.25 border 0.25
set boxwidth 0.5 absolute
set title "Ajout de 1 à la capacité." 
set xlabel "Nombre d’insertions"
set xrange [0.1 : 10.9]
set yrange [0 : 20]
set xtic 1
set ytic 2
moy(x)=5.5
cap(x)=5.5
plot cap(x) title "Moyenne de la capacité" w line lc rgb "red", \
	 moy(x) title "Moyenne du nombre d’opérations" w line lc rgb "forest-green", \
	'histogramme.txt' u ($1):($3) i 2 title 'Capacité' with boxes lc rgb "red", \
	'histogramme.txt' u ($1):($2) i 2 title "Nombre d’opérations" with boxes lc rgb "forest-green"
	 

#################################################################################
#
#################################################################################	 	 	 	 

reset

set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 512, 280 
set output 'comparaison.png'
set xlabel "Taille de l’instance"
set ylabel "Nombre d’opérations"
set clip two
set style fill  transparent solid 0.50 noborder
set key title "Domaine"
set key inside left top vertical Left reverse enhanced autotitles nobox
set key noinvert samplen 1 spacing 1 width 0 height 0 
set style function filledcurves y1=0
set title "Comparaison de la complexité exacte de deux algorithmes de classe différente." 
set xrange [ 0.00000 : 60.00000 ] noreverse nowriteback
unset colorbox

f2(x)=x*x*x
f1(x)=50*x**2+50*x+5000
plot f1(x) lc rgb "forest-green" title "f", \
	 f2(x) lc rgb "red" title "g", \
	 f1(x)-f2(x) w l title 'f-g'

#################################################################################
#
#################################################################################	 	 	 	 

reset

set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 512, 280 
set output 'simplexe.png'

set clip two
set style fill  transparent solid 0.15 border
set key title "Contraintes"
set key inside right top vertical Right  enhanced autotitles nobox
set key noinvert samplen 1 spacing 1 width 0 height 0 
set style function filledcurves y1=0
set title "Domaine admissible pour le problème d’optimisation linéaire." 
set xrange [0 : 21] noreverse nowriteback
set yrange [0:21]
unset colorbox
set termoption dashed


f(x)=-(6/11.)*x
c1(x)=-x+20
c2(x)=-(3/15.)*x+225/15.
c3(x)=-(5/10.)*x+16.

plot c1(x) linetype 1 lc rgb "forest-green" title 'x+y < 20', \
	 c2(x) linetype 1 lc rgb "red" title '3x+15y < 225', \
	 c3(x) linetype 1 lc rgb "gold" title '5x+10y < 160', \
	 ((c1(x) < c3(x)) ? c1(x) : 1/0) w l linetype 18 linecolor rgb 'black' t '', \
	 ((c2(x) < c3(x)) ? c2(x) : 1/0) w l linetype 18 linecolor rgb 'black' t '', \
	 ((c3(x) < c2(x) & c3(x) < c1(x)) ? c3(x) : 1/0) w l linetype 18 linecolor rgb 'black' t '', \
	 (abs(c1(x)-c3(x)) < 0.05 ? c1(x) : 1/0) w p linecolor rgb 'black' linetype 7 t '', \
	 (abs(c3(x)-c2(x)) < 0.030304 ? c3(x) : 1/0) w p linecolor rgb 'black' linetype 7 t '', \
	 (x == 0 ? 15 : 1/0) w p linecolor rgb 'black' linetype 7 t '', \
	 (abs(x - 20) < 0.1 ? 0 : 1/0) w p linecolor rgb 'black' linetype 7 t '', \
	 (x < 0.1 ? 0 : 1/0) w p linecolor rgb 'black' linetype 7 t ''




reset
f(x,y)=-abs(sin(x)*cos(y)*exp(abs(1- (sqrt(x**2+y**2)/pi))))
set xrange [0:6.3]
set yrange [1.5:7.9]
set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 512, 280 
set output 'newton1.png'
splot f(x,y)
set isosample 250, 250
set table 'test.dat'
splot f(x,y)
unset table

set contour base
set cntrparam level incremental -3, 0.5, 3
unset surface
set table 'cont.dat'
splot f(x,y)
unset table

reset
set xrange [0:6.3]
set yrange [1.5:7.9]
unset key
set palette rgbformulae 33,13,10

set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 512, 280 
set output 'newton2.png'
p 'test.dat' with image, 'cont.dat' w l lt -1 lw 1.5



reset
f(x,y)=-abs(sin(x)*cos(y)*exp(abs(1-(sqrt(x**2+y**2)/pi))))
set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 512, 280 
set output 'newton3.png'
set border 4095 front lt black linewidth 1.000 dashtype solid
set style line 100  linecolor rgb "#f0e442"  linewidth 0.500 dashtype solid pointtype 5 pointsize default pointinterval 0
set view 50, 220, 1, 1
set samples 30, 30
set isosamples 30, 30
unset surface 
set ticslevel 0
set title "Fonction Hölder Table" 
set xrange [0:6.3]
set yrange [1.5:7.9]
set zrange [ -5.0000 : 5.0000 ] noreverse nowriteback
set cbrange [ -5.0000 : 0.00000 ] noreverse nowriteback
set pm3d implicit at st
x = -7.0
## Last datafile plotted: "$PALETTE"
splot f(x,y) t ''
