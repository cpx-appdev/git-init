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
    git config --global user.name "$username"
}
setConfig "Benutzernamen setzen?" setUsername user.name



setEmail()
{
    local email
    echo "E-Mail Adresse eingeben"
    read email
    git config --global user.email "$email"
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

    if [[ $diffTool == "meld" ]]
    then
        git config --global diff.tool meld
    fi
    if [[ $diffTool == "kdiff3" ]]
    then
        git config --global diff.tool kdiff3
    fi
    if [[ $diffTool == "visualStudio" ]]
    then
        git config --global diff.tool "vsdiffmerge"
        git config --global difftool.prompt true
        git config --global difftool.vsdiffmerge.cmd "\"C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\vsdiffmerge.exe\" \"$LOCAL\" \"$REMOTE\" //t"
        git config --global difftool.vsdiffmerge.keepbackup false
        git config --global difftool.vsdiffmerge.trustexistcode true
    fi
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

    if [[ $diffTool == "meld" ]]
    then
        git config --global merge.tool meld
    fi
    if [[ $diffTool == "kdiff3" ]]
    then
        git config --global merge.tool kdiff3
    fi
    if [[ $diffTool == "visualStudio" ]]
    then
        git config --global diff.tool "vsdiffmerge"
        git config --global difftool.prompt true
        git config --global difftool.vsdiffmerge.cmd "\"C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\vsdiffmerge.exe\" \"$REMOTE\" \"$LOCAL\" \"$BASE\" \"$MERGED\" //m"
        git config --global difftool.vsdiffmerge.keepbackup false
        git config --global difftool.vsdiffmerge.trustexistcode true
    fi
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

    rm -f ~/.cpx_aliases

    echo "Setze Bash Aliase"

    echo "alias g='git '" >> ~/.cpx_aliases
	echo "alias got='git '" >> ~/.cpx_aliases
	echo "alias get='git '" >> ~/.cpx_aliases
	echo "alias ga='git add'" >> ~/.cpx_aliases
	echo "alias gs='git status '" >> ~/.cpx_aliases
	echo "alias gc='git commit '" >> ~/.cpx_aliases
	echo "alias gcm='git commit -a -m '" >> ~/.cpx_aliases
	echo "alias gb='git branch '" >> ~/.cpx_aliases
	echo "alias go='git checkout '" >> ~/.cpx_aliases
	echo "alias gf='git fetch '" >> ~/.cpx_aliases
	echo "alias gd='git diff '" >> ~/.cpx_aliases
	echo "alias gps='git push '" >> ~/.cpx_aliases
	echo "alias grb='git rebase '" >> ~/.cpx_aliases
	echo "alias gpl='git pull '" >> ~/.cpx_aliases
	echo "alias gm='git merge '" >> ~/.cpx_aliases
	echo "alias gk='gitk --all&'" >> ~/.cpx_aliases
	echo "alias gx='gitx --all'" >> ~/.cpx_aliases
	echo "alias gd='git discard '" >> ~/.cpx_aliases
	echo "alias gda='git discardall'" >> ~/.cpx_aliases
	echo "alias gwin='git config --global credential.helper wincred'" >> ~/.cpx_aliases

	echo "__git_complete g _git" >> ~/.cpx_aliases
	echo "__git_complete ga _git_add" >> ~/.cpx_aliases
	echo "__git_complete gs _git_status" >> ~/.cpx_aliases
	echo "__git_complete gc _git_commit" >> ~/.cpx_aliases
	echo "__git_complete gcm _git_commit" >> ~/.cpx_aliases
	echo "__git_complete gb _git_branch" >> ~/.cpx_aliases
	echo "__git_complete go _git_checkout" >> ~/.cpx_aliases
	echo "__git_complete gf _git_fetch" >> ~/.cpx_aliases
	echo "__git_complete gd _git_diff" >> ~/.cpx_aliases
	echo "__git_complete gps _git_push" >> ~/.cpx_aliases
	echo "__git_complete gpl _git_pull" >> ~/.cpx_aliases
	echo "__git_complete gm _git_merge" >> ~/.cpx_aliases
}
setConfig "Bash Aliase setzen?" setGitAliase


setGitAliase()
{
    echo "Setze Git Aliase"

    git config --global alias.s  "status -s"
    git config --global alias.dt "difftool --dir-diff"
    git config --global alias.dts "difftool --dir-diff --staged"
    git config --global alias.d "diff --word-diff"
    git config --global alias.ds "diff --staged --word-diff"
    git config --global alias.l "-c core.pager='less -SRF' log --graph --all --format=\"%C(yellow)%h%C(reset) - %C(cyan)(%ar)%C(reset) %s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%Creset\""
    git config --global alias.lm "-c core.pager='less -SRF' log --graph --all --format=\"%C(yellow)%h%C(reset) - %C(cyan)(%ar)%C(reset) %s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%Creset\" --merges"
    git config --global alias.r "reset"
    git config --global alias.rh "reset --hard"
    git config --global alias.a "add --all"
    git config --global alias.ap "add --patch"
    git config --global alias.cm "commit -m"
    git config --global alias.acm "!f() { git add --all && git commit -m \"\$1\"; }; f"
    git config --global alias.acmp "!f() { git add --all && git commit -m \"\$1\" && git push; }; f"
    git config --global alias.c "checkout"
    git config --global alias.b "branch"
    git config --global alias.f "fetch"
    git config --global alias.m "merge"
    git config --global alias.mff "merge --ff-only"
    git config --global alias.mr "merge --no-ff"
    git config --global alias.mt "mergetool"
    git config --global alias.rb "rebase"
    git config --global alias.rbc "git rebase --continue"
    git config --global alias.undo "!f() { git reset --hard \$1 && git clean -df \$1; }; f"
}
setConfig "Git Aliase setzen?" setGitAliase

exit
