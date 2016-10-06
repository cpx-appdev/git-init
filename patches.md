### Erzeugen
`git format-patch --stdout common-commit-hash..latest-commit-hash > path/to/patch/file`

### Inhalt und Korrektheit prüfen
`git apply --stat path/to/patch/file`  
`git apply --check path/to/patch/file`

### Anwenden
`git am -3 --keep-cr path/to/patch/file`

