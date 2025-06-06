# Git

## Notes

## git diff

- git diff --> working tree and staging area
- git diff --staged --> staging area and repository
- git diff HEAD --> working tree and repository

## basic-commit

- git works with 3 diff areas

  - working directory (where u makes your changes)
  - staging area (where all changes added through git add will stay)
  - the repository (where every commit ends up, staged changes are put in here by git commit)

## basic-staging

- git works with 3 diff areas

  - working directory (where u makes your changes)
  - staging area (where all changes added through git add will stay)
  - the repository (where every commit ends up, staged changes are put in here by git commit)

- while doing the kata

- I realize some things

  - when you do git diff
    it will compare the working directory with the staged area if poblated if not it will compare with index(HEAD)
  - when you do git diff --cached|--staged
    it will compare the working directory with staged area
  - when you do git diff HEAD
    it will compare what is in the working directory against what is in the (HEAD) commit. It will not consider stagging changes
  - When you do git diff --cached HEAD
    it will compare what is in the staging area with he (HEAD) commit

## basic-branching

- Something I realized is that git doesn't
  compare the whole working directory with HEAD if
  `git diff HEAD`
  it only compares the working directory files once staged or added previously

- Some useful things I saw -> I knew but worth it writting it again for comparing two branches branch_a branch_b then you can do
  `git diff branch_a branch_b`
  this will output the added changes (+) from branch_b taking in consideration branch_a (-)

## Rebase branch

- Looking at the graph generated I can reach the following conclussion, when you do git rebase 'x' what happens is the following a temporay branch is generated that will be the result of checking out to 'x' and then the commits in the current brach are going to be picked and then the current branch will be the temporary branch

```
85ebb17 (HEAD -> uppercase) HEAD@{0}: rebase (finish): returning to refs/heads/uppercase
85ebb17 (HEAD -> uppercase) HEAD@{1}: rebase (pick): Change greeting to uppercase
777f34d (master) HEAD@{2}: rebase (start): checkout master
33f6feb HEAD@{3}: checkout: moving from master to uppercase

```

## Basic revert

- revert command --> git revert <<commit_hash_to_revert>>
  this creates a new commit in wich it explains what changes were reverted, you can still modified the message but that is a way to clean some mistaken commit changes, and then make it clear.

- git revert may revert some commits and remove those chagnges or files creations from working directory but is still there in the git repository so if you go back to the reverted commit you will find the things there

## git reset

- Cool so the first thing I could learn from this command
  is the following if you use the following command
  `git reset --soft HEAD~1`
  this will remove the commit but it will stay in the staging area

- Now I use this command
  `git reset --mixed HEAD~1`
  if I am not wrong is doing both removing commit
  and from staging area both

- Something interesting so basically in this kata
  I needed to do multiple resets with diff flavors (soft,mixed, hard) the first put the changes in the staging are and goes to the set commit, if is a previous one will be like only doing git restore --cached \*files_modifieds
  when mixed this not only remoe the commit but also the staging are and will be only in the working directory
  hard remove everything and leave the working directory as the repository commit, something I saw was I don't lose any file with soft and mixed because they remain in the working directory.

## git clean

- this allows you to clean the work tree (working directory) it removes untracked files
  `git clean -n`
  tells you what it can delete
  `git clean -f -d`
  remove untrcked files -f (--forced) is needed

## amend

- git ammend, does what I knew if modifies last commit
  letting you chnage the message and other things

## advance rebase

- Here is what I am thinking to do

  - doc's commits squashed -> and editing the commit message [x]
  - squash commits modifying hello.test [x]
  - Removing secret commit from history [x]
  - Edit commit message first commit after tag [x]

  ```
  init status
  6c7e04d I forgot a semicolon
  22aac73 Test for feature hello world
  1e6df11 Add doc - step 3
  736a103 Add doc - step 2
  c3efd54 Add doc - step 1
  b4deca5 important secret
  fe9bbf9 debugging
  b1c16e0 Really made the thingy done
  c7d2d4a Finished HW feature
  a36a31f Helo Volrd feature
  d5e9b93 Initial commit



  ```

