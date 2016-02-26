#!/bin/bash

proMode=false

if [[ $1 == "-p" ]] || [[ $1 == "--pro" ]]
then
    proMode=true
fi

setConfig()
{
    local question=$1
    local config=$2
    local callback=$3

    if $proMode
    then
        if [[ -z `git config --global $config` ]]
        then
            default="[ja]"
            setValue=true
        else
            default="[nein]"
            setValue=false
        fi

        echo ""
        echo "$question $default"
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
        $callback
    fi
}


setUsername()
{
    local username
    echo "Benutzername eingeben (Format: Vorname Nachname)"
    read username
    # git config --global user.name "$username"
}
setConfig "Benutzernamen setzen?" user.name setUsername



setEmail()
{
    local email
    echo "E-Mail Adresse eingeben"
    read email
    # git config --global user.email "$email"
}
setConfig "E-Mail Adresse setzen?" user.email setEmail



setDiffTool()
{
    local diffTool="meld"

    echo "Welches Diff Tool soll konfiguriert werden? [Standard: Meld]"
    echo "1: Meld"
    echo "2: KDiff3"
    echo "3: Visual Studio"
    read choice

    case $choice in
        1) diffTool="meld"
        ;;
        2) diffTool="kdiff3"
        ;;
        3) diffTool="visualStudio"
        ;;
    esac

    # git config --global diff.tool "$diffTool"
}
setConfig "Setze Diff Tool?" diff.tool setDiffTool



setMergeTool()
{
    local mergeTool="kdiff3"

    echo "Welches Merge Tool soll konfiguriert werden? [Standard: KDiff3]"
    echo "1: Meld"
    echo "2: KDiff3"
    echo "3: Visual Studio"
    read choice

    case $choice in
        1) mergeTool="meld"
        ;;
        2) mergeTool="kdiff3"
        ;;
        3) mergeTool="visualStudio"
        ;;
    esac

    # git config --global merge.tool "$mergeTool"
}
setConfig "Setze Merge Tool?" merge.tool setMergeTool


#TODO: more git config stuff


echo "Möchtest du Bash Aliase einrichten? [Standard: Nein]"
echo "1: Ja"
echo "2: Nein"
read choice

case $choice in
    1) bashAliases=true
    ;;
    2) bashAliases=false
    ;;
esac

if $bashAliases
then
    #TODO: set bash aliases
fi


#TODO: set git aliases

exit
