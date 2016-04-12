#!/bin/bash

proMode=false

setProMode()
{
    if [[ $1 == "-p" ]] || [[ $1 == "--pro" ]]
    then
        proMode=true
        echo "Pro Mode aktiviert"
    fi
}

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

setEmail()
{
    local email
    echo "E-Mail Adresse eingeben"
    read email
    git config --global user.email "$email"
}

setMeldDiffTool()
{
    git config --global diff.tool meld
}

setKDiff3DiffTool()
{
    git config --global diff.tool kdiff3
}

setVisualStudioDiffTool()
{
    git config --global diff.tool "vsdiffmerge"
    git config --global difftool.prompt true
    git config --global difftool.vsdiffmerge.cmd "\"C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\vsdiffmerge.exe\" \"$LOCAL\" \"$REMOTE\" //t"
    git config --global difftool.vsdiffmerge.keepbackup false
    git config --global difftool.vsdiffmerge.trustexistcode true
}

setDiffTool()
{
    echo "Welches Diff Tool soll konfiguriert werden? [Standard: Meld]"
    echo "1: Meld"
    echo "2: KDiff3"
    echo "3: Visual Studio"
    read choice

    case $choice in
        1) setMeldDiffTool
        ;;
        2) setKDiff3DiffTool
        ;;
        3) setVisualStudioDiffTool
        ;;
        *) setMeldDiffTool
    esac
}

setMeldMergeTool()
{
    git config --global merge.tool meld
}

setKDiff3MergeTool()
{
    git config --global merge.tool kdiff3
}

setVisualStudioMergeTool()
{
    git config --global merge.tool "vsdiffmerge"
    git config --global mergetool.prompt true
    git config --global mergetool.vsdiffmerge.cmd "\"C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\vsdiffmerge.exe\" \"$REMOTE\" \"$LOCAL\" \"$BASE\" \"$MERGED\" //m"
    git config --global mergetool.vsdiffmerge.keepbackup false
    git config --global mergetool.vsdiffmerge.trustexistcode true
}

setMergeTool()
{
    echo "Welches Merge Tool soll konfiguriert werden? [Standard: KDiff3]"
    echo "1: Meld"
    echo "2: KDiff3"
    echo "3: Visual Studio"
    read choice

    case $choice in
        1) setMeldMergeTool
        ;;
        2) setKDiff3MergeTool
        ;;
        3) setVisualStudioMergeTool
        ;;
        *) setMeldMergeTool
    esac
}

setGeneralGitConfig()
{
    echo "Setze allgemeine Git Konfiguration"
    git config --global credential.helper store
    git config --global push.default simple
    git config --global fetch.prune true
    git config --global url."https://".insteadOf git://
    
    # Disable git's own logic for displaying umlauts and using the bash logic
    # So german umlauts are displayed correctly with this configuration
    git config --global core.quotepath false
}

