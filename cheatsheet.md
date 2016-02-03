# Create

## $ git clone <remoteurl>
  Creates a local clone of a remote repository (in TFS, the URL can be found at "Code > Clone")

# Local Changes

## $ git status
  Shows all local changes in the current repository

## $ git diff
  Shows all local changes for already tracked files in your repositoy in detail

## $ git add <file path>
  Add changes (incl. deleting and adding) on the specified file
  
## $ git add .
  Add all changes (incl. deleted and added files) to staging
  
## $ git commit
  Commit the currently staged changes
  1. It opens the (in the .gitconfig defined) editor to enter the commit message
  2. To execute the commit close the editor after entering the commit message
  
## $ git commit -a|all
  Stages all changes in tracked files (**NOT NEW FILES**) and executes the *commit* command

## $ git commit -m|message <msg>
  Commits the currently staged files with the given commit message in *msg*
  
## $ git commit -amend
  Reverts the last commit to enable changes to it
  * ***DO NOT AMEND PUBLISHED COMMITS***
  
# Commit History

## $ git log -p <file>
  Shows a (simplified) version history for a specific file

## $ git log -p <file> --full-history
  Shows a full version history of a file

## $ git blame <file>
  Shows the detailed changes made to a file (who changed what and when, for each line the last change)

# Branches & Tags

# Update & Publish

## $ git fetch
  Retrieves a changes of a remote repository (if multiple remote repositories are assigned to a local one, the specific repo has to be named)

## $ git pull
  Retrieves all changes of a remote repository (see git pull) and integrates changes of a connected remote branch into the local one (changes on both sides causes a merge)

## $ git push
  Sends local changes to the configured remote repositories
  Which contents are pushed depends on the configuration setting "push.default"
  In the branches pushed to the remote, there must not exist any pending remote changes

# Merge & Rebase

# Undo
