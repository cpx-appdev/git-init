# Erstellen

#### Neues Repository erstellen
```
$ git init
```

Erstellt ein neues lokales Git Repository im aktuellen Ordner.

#### Vorhandenes Repository klonen
```
$ git clone *URL*
```

Klont den Inhalt eines Remote Repositories in das aktuelle Verzeichnis.

# Lokale Änderungen

#### Aktuellen Status anzeigen
```
$ git status
```
Zeigt alle lokalen Änderungen im aktuellen Repository an (entspricht *Pending Changes* im TFVC)

#### Dateidifferenzen  anzeigen
```
$ git diff
```
Zeigt alle Änderungen bei bereits getrackten Dateien an (Dateiinhalt)

```
$ difftool
```
Öffnet ein grafisches Tool um Änderungen anzuzeigen

#### Dateien für den Commit vorbereiten (Staging)
```
$ git add *Pfad/zu/Datei*
```
Datei zum Committen markieren.

```
$ git add .
```
Alle Dateien ab dem aktuellen Verzeichnis (inkl. aller Unterordner) zum Committen markieren.

#### Dateien aus dem nächsten Commit nehmen (Unstaging)
```
$ git reset
```
Dateien vom Status "Bereit für Commit" entfernen (Änderungen bleiben dabei erhalten)

#### Committen

```
$ git commit [-m *Kommentar*]
```
Alle zum Committen markierte Dateien Committen  
  > **Ohne** den Parameter **-m** geht der konfigurierte Editor auf, der den Kommentar entgegennimmt und nach dem Schließen des Editors wird committed.  

  > **Mit** dem Parameter **-m** gibt man den Kommentar direkt auf der Kommandozeile an (bei vorhandenen Leerzeichen mit Anführungsstrichen umschließen)

Zusätzliche Optionen:

```
--amend
```
Aktuelle Änderungen in den letzten Commit mit integrieren ***NIEMALS BEREITS VERÖFFENTLICHTE COMMITS AMENDEN***

## History anzeigen

```
$ git log
```
History des gesamten Repository anzeigen

```
$ git log *Pfad/zu/Datei*
```
History der Datei anzeigen

#### History einer Datei anzeigen
```
$ git blame *Pfad/zu/Datei*
```
Alle Änderungen in einer Datei anzeigen, dabei wird pro Zeile angezeigt, welche Änderung von wem committed wurde (wie *Annotate* im TFVC)

# Branches & Tags

#### Branch erstellen
```
$ git branch *Branchname*
```
Branch mit dem Namen *Branchname* anlegen

#### Branch wechseln
```
$ git checkout *Branchname*
```
Zum Branch *Branchname* wechseln

#### Tag erstellen
```
$ git tag -a *Name*
```
Tag mit Namen und Beschreibung am aktuellen Commit anlegen

## Update & Publish

#### Änderungen von einem Remote Repository holen
```
$ git fetch
```
Alle Änderungen des Remote Repository in das lokale Repository laden, dabei wird aber das Arbeitsverzeichnis nicht geändert

#### Änderungen von einem Remote Repository holen und gleichzeitig mergen
```
$ git pull
```
Alle Änderungen des Remote Repository in das lokale Repository laden und gleichzeitig die Arbeitskopie aktualisieren (Erzeugt ggf. eine Merge-Commit)
* **Möglichst vermeiden. Bitte stattdessen den Workflow "*Änderungen vom zentralen Repository integrieren*" verwenden.**

#### Änderungen an ein Remote Repository übertragen
```
$ git push
```

#### Tags an ein Remote Repository übertragen
```
$ git push --tags
```

<!-- Die Überschrift "Mergen" im Druck in die nächste Spalte verschieben -->
<!-- <br />
<br />
<br />
<br />
<br />
<br />
<br /> -->

## Merge & Rebase

#### Mergen
```
$ git merge *Branch*
```
Den angegebenen *Branch* in den aktuellen branch mergen, dabei entscheidet Git selbst, ob es rekursiv oder mittels fast-forward geschieht

Zusätzliche Optionen:

```
--ff-only
```
Nur fast-forward zulassen
```
--no-ff
```
Erzeugt immer einen Mergecommit

#### Mergekonflikte lösen
```
$ git mergetool
```
Öffnet das konfigurierte Standard Mergetool, um die Merge Konflikte aufzulösen.

#### Rebase
```
$ git rebase
```
Commit History neu schreiben, v.a. hilfreich, wenn beim fetch & merge eines Remote Branches kein Fast Forward möglich ist

# Undo

#### Änderungen rückgängig machen
```
$ git reset --hard
```
Alle Änderungen an bereits getrackten Dateien rückgängig machen (betrifft keine neu erstellten Dateien)

#### Änderungen rückgängig machen (Unterschied?)
```
$ git checkout .
```
Alle Änderungen an den Dateien rückgängig machen, die **nicht gestaged** sind (betrifft keine neu erstellten Dateien)

#### Repository zurücksetzen
```
$ git clean -xdf
```
Setzt das aktuelle Arbeitsverzeichniss zurück. Alle Änderungen oder nicht eingecheckte Dateien werden entfernt. Hat den selbene Effekt wie das Repository frisch zu klonen.

### Workflows

####  Änderungen vom zentralen Repository integrieren

1. `git fetch`
2. `git rebase`
3. Merge-Konflikte?
    1. `git mergetool`
    2. `git rebase --continue`

# Weiterführende Links

- https://www.ralfebert.de/git/
- http://tklepzig.github.io/git-branching-pres/
