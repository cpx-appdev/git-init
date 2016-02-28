#!/bin/bash

proMode=false

if [[ $1 == "-p" ]] || [[ $1 == "--pro" ]]
then
    proMode=true
fi

setConfig()
{
    local question=$1
    local callback=$2
    local config=$3

    if $proMode
    then
        if [[ -z $config || -z `git config --global $config` ]]
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
    else
        setValue=true
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
setConfig "Benutzernamen setzen?" setUsername user.name



setEmail()
{
    local email
    echo "E-Mail Adresse eingeben"
    read email
    # git config --global user.email "$email"
}
setConfig "E-Mail Adresse setzen?" setEmail user.email



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

    #TODO: configure diff tool
}
setConfig "Setze Diff Tool?" setDiffTool diff.tool



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

    #TODO: configure merge tool
}
setConfig "Setze Merge Tool?" setMergeTool merge.tool



setGeneralGitConfig()
{
    echo "Setze allgemeine Git Konfiguration"
    git config --global credential.helper store
    git config --global push.default simple
    git config --global fetch.prune true
}
setConfig "Allgemeine Git Konfiguration setzen?" setGeneralGitConfig


setBashAliase()
{
    if ! grep -q "~/.cpx_aliases" ~/.bashrc
    then
        echo "if [ -f ~/.cpx_aliases ]; then . ~/.cpx_aliases; fi" >> ~/.bashrc;
    fi

    echo "Setze Bash Aliase"
    #TODO: write bash aliases to ~/.cpx_aliases
}
setConfig "Bash Aliase setzen?" setGitAliase


setGitAliase()
{
    echo "Setze Git Aliase"
    #set git aliase
}
setConfig "Git Aliase setzen?" setGitAliase

exit
