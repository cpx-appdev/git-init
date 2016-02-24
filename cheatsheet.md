# Erstellen

## $ git init
  Leeres Git Repository erstellen

## $ git clone *URL*
  Ein vorhandenes Git Repository klonen (URL ist im TFS unter "Code > Clone" zu finden)  

# Lokale Änderungen

## $ git status
  Alle lokalen Änderungen im aktuellen Repository anzeigen (Wie *Pending Changes* im TFVC)

## $ git diff
  Anzeigen aller Änderungen bei bereits getrackten Dateien (Dateiinhalt)

## $ difftool --dir-diff
  Wie git diff, aber mit grafischen Tool

## $ git add *Pfad/zu/Datei*
  Datei zum Committen markieren

## $ git add .
  Alle Dateien ab dem aktuellen Verzeichnis (inkl. aller Unterordner) zum Committen markieren

## $ git reset
  Dateien vom Status "Bereit für Commit" entfernen (Aber Änderungen bleiben erhalten, wird nur vom *Index* entfernt)

## $ git commit [-m *Kommentar*]
  Alle zum Committen markierte Dateien Committen
  **Ohne** den Parameter **-m** geht der konfigurierte Editor auf, der den Kommentar entgegennimmt und nach dem Schließen des Editors wird committed.
  **Mit** dem Parameter **-m** gibt man den Kommentar direkt auf der Kommandozeile an (bei vorhandenen Leerzeichen mit Anführungsstrichen umschließen)

## $ git commit --amend
  Den letzten Commit zurücksetzen und deren Änderungen wieder als lokale Änderungen einspielen, um so Dateien oder den Commit-Kommentar ändern zu können
  * ***NIEMALS BEREITS VERÖFFENTLICHTE COMMITS AMENDEN***

# History anzeigen

## $ git log
  History des gesamten Repository anzeigen

## $ git log *Pfad/zu/Datei*
  History der Datei anzeigen

## $ git blame *Pfad/zu/Datei*
  Alle Änderungen in einer Datei anzeigen, dabei wird pro Zeile angezeigt, welche Änderung von wem committed wurde (wie *Annotate* im TFVC)

# Branches & Tags

## $ git branch *Branchname*
  Branch mit dem Namen *Branchname* anlegen

## $ git checkout *Branchname*
  Zum Branch *Branchname* wechseln

## $ git tag [-a] *Name*
  Tag mit Namen und Beschreibung (Editor) im aktuellem Branch anlegen


# Update & Publish

## $ git fetch
  Alle Änderungen des Remote Repository in das lokale Repository laden, dabei wird aber das Arbeitsverzeichnis nicht geändert

> ## $ git pull
   Retrieves all changes of a remote repository (see git pull) and integrates changes of a connected remote branch into the local one     (changes on both sides causes a merge)

## $ git push
  Alle lokalen Commits zum Remote Repository schicken

## $ git push --tags

# Merge & Rebase

## $ git merge
## $ git merge --ff-only
## $ git merge --no-ff

## $ git mergetool

## $ git rebase

# Undo

## $ git reset --hard

## $ git checkout
  TODO: Branchwechsel, Änderungen rückgängig machen, vergangenen Commit holen
