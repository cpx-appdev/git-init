### Erzeugen
git format-patch --stdout comon-commit-hash..latest-new-commit > path/to/patch/file

### Inhalt und Korrektheit prüfen
git apply --stat path/to/patch/file
git apply --check path/to/patch/file

### Anwenden
git am path/to/patch/file

