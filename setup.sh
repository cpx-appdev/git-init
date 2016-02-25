#!/bin/bash

diff_tool="meld"
merge_tool="kdiff3"
bash_aliases=false

echo "Benutzername eingeben (Format: Vorname Nachname)"
read username

echo "E-Mail Adresse eingeben"
read email

#Diff Tool
echo "Welches Diff Tool soll konfiguriert werden? [Standard: Meld]"
echo "1: Meld"
echo "2: KDiff3"
echo "3: Visual Studio"
read choice

case $choice in
    1 ) diff_tool="meld"
    ;;
    2 ) diff_tool="kdiff3"
    ;;
    3 ) diff_tool="visualStudio"
    ;;
esac


#Merge Tool
echo "Welches Merge Tool soll konfiguriert werden? [Standard: KDiff3]"
echo "1: Meld"
echo "2: KDiff3"
echo "3: Visual Studio"
read choice

case $choice in
    1 ) merge_tool="meld"
    ;;
    2 ) merge_tool="kdiff3"
    ;;
    3 ) merge_tool="visualStudio"
    ;;
esac


#Bash Aliases
echo "Möchtest du Bash Aliase einrichten? [Standard: Nein]"
echo "1: Ja"
echo "2: Nein"
read choice

case $choice in
    1 ) bash_aliases=true
    ;;
    2 ) bash_aliases=false
    ;;
esac


echo "Benutzername: $username"
echo "E-Mail: $email"
echo "Diff Tool: $diff_tool"
echo "Merge Tool: $merge_tool"
echo "Bash Aliase? $bash_aliases"
