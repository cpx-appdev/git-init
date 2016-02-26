#!/bin/bash

diff_tool="meld"
merge_tool="kdiff3"
bash_aliases=false

proMode=false
set_username=true

if [[ $1 == "-p" ]] || [[ $1 == "--pro" ]]
then
    proMode=true
fi

setConfigValue()
{
    local questionSet=$1
    local questionValue=$2
    local config=$3

    # scope="--global"
    scope=""

    if $proMode
    then
        if [[ -z `git config $scope $config` ]]
        then
            default="[ja]"
            setValue=true
        else
            default="[nein]"
            setValue=false
        fi

        echo ""
        echo "$questionSet $default"
        echo "ja"
        echo "nein"
        read choice

        case $choice in
            j | ja) setValue=true
            ;;
            n | nein) setValue=false
            ;;
        esac
    fi

    if $setValue
    then
        echo $questionValue
        read value
        git config $scope $config "$value"
    fi
}

# if [ $proMode ]
# then
#
#     if [ -z `git config --global user.name` ]
#     then
#         default="[yes]"
#         set_username=true
#     else
#         default="[no]"
#         set_username=false
#     fi
#
#     echo "Do you wish to set the username? $default"
#     echo "yes"
#     echo "no"
#     read choice
#
#     case $choice in
#         yes) set_username=true
#         ;;
#         no) set_username=false
#         ;;
#     esac
# fi
#
# if $set_username
# then
#     echo "Benutzername eingeben (Format: Vorname Nachname)"
#     read username
#     git config --global user.name $username
# fi

setConfigValue "Benutzernamen setzen?" "Benutzername eingeben (Format: Vorname Nachname)" user.name
setConfigValue "E-Mail Adresse setzen?" "E-Mail Adresse eingeben" user.email

exit


#Diff Tool
echo "Welches Diff Tool soll konfiguriert werden? [Standard: Meld]"
echo "1: Meld"
echo "2: KDiff3"
echo "3: Visual Studio"
read choice

case $choice in
    1) diff_tool="meld"
    ;;
    2) diff_tool="kdiff3"
    ;;
    3) diff_tool="visualStudio"
    ;;
esac


#Merge Tool
echo "Welches Merge Tool soll konfiguriert werden? [Standard: KDiff3]"
echo "1: Meld"
echo "2: KDiff3"
echo "3: Visual Studio"
read choice

case $choice in
    1) merge_tool="meld"
    ;;
    2) merge_tool="kdiff3"
    ;;
    3) merge_tool="visualStudio"
    ;;
esac


#Bash Aliases
echo "Möchtest du Bash Aliase einrichten? [Standard: Nein]"
echo "1: Ja"
echo "2: Nein"
read choice

case $choice in
    1) bash_aliases=true
    ;;
    2) bash_aliases=false
    ;;
esac


echo "Benutzername: $username"
echo "E-Mail: $email"
echo "Diff Tool: $diff_tool"
echo "Merge Tool: $merge_tool"
echo "Bash Aliase? $bash_aliases"
