---
layout: default
title: Git Session
type: misc
objectives:
    - Understand the benefits of VCS in general
    - Install and configure git
    - Gain basic understanding of the way git works to store and manipulate changes
    - Learn and be able to use at least basic git commands
    - Be able to revert changes in git in all the basic ways

---

##Version Control
Talk about how we will be using version control throughout this course. Ask
first if anyone is familiar with VCS, then ask why it would be a useful or important tool

1. Comparison with previous versions of work
2. Keeping a log of changes
3. Facilitate coordination with larger teams.
4. See who made what changes and when. Find who to ask questions to about certain logic (tracking ownership of constituent parts)
5. Allows rolling back (broken) deploys to previous (working) versions, or recovery of lost code.
6. Never be afraid of losing work.
8. Allows working on several different features (branches) at the same time.

Briefly discuss simple git commands


And, possibly if you're feeling bold:

* `git push`
* `git pull`

###Main elements of git
- git add selects changes
- git commit records changes
- git push shares changes

###Configure git
1. git config --global user.name "Your Name Here"
2. git config --global user.email "your_email@example.com"
3. git config --global color.ui true

###Initial git setup and basic commands
1. `git init`
2. `git status`
3. `git log`
4. `git add`
5. `git rm`
6. `git commit`

###Checkout previous version
  1. git checkout [hashcode]
    1. Now in detached head state
      1. This means that HEAD (the part of git that tracks what your current working directory should match) is pointing directly to a commit rather than a branch
      2. Any changes committed will be lost when switching branches
        1. Unless you create a new branch for the changes
      3. This is usually a good time to draw the git diagram as follows:
![git checkout head image](/assets/images/git-checkout-head.png)
  3. git checkout master
    1. Returns to trunk

###Git diffing changes
  1. git diff [revision_number_1] [revision_number_2]
  2. show --cached flag to check staged changes

###Undoing changes
  1. Local changes, before staging
    1. git checkout [file]
  3. Staged changes
    1. git reset HEAD [file]
      1. Changes still exist in working directory
  5. Committed changes
    1. git revert HEAD
      1. Undoes LAST commit
      2. Can revert to any other commit as well with revert [hash_code]
  7. Removing commits completely from log
    1. git reset [hash_code or HEAD] --hard

###Amending a commit
  1. git commit --amend
    1. If changing message, previous commit message will be altered

###Adding removals of files to git
  1. git add . doesn't work with removed files
  2. Can either git rm each file
  3. Or git clean -d to delete all files in the git repo which are not in your current working directory (fastest)
    1. https://www.atlassian.com/git/tutorial/undoing-changes#!clean
  5. Can also git add -u
    1. This tells git to automatically stage tracked files -- including deleting the previously tracked files.

###Add remote repo
  1. Add new remote git repo
    1. git remote add origin https://github.com/location
    2. git push -u origin master
      1. -u = set upstream location

###Exemplify merge conflict
  1. Create repo, make check in
  2. Clone repo in another location
  3. Check in change that has 1 or 2 conflicting lines and 1 or 2 non conflicting
  4. Pull from other side, show one part of conflict was auto merged, other part wasn't
  5. Resolve conflict and push

###Check remote changes:
  1. git fetch remote origin
    1. Gets changes but doesn't merge them
  3. git log -p HEAD..FETCH_HEAD
    1. Compares to fetched changes

###Fetch and merge a branch
  1. git fetch [branch_name]
    1. Pulls in changes not present in your local repository, without modifying your files
  3. git checkout master
    1. Switch to master branch
  5. git merge [branch_name]/master

###Get changes back that were lost in reset
  1. git reflog
    1. Get a list of all changes by hashcode
  3. Can revert back to before you lost your changes
