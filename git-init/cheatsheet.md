<h1 id="create">Create</h1>

<hr>

<hr>



<h2 id="heading">Heading</h2>



<h2 id="git-init">$ git init</h2>

<p>Initializes an empty repository</p>



<h2 id="git-clone-remoteurl">$ git clone <em>remoteurl</em></h2>

<p>Creates a local clone of a remote repository (in TFS, the URL can be found at “Code &gt; Clone”)</p>



<h1 id="local-changes">Local Changes</h1>



<h2 id="git-status">$ git status</h2>

<p>Shows all local changes in the current repository</p>



<h2 id="git-diff">$ git diff</h2>

<p>Shows all local changes for already tracked files in your repositoy in detail</p>



<h2 id="difftool-dir-diff">$ difftool –dir-diff</h2>

<p>Start configured diff tool and showing all changes in tree view like mode</p>



<h2 id="git-add">$ git add </h2>

<p>Add changes (incl. deleting and adding) on the specified file</p>



<h2 id="git-add-1">$ git add .</h2>

<p>Add all changes (incl. deleted and added files) to staging</p>



<h2 id="git-commit">$ git commit</h2>

<p>Commit the currently staged changes <br>
  1. It opens the (in the .gitconfig defined) editor to enter the commit message <br>
  2. To execute the commit close the editor after entering the commit message</p>



<h2 id="git-commit-a">$ git commit -a</h2>

<p>Stages all changes in tracked files (<strong>NOT NEW FILES</strong>) and executes the <em>commit</em> command</p>



<h2 id="git-commit-m-msg">$ git commit -m <em>msg</em></h2>

<p>Commits the currently staged files with the given commit message in <em>msg</em></p>



<h2 id="git-commit-amend">$ git commit -amend</h2>

<p>Reverts the last commit to enable changes to it <br>
  * <strong><em>DO NOT AMEND PUBLISHED COMMITS</em></strong></p>



<h1 id="commit-history">Commit History</h1>



<h2 id="git-log">$ git log</h2>



<h2 id="git-log-file">$ git log <em>file</em></h2>

<p>Shows a (simplified) version history for a specific file</p>



<h2 id="git-blame">$ git blame </h2>

<p>Shows the detailed changes made to a file (who changed what and when, for each line the last change)</p>



<h1 id="branches-tags">Branches &amp; Tags</h1>



<h2 id="git-branch">$ git branch</h2>



<h2 id="git-tag-a">$ git tag [-a]</h2>



<h2 id="git-push-tags">$ git push –tags</h2>



<h1 id="update-publish">Update &amp; Publish</h1>



<h2 id="git-fetch">$ git fetch</h2>

<p>Retrieves a changes of a remote repository (if multiple remote repositories are assigned to a local one, the specific repo has to be named)</p>



<h2 id="git-pull">$ git pull</h2>

<p>Retrieves all changes of a remote repository (see git pull) and integrates changes of a connected remote branch into the local one (changes on both sides causes a merge)</p>



<h2 id="git-push">$ git push</h2>

<p>Sends local changes to the configured remote repositories</p>

<p>Which contents are pushed depends on the configuration setting “push.default”</p>

<p>In the branches pushed to the remote, there must not exist any pending remote changes</p>



<h1 id="merge-rebase">Merge &amp; Rebase</h1>



<h2 id="git-merge">$ git merge</h2>



<h2 id="git-merge-ff-only">$ git merge –ff-only</h2>



<h2 id="git-merge-no-ff">$ git merge –no-ff</h2>



<h2 id="git-mergetool">$ git mergetool</h2>



<h1 id="undo">Undo</h1>



<h2 id="git-reset">$ git reset</h2>

<p>Reset changes from index</p>



<h2 id="git-checkout">$ git checkout</h2>

<p>Revert changes back to commited state</p>