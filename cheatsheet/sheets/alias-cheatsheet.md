# Aliase für einzelne Befehle

Alias|Befehl/Erklärung
--|--
s|status
si|status + zeige ignorierte Dateien
dt|difftool
dts|difftool für Dateien in der Staging Area
d|diff
ds|diff für Dateien in der Staging Area
l|log
lm|log (nur Merge-Commits)
ln|log (zeige pro Commit auch die geänderten Dateien an)
ld|log (in Datumsreihenfolge)
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
bd|branch -d (**Lokalen** Branch löschen)
ba|branch (auch Remote-Branches)
bnm|branch (zeige die Branches, die noch nicht gemerged sind)
f|fetch
m|merge
ma|merge --abort
mff|merge (nur Fast-Forward erlaubt)
mr| (nur Recursive erlaubt)
mt|mergetool
rb|rebase
rbc|rebase --continue
rba|rebase --abort
sw|show
swn|show  (zeige auch die geänderten Dateien an)
cl|clean
cln|clean, aber nur simulieren
st|stash
stp|stash pop

# Aliase für komplexere Aufgaben

#### acm *commit message*

- Alle Dateien stagen und sofort committen (gesamtes Repository)

#### acmp *commit message*

- Wie *acm*, aber zusätzlich auch noch pushen

#### undo

- Alle Änderungen (betrifft auch neu erstellte Dateien) auf den Stand des letzten Commits zurücksetzen

#### frb

- Alle Änderungen des Remote Repository in das Arbeitsverzeichnis laden (unter Verwendung eines Rebase)

#### dummy

- Erzeugt einen leeren Commit
- Dient eher Testzwecken oder dem Simulieren von Commits, um ein push ausführen zu können

#Tipps

#### git c -

- Zwischen den zuletzt genutzten Branches hin und her wechseln

#### Branch auf Remote löschen

- `git p origin :*branchname*`


# Setup für Alias-Cheatsheet

```
$ source <(curl -s https://raw.githubusercontent.com/tklepzig/git-init/master/setup.sh) -u
```
Führt das Setup-Script aus:
  > **Ohne** den Parameter **-u** wird die grundlegende Einrichtung von Git und Anlegen der Aliase (alle Einstellungen können natürlich später auch geändert werden) vorgenommen.  

  > **Mit** dem Parameter **-u** wird das Setup-Script im Update-Modus ausgeführt, sodass NUR die Aliase  aktualisiert werden.
