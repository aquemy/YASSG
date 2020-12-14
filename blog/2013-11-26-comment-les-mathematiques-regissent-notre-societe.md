---
Title: Comment les mathématiques régissent notre société.
Date: 2013-11-26 15:43
Category: Mathématiques
Tags: Mathématiques
Lang: fr
---

[TOC]

# À propos

Le billet qui suit est une tentative de mettre en exergue l’omniprésence des mathématiques et l’utilisation des mathématiques dans nos sociétés. J’essaye également de montrer que par cette omniprésence et cette croyance dogmatique en les mathématiques, les mathématiques finissent par régir notre société.

Je n’ai pas la prétention de faire un article au sens scientifique du terme, ni même d’avoir une vision assez large pour traiter le sujet de manière pertinente ou en tout cas exhaustive et c’est pourquoi le qualificatif « billet » me semble plus adapté.

La forme de ce billet est un jeu de *questions et réponses* car cela me semblait pertinent et plus agréable à lire ou parcourir.

# « Comment les mathématiques régissent notre société »

> Est-ce que les mathématiques sont aussi présentes dans notre société que ce qu’on le dit ?

Les mathématiques sont bien plus présentes dans notre société qu’on pourrait ne serait-ce que se l’imaginer. Elles sont à la fois invisibles et partout.

Les mathématiques sont partout, à un niveau tel qu’il est devenu pratiquement impossible de les voir ou simplement de les concevoir si l’on n’y prête pas attention. Les mathématiciens sont partout, et secrètement complotent pour dominer le monde. Plus sérieusement, il n’y a rien aujourd’hui, qui ne soit entrepris sans une validation théorique des mathématiques puis l’aide des mathématiques, en tant que telles, seules, ou à l’aide de la synergie avec plusieurs autres domaines. Les mathématiques jouent aujourd’hui un rôle bien plus fort que le simple liant entre divers domaines, le simple langage de représentation et de modélisation scientifique. Elles sont présentes jusque dans la biologie, dans l’économie, la politique, dans tous les appareils autour de vous, toutes les constructions humaines.

Citons quelques exemples, où les mathématiques à la fois hautement théoriques et abstraites jouent un rôle crucial pour des applications :

- En physique nucléaire, et par rapport à la construction de chambres de confinement électromagnétique pour le contrôle du plasma, appelées Tokamak, comme celle du projet ITER. Ces chambres sont de forme torique et ce n’est certainement pas un hasard. Personne n’a essayé de construire une telle chambre de manière sphérique comme cela pourrait venir à l’idée de manière naturelle. Un résultat mathématique très fort, connu sous le drôle de nom du théorème de la boule chevelue, nous indique qu’il est impossible de construire une telle chambre car sur une sphère sur laquelle, en chaque point, s’applique un vecteur tangent à la surface, il existe au moins un point de cette sphère pour lequel le vecteur sera nul. On comprend bien qu’il existera toujours un point de fuite du plasma si l’on construit un tokamak sphérique puisqu’en au moins un point, le champ électromagnétique sera nul.

- Le câblage dans les avions ou le câblage d’un réseau pour un établissement peut être vu comme un problème d’arbre couvrant de poids minimal. On connait des algorithmes efficaces et même optimaux pour ce genre de tâches : algorithme de Prime ou de Kruskal par exemple. S’il est aisé de comprendre pourquoi l’algorithme fonctionne, pour prouver son optimalité, il faut avoir quelques notions mathématiques « avancées », notamment sur les systèmes d’indépendances, les bases d’un graphes, afin de montrer qu’un algorithme glouton est optimal pour un système d’indépendance dont les bases ont même cardinalité. Pourtant, dans la vie de tous les jours, nous avons besoin de certitudes quant à ces garanties de performance, ces optimalités ou simplement quantifier, qualifier les erreurs ou valider qu’on puisse utiliser tel ou tel algorithme, telle ou telle notion physique pour construire telle ou telle chose, qu’il faut s’assurer de respecter telles contraintes pour garantir un équilibre social ou économique, etc. Le besoin de certitudes est guidé par le besoin de pouvoir faire le bon choix, le « meilleur choix », en un sens à définir.

D’ailleurs, fait intéressant, remarquons qu’on donnant une borne au nombre de noeuds de l’arbre (par exemple la limite de branchement par _switch_ dans le cas du câblage d’un réseau) et l’on obtient un problème NP-Complet que nous ne savons donc pas résoudre de manière efficace avec garantie de performance sur des instances quelconques.

