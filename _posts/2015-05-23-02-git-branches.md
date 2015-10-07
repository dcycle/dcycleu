---
layout:     post
title:      "2.3 Git branches and continuous integration"
subtitle:   "Basic git branching, and why having a stable and an unstable branch is useful."
date:       2015-05-23 12:00:00
author:     "Dcycle"
header-img: "img/post-bg-01.jpg"
class:      "2c"
parent:     "<a href=\"/class-02-continuous-integration\">Class 2: Continuous integration</a>"
---

Until now when we've wanted to _push_ our changes back to GitHub, we have used the following command:

    git push origin gh-pages

What is this `gh-pages`? It is a **branch** of your project. You can think of a branch as a version of your project.

Your project can create any number of branches, and it is useful to distinguish between _production_ and _feature_ branches, although this is by convention only: production and feature branches are technically the same type of beast.

A _production_ branch contains code which is actually used (or ready to be used) in a real life environment with real users. In our case, `gh-pages` is a production branch because changes to it are always seen by our users. Most organizations are careful about changing production branches of projects, because failures can be very visible.

The following example is typical of how most organizations deploy code:

 * A production website is running commit `abc` of the production branch.
 * Business stakeholders decide they want to launch a certain feature on Monday at 9 a.m.
 * Developers update the master branch to commit `def`, which has the given feature.
 * Commit `def` fails automated testing, so developers fix it and have the feature ready and passing tests on commit `xyz` of the production.
 * An environment different from production (with a different URL, often accessible by password) runs on commit `xyz` of the master branch, so stakeholders can test the functionality.
 * On Monday morning at 9 a.m., the production site is updated to run on commit `xyz` of the production branch.

In the case of our website running the `gh-pages` branch, the very fact of pushing code to that branch updates our production site, so the above scenario becomes impossible. In fact, the approach of automatically deploying code to production when a given branch is updated simplifies development, and reduces confusion: one always knows exactly which version of the code is running on production simply by looking at the latest commit of the production branch.

Any developer can simply:

    core@core-01 ~/share/startbootstrap-clean-blog-jekyll $ git pull origin gh-pages
    From github.com:dcycleproject/startbootstrap-clean-blog-jekyll
     * branch            gh-pages   -> FETCH_HEAD
    Already up-to-date.
    core@core-01 ~/share/startbootstrap-clean-blog-jekyll $ git log -n1
    commit f3e07b923d639ee39d98054aa8172b1db63e60b2
    Author: Albert Albala <albert@mediatribe.net>
    Date:   Wed Apr 1 09:38:39 2015 -0400

        Issue #1: change the subtitle

(`git log -n1` shows the latest 1 commit information for your repo.)

In this case there is no confusion: we know that our site is running on version `f3e07b9` of our code.

Organizations who want to automatically deploy code from a given branch to their production environment can use a variety of techniques, but we'll stick to using GitHub's Pages system for now, which is good enough for our purposes.

So how do we develop features that are not immediately available on production? Of course, we can simply develop them locally and not _push_ our changes to GitHub. But this has its limitations, and prevents us from sharing this code with colleagues.

Enter _feature branches_.

A _feature_ branch is a version of your code your end users can't readily use, but which is used for development and testing. Typically, when a feature branch passes tests, code review, and other quality gates, it is moved ("merged") to the production branch.

Different organizations have a different number of quality gates, many have none whatesoever, but typically before a feature is merged to production, the following quality gates must be passed:

 * Code must be peer-reviewed, including for security and performance considerations.
 * Code must pass automated tests.
 * Non-technical stakeholders must manually test the feature on a non-production environment, often called _preprod_ or _staging_.

For example, let's say you want to try changing all images on your site to black and white, just to see what it looks like. You don't want to commit this to your production branch just yet, you can you can create a new branch where all images are in black and white, and call that branch `black-and-white`. In the case of our blog, only the branch `gh-pages` has a reserved use (that is, it is automatically published live), so any other branch name is available for our use.

To see all the branches in your projects you can type:

    $ git branch
    * gh-pages
      master

In the above example, `gh-pages` is starred and hence is the active branch. (You might not see `master` at all on your project, depending on how you created it; we will avoid using the name `master` for now, just remember that `master` is the default name of the first branch on any new git project, and hence it is often used as a production branch by many organizations, but it does not have to be so.)

Let's call `gh-pages` our _production_ branch, because that's the branch that corresponds to our live site.

We have already seen that it is useful to always have your code in a passing state, but what do we do if we want to try a change, make sure it works, and move it to your production branch only if it works. It may in fact be useful to have a place to store failing code without alerting the entire organization that our project is failing.

