# 1. rebase currentBranch from origin
# 2. checkout develop
# 3. rebase origin
# 4. checkout current branch
# 5. merge develop
getDev()
{
  currentBranch=$(git rev-parse --abbrev-ref HEAD)

  echo 'pull origin/'$currentBranch
  gpl
  
  echo 'checkout develop'
  go develop

  echo 'pull origin/develop'
  gpl

  echo 'checkout'$currentBranch
  go $currentBranch

  echo 'merge develop'
  gm develop
}

# 1. create branch locally
# 2. checkout created branch
# 2. push branch to origin
# 3. set origin/branch as upstream for current branch
remoteBranch()
{
  if [ -z "$1" ]
    then
      echo '-Parameter #1 must have a value (branch name)'
      return -1;
  fi

  go -b $1
  gps -u origin $1
  gb --set-upstream-to=origin/$1
}

# 1. delete local branch (HARD)
# 2. delete remote branch
deleteRemote()
{
  if [ -z "$1" ]
    then
      echo '-Parameter #1 must have a value (branch name)'
      return -1;
  fi

  gb -D $1
  gps origin --delete $1
}

listRemoteBranches()
{
   git for-each-ref --format='%(committerdate) %09 %(authorname) %09%09 %(refname)' | sort -k7 | grep "refs/remotes/origin"
}

__git_complete deleteRemote _git_branch
