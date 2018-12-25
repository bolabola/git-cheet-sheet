--------------------setup and config----------------------------
$ git config [--global] user.name "<name>"                    # set the name that will be attached to your commits and tags 
$ git config [--global] user.email "<email address>"          # set the e-mail address that will be attached to your commits and tags 
$ git config [--global] -e                                    # open the global configuration file in a text editor for manual editing.
$ git config [--global] alias.<alias-name> <git-command>      # create shortcut for a $git command.
$ git config -l                                               # list all variables set in config file
------------------------------getting and creating projects------------------------------
$ git init [directory]                                        # initialize a git repository in the current working directory
$ git clone <repo>                                            # clone a remote repository 
$ git remote add <name> <url>                                 # create a new connection to a remote repo. after adding a remote, youcan use <name> as a shortcut for <url> in other commands.
$ git remote -v                                               # shows the name of remote repositories
$ git remote rm [remote repo name]                            # removes the remote repository
------------------------------basic snapshotting------------------------------
$ git add <file>                                              # start tracking a file or add its current state to the index
$ git add .                                                   # !!!add everything which is untracked or has been changed to the index
$ git add -u                                                  # stage all changes of file which has been tracked
$ git status                                                  # list which files are staged, unstaged, and untracked.
$ git status -s -b                                            # shows a short version of the status

$ git diff                                                    # show unstaged changes between index and working directory
$ git diff --cached                                           # show difference between index and last repo. 
$ git diff head                                               # show difference between working directory and repo.
$ git diff head -- ./test                                     # compare with the tip of the current branch, but limit the comparison to the file "test".

$ git commit -m 'message'                                     # commit the staged snapshot with message
$ git commit --amend [-m 'message']                           #replace the last commit with the staged changes and last commit combined. use with nothing staged to edit the last commit¡¯s message
$ git commit -am 'message'                                    # commit all tracked files to repo
$ git commit --allow-empty                                    # perform a commit with an empty message

$ git rm --cached <file>                                      # removes the file from version control but preserves the file locally
$ git rm <file>                                               # deletes the file from the working directory and index              
$ git mv <file_from> <file_to>                                # move/rename file

------------------------------branching and merging------------------------------
$ git branch                                                  # list all local branches
$ git branch -a                                               # list all branches
$ git branch -r                                               # list all remote branches
$ git branch -v                                               # list last commit of all branches
$ git branch -vv
$ git branch --merged                                         # list branches already merged 
$ git branch --no-merged                                      # list branches not merged
$ git branch -d <branch>                                      # delete branch(-d force delete)
$ git branch -r -d  <remote branch>                           # delete the remote-tracking branches(will not delete remote branch)
$ git branch -m <branch1> <branch2>                           # rename local branch
$ git branch <branch> [commit]                                # create new branch and head will point to commit
$ git branch --track <local-branch> <remote-branch>           # create a new local-branch and track remote-branch
$ git branch --set-upstream-to=<remote-branch> [local-branch] # current branch set up to track remote branch
$ git branch -u <remote-branch> [local-branch]                # current branch set up to track remote branch,same as --set-upstream-to
$ git cherry-pick <id>                                        # merge a chosed commit

$ git checkout -                                              # checkout previous branch
$ git checkout --orphan <branch_name>                         # create a new orphan branch,reach a git init-like situation on a non-new repository.
$ git checkout <branch/tag>                                   # checkout an existing branch or tag 
$ git checkout -b <branch> [branch/tag]                       # create and check out a new branch named <branch> from <branch> or <tag>   
$ git checkout [-b <branch>] -t <remote>/<branch>             # when creating a new branch, set up "upstream" configuration   
$ git checkout -m [new-branch-name]                           # rename branch          
$ git checkout -- <file_name>                                 # checkout file from repo
$ git merge <branch>                                          # merge <branch> into the current branch. 
$ git merge --no-commit -s recursive -x theirs <branch>       # merge branch to current branch with no commit and use theirs if find conficts