This is where _feature branches_ come in, and here is how they work.

 * Our production branch (in this case it's `gh-pages`, but in the case of a Drupal module it may be something like `7.x-1.x`, and for other projects it may be `master`) is passing.
 * We are asked to make a change to the site which may potentially break the build.
 * Instead of working on our production branch, we will work on another branch, a feature branch.
 * When the team is satisfied with the code on the feature branch, it is _merged_ to the production branch.

Many new developers have an intuition that branching is somehow complex and must be done only if necessary. Many developers who have used legacy version control systems such as Subversion or CVS (if you have never heard of these, consider yourself lucky) also avoid branching because on old systems branching was a headache.

Before doing anything else, let's create several branches and merge them together, and manage conflicts, just to see how easy, fast, and inexpensive it is. By inexpensive, I mean that it requires almost no resources, because `git` is smart: it only stores the difference (often called the _delta_) between branches, so if you have 10 branches and they are all identical, it will take as much space and be as fast as having a single branch. If you make 10 minor changes to each of the ten branches, only those changes are stored in git.

Start by moving to your shared folder and creating a new git repo.

    core@core-01 ~/share/startbootstrap-clean-blog-jekyll $ cd ..
    core@core-01 ~/share $ mkdir branching-demo
    core@core-01 ~/share $ cd branching-demo
    core@core-01 ~/share/branching-demo $ echo 'Branching demo' >> README.md
    core@core-01 ~/share/branching-demo $ echo '' >> README.md
    core@core-01 ~/share/branching-demo $ echo 'This prodject is a simple demo for branching' >> README.md
    core@core-01 ~/share/branching-demo $ echo 'and we will:' >> README.md
    core@core-01 ~/share/branching-demo $ echo '' >> README.md
    core@core-01 ~/share/branching-demo $ echo ' * Create branches' >> README.md
    core@core-01 ~/share/branching-demo $ echo ' * Merge them to master' >> README.md
    core@core-01 ~/share/branching-demo $ echo ' * Manage conflicts' >> README.md
    core@core-01 ~/share/branching-demo $ git add README.md
    core@core-01 ~/share/branching-demo $ git init
    Initialized empty Git repository in /home/core/share/branching-demo/.git/
    core@core-01 ~/share/branching-demo $ git add README.md
    core@core-01 ~/share/branching-demo $ git commit -am 'Initial commit'
    [master (root-commit) b83a56c] Initial commit
     1 file changed, 8 insertions(+)
     create mode 100644 README.md

At this point you have a working git repository with a file called README.md in it. You can view the contents of README.md with your text editor on your host computer, or on the command line:

    core@core-01 ~/share/branching-demo $ cat README.md
    Branching demo

    This prodject is a simple demo for branching
    and we will:

     * Create branches
     * Merge them to master
     * Manage conflicts

Because this is a brand new git repo, the `master` branch already exists and we are on it:

    core@core-01 ~/share/branching-demo $ git branch
    * master

Let's switch to a new branch where we will make the words "Branching demo" uppercase:

    core@core-01 ~/share/branching-demo $ git checkout -b uppercase-title
    Switched to a new branch 'uppercase-title'
    core@core-01 ~/share/branching-demo $ git branch
      master
    * uppercase-title

Now, in your text editor, change "Branching demo" to "BRANCHING DEMO". You can now see that there has been a change:

    core@core-01 ~/share/branching-demo $ git status
    On branch uppercase-title
    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)

      modified:   README.md

    no changes added to commit (use "git add" and/or "git commit -a")

To see what exactly the change is, use `git diff`:

    core@core-01 ~/share/branching-demo $ git diff

You should now see something like this:

    diff --git a/README.md b/README.md
    index 77e95d1..5e2e666 100644
    --- a/README.md
    +++ b/README.md
    @@ -1,4 +1,4 @@
    -Branching demo
    +BRANCHING DEMO

     This prodject is a simple demo for branching
     and we will:
    lines 1-10/10 (END)

Notice the lines `-Branching demo` (the minus sign tells us that "Branching demo" was removed) and `+BRANCHING DEMO` (the plus sign tells us that "BRANCHING DEMO" was added). In some cases you will be stuck on this page and can't get back to the command line. This is because you are in the `vi` command line text editor. Simply type in `:q` and you will quit that text editor.

Let's commit our change now:

    core@core-01 ~/share/branching-demo $ git commit -am 'Changed title to uppercase'
    [uppercase-title 217e603] Changed title to uppercase
     1 file changed, 1 insertion(+), 1 deletion(-)

At any time, you can switch back to the master branch by _checking it out_:

    core@core-01 ~/share/branching-demo $ git branch
      master
    * uppercase-title
    core@core-01 ~/share/branching-demo $ git checkout master
    Switched to branch 'master'
    core@core-01 ~/share/branching-demo $ git branch
    * master
      uppercase-title

If you have `README.md` open in a text editor, you will see "BRANCHING DEMO" change back to "Branching demo". Try checking out `uppercase-title` again and you will see "BRANCHING DEMO" in your text editor.

Merging
-----