- Chaque fois que l’on utilise Google, des mathématiques hautement théoriques et puissantes entre en jeu pour donner un résultat le plus fiable possible, trier, classer, indexer. L’utilisation d’un moteur de recherche moderne en général est une belle illustration d’une application du calcul spectral dont on peut trouver une autre application dans la résolution de problème d’évolution (EDP elliptique non stationnaire). Citons ce [document](http://fr.scribd.com/doc/14158543/Classement-Des-Pages-Du-Web-Par-Les-Moteurs-de-Recherche), très accessible sur le sujet.

- Le couplage de la physique et des mathématiques a toujours existé et beaucoup de problématiques mathématiques proviennent en réalité de problèmes physiques. Ainsi, lorsque Dirac utilise une « fonction » définie de la sorte :

$$\delta(x) = \begin{cases}
1 & \text{ si } x=0\cr 0 & sinon
\end{cases}\\
1 = \int_{-\infty}^{+\infty} \delta(x)dx$$

Les mathématiciens ont été sceptiques, malgré la présence d’applications concrètes qui utilisent cette « fonction » et qui ont fait leur preuve empiriquement. Ainsi est née la théorie des distributions de Laurent Schwartz, outil privilégié des ingénieurs de tout bord et physicien aujourd’hui, comme réponse mathématique à cet apparent paradoxe.
On trouve aussi de nombreuses collaborations directes, comme les travaux de Cédric Villani, notre dernier médaillé Fields, pour son travail sur l’amortissement Landau en physique des plasmas. En réalité, aujourd’hui, les physiciens de haut niveau sont pour la plupart des mathématiciens qui ne veulent pas se l’avouer.

- Autour de nous, tout est pensé, réfléchi en terme de mathématiques. Ainsi, jusqu’au placement des voyageurs, dans un train, du nombre de wagons nécessaires, de l’aiguillage des trains, du planning, des lignes à conserver. Tout cela est un même problème gigantesque d’optimisation, dont les mathématiques se suffisent à elles-même pour tenter de donner une solution.

- Socialement, beaucoup de décisions relatives à la santé publique, mise en place de nouvelles lois, …, tout cela se base sur des études statistiques, des études probabilistes et autres procédures d’aide à la décision qui ne sont que des mathématiques à peine cachées. Il est d’autant plus important pour un citoyen de comprendre ces outils qu’ils sont un fabuleux outil de manipulation et falsification, comme l’est l’art de l’éloquence en politique.

- En économie et finance tout est basé sur des mathématiques à tel point que l’on ne croit qu’aux mathématiques comme un dogme : modèles mathématiques de spéculation, de prévision, de rationalisation des enchères, étude de mise en place de nouveaux produits, déduction du comportement de masse dans le but de maximiser ses profits (l’exemple flagrant étant la grande distribution, magnifique exemple de complexité mathématique pour la déduction de comportement sociaux micro et macroscopique, au service du profit).

- La philosophie a également entretenue avec les mathématiques un lien très fort. Popper pensait que c’était parce que les mathématiques n’étaient pas réfutables qu’elles n’étaient pas une science, et surtout parce que les mathématiques ne se construisaient pas par la destruction de théories antérieures mais par l’accumulation de nouvelles théories basées sur les anciennes, comme un jeu de lego. Il avait probablement raison — je suis popperien convaincu —, mais il n’est plus là pour voir comment ces dernières années, grâce à l’informatique, les mathématiques sont devenues une sciences expérimentales, au même titre que la chimie : calcul numérique, simulation, intelligence artificielle, optimisation approchée, tant de nouveaux domaines qui ne sont pas tout à fait des mathématiques traditionnelles dans le sens où il y est possible de faire des expériences, de les réfuter par le suite mais jamais de complètement les valider, au sens de Popper.bbbb
Pourtant, ces domaines font également appel à des mathématiques hautement théoriques et trouvent des champs d’application larges et variés : de la robotique, à la méthode des éléments finis pour la résistance des matériaux (et on comprendra qu’on utilise cette méthode partout en génie civil mais également en sureté nucléaire, pour la modélisation de systèmes critiques comme des avions, et j’en passe), en passant par la reconnaissance de formes, synthèse vocale, etc.

Enfin, je donne quelques liens :

- [L’explosion de mathématiques](http://smf.emath.fr/files/imported/Publications/ExplosionDesMathematiques/pdf/smf-smai_explo-maths.pdf), édité par la Société des Mathématiques Françaises et la Société des Mathématiques Appliquées et Industrielles.

On peut notamment y découvrir comment les prévisions météorologiques ne sont que des mathématiques, complexes et hautement théoriques, comment la norme GSM est un livre de 5000 pages de documentation technique et mathématique, comment la cryptographie est utilisée dans le moindre de nos appareils modernes et requiert des notions d’algèbre extrêmement pointues et constitue un défi constant, comment la théorie du contrôle est à l’origine de la validation de l’**ensemble** des procédés critiques et de l’amélioration des systèmes critiques de nos sociétés modernes, comment la recherche théorique est inspirée de problèmes physiques et comment des avancées théoriques trouveront certainement une application concrète dans le futur, comment les mathématiques seules, avec des outils récents, permettent de faire avancer la recherche contre le cancer, comment des améliorations de l’analyse de Fourier permettent de compresser des données, au prix de recherches en mathématiques fondamentales poussées, comment les mathématiques peuvent être utilisées pour guider des processus artistiques, comment la rationalisation des ventes aux enchères passent par de la théorie des jeux et de l’optimisation, etc.

Autant d’exemples que de domaines, autant de mathématiques que d’avancées technologiques.

- [Image des mathématiques](http://images.math.cnrs.fr/), site du CNRS où sont expliquées et vulgarisées des notions mathématiques concrètes ainsi que leur besoin dans des applications diverses et variées.

- [Mathématiques de la planète Terre](http://mpt2013.fr/), une brève par jour. 2013 est l’année des mathématiques !

Pour finir, je voudrais simplement dire que cet écrit n’a pas pour but de justifier la croyance dogmatique en les mathématiques pour donner une réponse à n’importe quelle question, encore moins lorsqu’elle est de nature sociale (point de vue que je partage pas et qui est démenti même mathématiquement et empiriquement). Il ne s’agit que d’un constat, bien triste pour certains, plein d’espoir pour d’autres.

> Pourquoi alors, dans 90% des cas on n’a pas besoin de notions très avancées en mathématiques ?

Il faut définir le mot « cas » et le mot « on ». La phrase : dans 90% des actions de la vie de tous les jours, n’importe quel humain sur terre n’a pas besoin de notions très avancées en mathématiques, est vraie. La phrase : dans 90% du temps passé au travail, l’énorme majorité des gens n’a pas besoin de notions très avancées en mathématiques, est vraie également.

Pourtant, il reste beaucoup de métiers où les mathématiques avancées sont très présentes. Ces métiers sont très variés, dans toutes les branches ou secteurs de la société et l’on remarquera que, comme un écho à la réponse à la première question, ce sont des métiers socialement très valorisés, très bien rémunérés et généralement extrêmement intéressants (même s’il s’agit d’un constat qui n’est pas forcément des plus objectifs, j’en conviens).

Donnons un exemple : si 99% des créateurs de jeux vidéos n’ont pas besoin de notions mathématiques très poussées, le 1% qui crée les outils sont extrêmement doués en mathématiques théoriques afin de mettre au point de méthodes performantes pour un tas de choses (allant de la géométrie à l’intelligence artificielle).

Le besoin en mathématiques poussées n’est pas concentré autour de la recherche ou de domaines très spécifiques mais au contraire uniformément distribué au sein de la société.

> Pourquoi discuter de mathématiques en général ? Comment discuter de limites, équations différentielles ou intégration sans que cela ne soit qu’une aide au devoir ?

La question n’est pas bien posée parce qu’il y a confusion entre l’outil et la manière dont en s’en sert. Quelqu’un qui viendra sur un forum d’informatique demander une information qu’il peut trouver dans la documentation de son _framework_, de son langage ou autre sera très mal vu. Il en va de même pour celui qui vient demander quelque chose qu’il peut trouver facilement dans le premier cours venu.

Il est plus intéressant de voir des discussions sur la conception, un point technique précis, par exemple et il en va de même avec les mathématiques. Il est tout à fait possible de voir de manière analogue à un sujet nommé « Avis livre : Le langage Caml », un sujet appelé « Avis livre : La théorie des Distributions » ou à la place de « Comment bien nommer ses fonctions et ses variables ? » un sujet nommé... « Comment bien nommer ses fonctions et ses variables ? ».