$ git log --follow <file>                                     # continue listing the history of a file beyond renames (works only for a single file).
$ git log --pretty=format:"%h - %an, %ar : %s"                # format log
$ git log --graph                                             # draws a text based graph of commits on left side of commit msgs
$ git log -<limit>                                            # limit number of commits by <limit> .
$ git log --stat                                              # include which files were altered and the relative number of lines that were added or deleted from each of them.
$ git log --numstat                                           # similar to --stat, but shows number of added and deleted lines in decimal notation and pathname without abbreviation. for binary files, outputs two - instead of saying 0 0.
$ git log -p                                                  # display the full diff of each commit.
$ git log --decorate                                          # adds names of branches or tags of commits shown.
$ git log --oneline                                           # condense each commit to a single line.       
$ git log --author="<pattern>"                                # search for commits by a particular author. 
$ git log --grep="<pattern>"                                  # search for commits with a commit message that matches <pattern>. 
$ git log <since>..<until>                                    # show commits that occur between <since> and <until>. args can be a commit id, branch name, head, or any other kind of revision reference.   
$ git reflog                                                  # show a log of changes to the local repository's head. add --relativedate flag to show date info or --all to show all refs.

$ git stash                                                   # temporarily stores all modified tracked files
$ git stash pop                                               # restores the most last stashed files and deletes the stashed changeset
$ git stash apply                                             # restores the most last stashed files and keep the stashed changeset
$ git stash list                                              # lists all stashed changesets
$ git stash drop                                              # deletes the last stashed changeset
$ git stash clear                                             # clear the stash

$ git tag                                                     # show existing tag
$ git tag <tag> [commit]                                      # create a lightweight tag .add 'commit' to tag a specific commit instead of current one.
$ git tag -a <tag>                                            # create annotated tag  
$ git tag -a <tag> [commit] [-m <message>]                    # create annotated tag  
$ git tag -d <tag>                                            # remove a tag from a local repo

                                                              # remove local tags that already not exist in remote
$ git tag -l | xargs git tag -d 
$ git fetch origin -p 

$ git reset [--hard] [commit]                                 # same as previous, but resets both the staging area & working directory to match. deletes uncommitted changes, and all commits after <commit>.
$ git reset [file]
$ git ls-files                                                # show information about files in the index and the working tree
$ git ls-tree -r --name-only <branch/tag>                     # list the files contained in branch or tag
$ git revert <commit>                                         # 
$ git rev-parse <branch/tag>                                  # show sha1 of branch or tag
$ git grep "xxxx"                                             # search "xxxx"

------------------------------sharing and updating projects---------------------------------
$ git fetch [<remote> <branch>]                               # fetches a specific <branch>, from <remote>
$ git fetch --prune                                           # deleting the refs to the branches that don't exist on the remote,
$ git remote prune origin                                     # deleting the refs to the branches that don't exist on the remote,
$ git pull [<remote> <branch>]                                # fetches and merge a specific <branch>, from the remote 
$ git push <remote> <branch>                                  # push current branch to the specified remote
$ git push -u <remote> <branch>                               # creates an upstream tracking connection and is especially useful when publishing a local branch on a remote for the first time.
$ git push <remote> --force                                   # forces the$ git push even if it results in a non-fast-forward merge. do not use the --force flag unless you¡¯re absolutely sure you know what you¡¯re doing
$ git push <remote> --all                                     # push all of your local branches to the specified remote
$ git push <remote> --tags                                    # tags aren¡¯t automatically pushed when you push a branch or use the --all flag. the --tags flag sends all of your local tags to the remote repo
$ git push <remote> --delete <branch|tag>                     # delete branch or tag from remote
$ git push <remote> :<branch/tag>                             # delete branch or tag from remote

------------------------------inspection and comparison------------------------------
$ git clean -n                                                # shows which files would be removed from working directory.
$ git clean -f -d                                             # removes untracked files and directories
$ git clean -f -d -x                                          # same as above but also removes ignored files

$ git blame <file>                                            # list the change dates and authors for a file

                                                              # check for errors and cleanup repository
$ git fsck
$ git gc --p