When you are ready to merge your change into the production branch (in our case `master`), simply switch to the target branch and use the `merge` command. It is considered good practice to delete the feature branch at the same time, to avoid having stale branches lying around:

    core@core-01 ~/share/branching-demo $ git checkout master
    Already on 'master'
    core@core-01 ~/share/branching-demo $ git merge uppercase-title
    Updating b83a56c..217e603
    Fast-forward
     README.md | 2 +-
     1 file changed, 1 insertion(+), 1 deletion(-)
    core@core-01 ~/share/branching-demo $ git branch -d uppercase-title
    Deleted branch uppercase-title (was 217e603).
    core@core-01 ~/share/branching-demo $ git branch
    * master

Branches and remote repositoritories
-----

In the above example, we are dealing with a local git repository, so we can't push branches anywhere. But with a repo like our blog, if we use feature branches, pushing branches is always the same:

    git push origin my-branch-name

And when you delete a local branch, make sure to also delete it from the origin using the `:` (colon) notation.

    git branch -d my-branch-name
    git push origin :my-branch-name

The above command is perhaps unintuitive, but it deletes `my-branch-name` from the remote repository.

Conflicts
-----

Let's simulate a conflict so we know what to do when it actually happens in real life. Let's create two branches, `semicolon-list`, and `capitalize-list`.

    core@core-01 ~/share/branching-demo $ git checkout -b semicolon-list
    Switched to a new branch 'semicolon-list'
    core@core-01 ~/share/branching-demo $ git checkout -b capitalize-list
    Switched to a new branch 'capitalize-list'

In `capitalize-list`, make the following change and commit:

     * Create Branches
     * Merge Them To Master
     * Manage Conflicts

In `semicolon-list`, make the following change and commit:

     * Create branches;
     * Merge them to master;
     * Manage conflicts;

Now let's switch to `master` and merge in `capitalize-list`:

    core@core-01 ~/share/branching-demo $ git checkout master
    Switched to branch 'master'
    core@core-01 ~/share/branching-demo $ git merge capitalize-list
    Updating 217e603..7db41d6
    Fast-forward
     README.md | 6 +++---
     1 file changed, 3 insertions(+), 3 deletions(-)

When we try to merge in `semicolon-list`, we get the following error:

    core@core-01 ~/share/branching-demo $ git merge semicolon-list
    Auto-merging README.md
    CONFLICT (content): Merge conflict in README.md
    Automatic merge failed; fix conflicts and then commit the result.

If you look at your README.md file in your text editor now, you will see:

    BRANCHING DEMO

    This prodject is a simple demo for branching
    and we will:

    <<<<<<< HEAD
     * Create Branches
     * Merge Them To Master
     * Manage Conflicts
    =======
     * Create branches;
     * Merge them to master;
     * Manage conflicts;
    >>>>>>> semicolon-list

This tells us that the `HEAD` (HEAD means the branch we are merging into) differs from `semicolon-list`, and gives us the details of each. In complex files, there can be several of these `<<</===/>>>` blocks; you must fix each one before merging in.

In real workflows, _it is the responsibility of the feature branch developer(s)_ to avoid conflicts, so feature branch developers must continually merge in the latest version of HEAD (in this case master) to avoid conflicts.

In the above example, if the project maintainer was asked to merge in `semicolon-list`, he or she would not fix the conflicts, but rather tell the `semicolon-list` that their work is incomplete because of conflicts. Let's go back to the latest stable version of `master` and do the fixes on the `semicolon-list` branch instead:

    core@core-01 ~/share/branching-demo $ git reset --hard
    HEAD is now at 7db41d6 capitalize
    core@core-01 ~/share/branching-demo $ git checkout semicolon-list
    Switched to branch 'semicolon-list'
    core@core-01 ~/share/branching-demo $ git merge master
    Auto-merging README.md
    CONFLICT (content): Merge conflict in README.md
    Automatic merge failed; fix conflicts and then commit the result.

Now let's go into our README.md file and fix the conflicts. In this case we want to apply both the capitalization and the semicolon at the end of lists, like so:

    BRANCHING DEMO

    This prodject is a simple demo for branching
    and we will:

     * Create Branches;
     * Merge Them To Master;
     * Manage Conflicts;

Let's now commit our change, move back to master and now we will be able to merge in our `semicolon-list` branch:

    BRANCHING DEMO

    This prodject is a simple demo for branching
    and we will:

     * Create Branches;
     * Merge Them To Master;
     * Manage Conflicts;

The reason we want to fix the conflict in the feature branch and not in master is because the team responsible for the feature branch knows what they want to accomplish, and it is often harder for the person merging into master to know how to fix conflicts to achieve the desired result. Moreover, it is sometimes not even a human being merging branches into production, but some sort of automated script, so get in the habit of often merging in the production branch into your feature branches, and fixing conflicts in the production branches.
