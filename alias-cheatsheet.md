# Lokale Änderungen

#### Status anzeigen
```
$ git s
```
Kurze Statusanzeige ...

#### Änderungen hinzufügen

```
$ git a 
```
Alle Dateien stagen (gesamtes Repository)

```
$ git cm *Commit message*
```
Alle gestageten Dateien committen

```
$ git cma *Commit message*
```
Bestehenden Commit erweitern

```
$ git acm *Commit message*
```
Alle Dateien stagen, committen (gesamtes Repository)

```
$ git acmp *Commit message*
```
Alle Dateien stagen, committen, pushen (gesamtes Repository)

#### Dateien aus dem nächsten Commit nehmen (Unstaging)
...

#### History anzeigen
...

# Update & Publish

#### Änderungen von einem Remote Repository holen
```
$ git f
```
Alle Änderungen des Remote Repository in das lokale Repository laden, dabei wird aber das Arbeitsverzeichnis nicht geändert

# Branching & Merging
#### Branch-Verwaltung

```
$ git b *Branchname*
```
Branch mit dem Namen *Branchname* anlegen

```
$ git c *Branchname*
```
Zum Branch *Branchname* wechseln

#### Merging

```
$ git m *Branch-Name*
```
Angegebenen Branch in den aktuellen Branch mergen

```
$ git mff *Branch-Name*
```
Angegebenen Branch in den aktuellen Branch mergen, wenn Fast-Forward möglich ist

```
$ git mr *Branch-Name*
```
Angegebenen Branch in den aktuellen Branch mergen, dabei immer einen Merge-Commit erzeugen

```
$ git mt
```
Öffnet das konfigurierte Standard Mergetool, um die Merge Konflikte aufzulösen.

#### Rebase
```
$ git rb
```
Commit History neu schreiben, v.a. hilfreich, wenn beim fetch & merge eines Remote Branches kein Fast Forward möglich ist
