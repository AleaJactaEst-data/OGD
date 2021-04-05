# Partie 3 : Optimisation d’un portefeuille d’actions et le modèle Markowitz

Vous trouverez pour cette exercice deux dossiers : "Problème 1" et "Problème 2". Les deux peuvent être utilisés sans l'autre. Ils ne sont pas interdépendants.
On retrouve dans le dossier "Problème 1", ces fichiers :

- probleme_1_main.m qui est comme son nom l'indique le main de cette partie soit le code à exécuter. Dans ce code, vous trouverez des résolutions et des analyses de convergences selon N et Re. Le main est à exécuter dans l'ordre.
- res_aux_1.m : la fonction permettant de résoudre notre problème par la méthode expliquée dans le rapport à l'aide de la fonction de prix.m notamment
- prix.m : une fonction implémentant l'algorithme permettant la décomposition par les prix comme vu en TP
- Uzawa_quad.m : une fonction implémentant la méthode d'Uzawa permettant de traiter les problèmes quadratiques décomposables
- test_KKT : une fonction donnant si les conditions KKT sont vérifiées ou nom

On retrouve dans le dossier "Problème 2", ces fichiers :

- probleme_2_main.m : qui est comme son nom l'indique le main de cette partie soit le code à exécuter. Dans ce code, vous trouverez des résolutions et des analyses de convergences selon N et De. Le main est à exécuter dans l'ordre.
- res_aux_2.m : la fonction permettant de résoudre notre problème par la méthode expliquée dans le rapport à l'aide de la fonction de prix.m notamment
- prix.m : l'algorithme permettant la décomposition par les prix comme vu en TP
- Uzawa_quad.m : La méthode d'Uzawa permettant de traiter les problèmes quadratiques décomposables

Comme vous pouvez le remarquer, il y a deux fois les mêmes deux fonctions pour "Uzawa_quad.m" et "prix.m" car ces méthodes sont utilisées dans les deux parties et pour les rendre indépendantes, il fallait ainsi en avoir en deux exemplaires.  
