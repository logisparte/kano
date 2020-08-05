# kano

> Read in [English](/docs/README.md)

Outil de gestion de tâche d'ingénierie logicielle

## À propos

> `κάνω` (phonétique : `káno`) signifie "faire" en grec

Les projets d'ingénierie logicielle comportent tous des tâches de développement communes, comme
exécuter des tests automatisés, formatter le code, etc. L'implémentation de ces tâches varie en
fonction du langage de programmation, des outils utilisés par l'équipe et autres contraintes
connexes. La plupart du temps, ces tâches sont gérées via des scripts appelés directement à
partir du terminal ou via le gestionnaire de paquet du langage utilisé. Deux projets peuvent
avoir des configuration de script différentes pour effectuer la même tâche, ce qui augmente le
coût en charge cognitive lors d'un changement de contexte entre projets.

Ceci est un des problèmes que `kano` résout. Il structure vos tâches de développement, peu
importe leur implémentation et vous donne une interface commune avec laquelle travailler à
travers tout vos projets sans se mettre dans vos pattes.

### Exemple

Exécuter les tests avec la couverture de code activée dans différents projets utilisant
différents langages pourrait ressembler à ça :

```shell
# En Swift
swift test -Xswiftc -suppress-warnings --enable-code-coverage

# En Javascript
karma start --coverage

# En Python
pipenv run coverage run --rcfile=setup.cfg -m unittest discover tests

# etc.
```

Si vous ne voulez pas apprendre ces lignes par coeur, vous devrez les encapsuler dans un script
dans chacun de ces projets. Kano vous propose d'encapsuler ce genre de scripts dans un dossier
spécial appelé `.kano` qui suit une structure particulière. Dans l'exemple courant, cela vous
permettrait d'exécuter vos tests de la même manière dans tous vos projets, soit :

```shell
kano test
```

Mis à part ce bénéfice immédiat, l'uniformisation permet aussi à Kano de :

- Générer des tâches à partir de gabarits par langages, architecture ou autre critère
- Encapsuler complètement l'environnement de développement sur un conteneur Docker (pour éviter
  les problèmes de _ça marche sur mon poste™_)
- Supporter des intégrations externes via son architecture modulaire légère

## Licence

Kano est _libre comme dans liberté_, sous les termes de la [licence GPL-3.0](/LICENSE).