setBashAliase()
{
    if [ ! -f ~/.bashrc ]
    then
        touch ~/.bashrc
    fi
    
    if ! grep -q "~/.cpx_aliases" ~/.bashrc
    then
        echo "if [ -f ~/.cpx_aliases ]; then . ~/.cpx_aliases; fi" >> ~/.bashrc;
    fi

    rm -f ~/.cpx_aliases

    echo "Setze Bash Aliase"

    echo "alias g='git '" >> ~/.cpx_aliases
    echo "alias gs='git status -s '" >> ~/.cpx_aliases
    echo "alias gdt='git difftool -dir--diff '" >> ~/.cpx_aliases
    echo "alias gdts='git difftool -dir--diff --staged '" >> ~/.cpx_aliases
    echo "alias gd='git diff --word-diff '" >> ~/.cpx_aliases
    echo "alias gds='git diff --staged --word-diff '" >> ~/.cpx_aliases
    echo "alias gl='git -c core.pager=\"less -SRF\" log --graph --all --format=\"%C(yellow)%h%C(reset) - %C(cyan)(%ar)%C(reset) %s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%Creset\" '" >> ~/.cpx_aliases
    echo "alias glm='git -c core.pager=\"less -SRF\" log --graph --all --format=\"%C(yellow)%h%C(reset) - %C(cyan)(%ar)%C(reset) %s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%Creset\" --merges '" >> ~/.cpx_aliases
    echo "alias gr='git reset '" >> ~/.cpx_aliases
    echo "alias grh='git reset --hard '" >> ~/.cpx_aliases
    echo "alias ga='git add --all '" >> ~/.cpx_aliases
    echo "alias gap='git add --patch '" >> ~/.cpx_aliases
    echo "alias gcm='git commit -m '" >> ~/.cpx_aliases
    echo "alias gcma='git commit --amend '" >> ~/.cpx_aliases
    echo "alias gc='git checkout '" >> ~/.cpx_aliases
    echo "alias gb='git branch '" >> ~/.cpx_aliases
    echo "alias gf='git fetch '" >> ~/.cpx_aliases
    echo "alias gm='git merge '" >> ~/.cpx_aliases
    echo "alias gmff='git merge --ff-only '" >> ~/.cpx_aliases
    echo "alias gmr='git merge --no-ff '" >> ~/.cpx_aliases
    echo "alias gmt='git mergetool '" >> ~/.cpx_aliases
    echo "alias grb='git rebase '" >> ~/.cpx_aliases
    echo "alias grbc='git rebase --continue '" >> ~/.cpx_aliases
    echo "gacm() { git add --all; git commit -m \"\$1\"; }" >> ~/.cpx_aliases
    echo "gacmp() { git add --all; git commit -m \"\$1\"; git push; }" >> ~/.cpx_aliases
    echo "gundo() { git reset --hard \$1; git clean -df \$1; }" >> ~/.cpx_aliases

  	echo "__git_complete g _git" >> ~/.cpx_aliases
  	echo "__git_complete gdt _git_difftool" >> ~/.cpx_aliases
  	echo "__git_complete gdts _git_difftool" >> ~/.cpx_aliases
  	echo "__git_complete gd _git_diff" >> ~/.cpx_aliases
  	echo "__git_complete gds _git_diff" >> ~/.cpx_aliases
  	echo "__git_complete gr _git_reset" >> ~/.cpx_aliases
  	echo "__git_complete grh _git_reset" >> ~/.cpx_aliases
  	echo "__git_complete ga _git_add" >> ~/.cpx_aliases
  	echo "__git_complete gap _git_add" >> ~/.cpx_aliases
  	echo "__git_complete gcm _git_commit" >> ~/.cpx_aliases
  	echo "__git_complete gcma _git_commit" >> ~/.cpx_aliases
  	echo "__git_complete gc _git_checkout" >> ~/.cpx_aliases
  	echo "__git_complete gb _git_branch" >> ~/.cpx_aliases
  	echo "__git_complete gf _git_fetch" >> ~/.cpx_aliases
  	echo "__git_complete gm _git_merge" >> ~/.cpx_aliases
  	echo "__git_complete gmff _git_merge" >> ~/.cpx_aliases
  	echo "__git_complete gmr _git_merge" >> ~/.cpx_aliases
  	echo "__git_complete gmt _git_merge" >> ~/.cpx_aliases
  	echo "__git_complete grb _git_rebase" >> ~/.cpx_aliases
  	echo "__git_complete grbc _git_rebase" >> ~/.cpx_aliases
}

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
    git config --global alias.cma "commit --amend"
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

setProMode $1

setConfig "Benutzernamen setzen?" setUsername user.name
setConfig "E-Mail Adresse setzen?" setEmail user.email
setConfig "Setze Diff Tool?" setDiffTool diff.tool
setConfig "Setze Merge Tool?" setMergeTool merge.tool
setConfig "Allgemeine Git Konfiguration setzen?" setGeneralGitConfig
setConfig "Bash Aliase setzen?" setBashAliase
setConfig "Git Aliase setzen?" setGitAliase

echo "Installation abgeschlossen"

exit