```
git reflog
fe8c164 HEAD@{0}: rebase (finish): returning to refs/heads/master
fe8c164 HEAD@{1}: rebase (pick): Add doc
7cf4636 HEAD@{2}: rebase (pick): Test for feature hello world
986a018 HEAD@{3}: rebase (start): checkout refs/remotes/origin/master
c8779ab HEAD@{4}: rebase (finish): returning to refs/heads/master
c8779ab HEAD@{5}: rebase (pick): Test for feature hello world
51eb958 HEAD@{6}: rebase (pick): Add doc
986a018 HEAD@{7}: rebase (start): checkout refs/remotes/origin/master
c67882e HEAD@{8}: rebase (finish): returning to refs/heads/master
c67882e HEAD@{9}: rebase (pick): Test for feature hello world
812cacc HEAD@{10}: rebase (pick): Add doc
16575d3 HEAD@{11}: rebase (pick): debugging
986a018 HEAD@{12}: rebase (squash): Hello world feature
3daff85 HEAD@{13}: rebase (squash): # This is a combination of 2 commits.
332b16c HEAD@{14}: rebase (start): checkout refs/remotes/origin/master
b4a423f HEAD@{15}: rebase (finish): returning to refs/heads/master
b4a423f HEAD@{16}: rebase (pick): Test for feature hello world
a37c695 HEAD@{17}: rebase (pick): Add doc
c2447fd HEAD@{18}: rebase (pick): debugging
49b7f47 HEAD@{19}: rebase (pick): Really made the thingy done
9e3ae74 HEAD@{20}: rebase (continue): Finished HW feature
414d2e7 HEAD@{21}: rebase: fast-forward
332b16c HEAD@{22}: rebase (start): checkout refs/remotes/origin/master
f9e6476 HEAD@{23}: rebase (finish): returning to refs/heads/master
f9e6476 HEAD@{24}: rebase (pick): Test for feature hello world
edae9f7 HEAD@{25}: rebase (pick): Add doc
47cc327 HEAD@{26}: rebase (pick): debugging
0945b26 HEAD@{27}: rebase (pick): Really made the thingy done
414d2e7 HEAD@{28}: rebase (pick): Finished HW feature
332b16c HEAD@{29}: rebase (reword): Hello world feature
a36a31f HEAD@{30}: rebase: fast-forward
d5e9b93 HEAD@{31}: rebase (start): checkout v0.0
20177b9 HEAD@{32}: rebase (finish): returning to refs/heads/master
20177b9 HEAD@{33}: rebase (pick): Test for feature hello world
4f8cde1 HEAD@{34}: rebase (pick): Add doc
fe9bbf9 HEAD@{35}: rebase (start): checkout v0.0
6b61c82 HEAD@{36}: rebase (finish): returning to refs/heads/master
6b61c82 HEAD@{37}: rebase (squash): Test for feature hello world
e7410fd HEAD@{38}: rebase (start): checkout refs/remotes/origin/master
e6f7575 HEAD@{39}: rebase (finish): returning to refs/heads/master
e6f7575 HEAD@{40}: rebase (pick): I forgot a semicolon
e7410fd HEAD@{41}: rebase (pick): Test for feature hello world
9b9c466 HEAD@{42}: rebase (squash): Add doc
61b70fe HEAD@{43}: rebase (squash): # This is a combination of 2 commits.
c3efd54 HEAD@{44}: rebase (start): checkout v0.0
6c7e04d HEAD@{45}: commit: I forgot a semicolon
22aac73 HEAD@{46}: commit: Test for feature hello world
1e6df11 HEAD@{47}: commit: Add doc - step 3
736a103 HEAD@{48}: commit: Add doc - step 2
c3efd54 HEAD@{49}: commit: Add doc - step 1
b4deca5 HEAD@{50}: commit: important secret
fe9bbf9 HEAD@{51}: commit: debugging
b1c16e0 HEAD@{52}: commit: Really made the thingy done
c7d2d4a HEAD@{53}: commit: Finished HW feature
a36a31f HEAD@{54}: commit: Helo Volrd feature
d5e9b93 HEAD@{55}: commit (initial): Initial commit


```

```
result

* fe8c164 Add doc
* 7cf4636 Test for feature hello world
* 986a018 Hello world feature
* d5e9b93 Initial commit
```

## git stash

- When using git-stash it puts the changes in a stack
- Few things to keep in mind
  - `git stash` command puts all those changes in a stack
    but it puts both changes in the working directory and changes
    stagged so once you try to do stash pop it will get them back
    but the files that where in the stagged area are removed from there
  - `git stash --index` can be kind of better this will literally left us as
    we where putting the stagging files if they exist in its location

## git rm

- Interesting if I want to remove something from the stagging area
  but keep it in my working directory the command that works is
  `git rm --cached`

- this is key to know .gitignore only ignores files that are not part of the repository yet. If you have already added (git add + git commit) their changes will be still tracked
  to remove them from your repo do (git rm --cached)

- **still doubt because --cached remove them from the index (stagging area) but not
  from the repo itself?**

## git submodules

- I have seem some new things in this kata
  so basically I have taken a git repository and uses it as
  submodule of another git repository
  for doing that == in this case as we are simulating the
  host repository local, I needed to add `git -c protocol.file.allow=always submodule add ../remote include`
  if I execute that command it will simulate a clone of the component repository hosted
  in this case local in the remote folder
  So once that is done if pull from inside include folder, it will brings inside include all the latest changes and merge with the current version, once that is done if i go outside and do git status you will see that there are unstagged changes and it explains if modified or things, I even can modify the submodule making a global impact

- git repo wrapping the submodules, keep track of the commit ids

- need to check this part yet



### Things to check
- [ git-filter-repo for rewriting Git history -Elijah Newren | GitMerge 2024 ](https://www.youtube.com/watch?v=KXPmiKfNlZE)
