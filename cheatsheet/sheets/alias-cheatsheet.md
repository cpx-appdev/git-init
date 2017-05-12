# Aliase für einzelne Befehle

Alias|Befehl/Erklärung
--|--
s|status
si|status und zusätzlich ignorierte Dateien anzeigen
dt|difftool
dts|difftool für Dateien in der Staging Area
d|diff
ds|diff für Dateien in der Staging Area
l|log
lm|log (nur Merge-Commits)
ln|log (zeige pro Commit auch die geänderten Dateien an)
ld|log (in Datumsreihenfolge)
lp|log (zeige pro Commit auch alle Änderungen in den Dateien an)
ls|log (liste nur die Commits auf, die über einen Zeiger erreichbar sind)
r|reset
rh|reset --hard
rs|reset --soft
a|add
ap|add --patch
cm|commit -m
cma|commit --amend
p|push
pt|push --tags
c|checkout
b|branch
bd|branch -d (**lokalen** Branch löschen)
ba|branch (auch Remote-Branches)
bnm|branch (zeige die Branches, die noch nicht gemerged sind)
f|fetch
m|merge
ma|merge --abort
mff|merge (nur Fast-Forward erlaubt)
mr|merge (nur Recursive erlaubt)
mt|mergetool
rb|rebase
rbc|rebase --continue
rba|rebase --abort
sw|show
swn|show (zeige auch die geänderten Dateien an)
cl|clean
cln|clean, aber nur simulieren
st|stash
stp|stash pop
t|tag
td|tag -d
tl|tag --list
tlr|Listet alle tags auf, die auf Remote existieren


# Aliase für komplexere Aufgaben

#### git acm *commit message*

- Alle Dateien stagen und sofort committen (gesamtes Repository)

#### git acmp *commit message*

- Wie *acm*, aber zusätzlich auch noch pushen

#### gsa *[Rekursionstiefe]*

- Durchsucht den aktuellen ordner und alle Unterordner entsprechend der angegeben Rekursionstiefe (Standard: 1) nach Git Repositories und listet die ausstehenden Änderungen bzw. Commits auf

#### git undo

- Alle Änderungen (betrifft auch neu erstellte Dateien) auf den Stand des letzten Commits zurücksetzen

#### git frb

- Alle Änderungen des Remote Repository in das Arbeitsverzeichnis laden (unter Verwendung eines Rebase)

#### git dummy

- Erzeugt einen leeren Commit
- Dient eher Testzwecken oder dem Simulieren von Commits, um ein push ausführen zu können

#### git upgrade

- Führt das Setup-Script im Update-Modus, sodass die Aliase aktualisiert werden.

#Tipps

#### git c -

- Zwischen den zuletzt genutzten Branches hin und her wechseln

#### git p origin :*branch*

- Branch auf Remote löschen


# Setup ausführen

#### Grundlegende Einrichtung von Git und Anlegen der Aliase
```
$ source <(curl -s https://raw.githubusercontent.com/cpx-appdev/git-init/master/setup.sh)
```

