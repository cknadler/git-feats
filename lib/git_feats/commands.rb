module GitFeats

  module Commands

    extend self

    def parse(args)

      case args.command

      when 'add'
        unlock_feat "Bricks and Mortar",
          "Added files to the index area for inclusion in the next commit with git add"

      when 'am'
        unlock_feat "Delivery",
          "Applied a patch using git am"

      when 'bisect'
        unlock_feat "Bug Hunter",
          "Used git bisect to perform a binary search to find which change introduced a bug"

      when 'blame'
        unlock_feat "Blame Game",
          "Used git blame to annotate a file with information about changes"

      when 'bundle'
        unlock_feat "Cold Transfer",
          "Bundled git objects and refs with git bundle"

      when 'cherry-pick'
        unlock_feat "Fine Grain",
          "Applied a commit from one branch to another with git cherry-pick"

      when 'checkout'
        unlock_feat "Shopping Spree",
          "Changed branches with git checkout"
        if args[2] == '-b'
          unlock_feat "Impulse Buy", 
            "Created a new branch with git checkout -b"
        end

      when 'clean'
        unlock_feat "Mr. Clean",
          "Used git clean to remove untracked files from the working tree"

      when 'clone'
        unlock_feat "Replicator",
          "Used git clone to copy a repository into a new directory"

      when 'commit'
        unlock_feat "Author",
          "Made a commit using git commit"

      when 'commit-tree' || 'hash-object' || 'update-index' || 'update-ref'
        unlock_feat "Pretty Hardcore",
          "Used a command that most git users have never even heard of"

      when 'config'
        unlock_feat "Tinkerer",
          "Used git config to set configuration options"

      when 'diff'
        unlock_feat "Foreshadowing",
          "Used git diff to see a diff of changes"

      when 'fetch'
        unlock_feat "Expansion",
          "Fetched objects and refs from another repository"

      when 'filter-branch'
        unlock_feat "Hedge Trimming",
          "Rewrote a branch with git filter-branch"

      when 'format-patch'
        unlock_feat "Licking Stamps",
          "Prepared patches for email submission with git format-patch"

      when 'gc'
        unlock_feat "Housekeeping",
          "Optimized a local repository with git gc"

      when 'grep'
        unlock_feat "Private Investigator",
          "Searched tracked files using git grep"

      when 'imap-send'
        unlock_feat "Mailman",
          "Sent patches to an IMAP folder using git imap-send"

      when 'init'
        unlock_feat "Empty Lot",
          "Initialize a git repository with git init"

      when 'instaweb'
        unlock_feat "Pixels Everywhere",
          "Browse your working repository on gitweb with git instaweb"

      when 'log'
        unlock_feat "Historian",
          "Read the commit history with git log"

      when 'merge'
        unlock_feat "Unification",
          "Joined two or more commit histories with git merge"

      when 'mv'
        unlock_feat "Moving Day",
          "Moved something with git mv"

      when 'pull'
        unlock_feat "Assimilation",
          "Fetched from and merged with another repository with git pull"

      when 'push'
        unlock_feat "Social Butterfly",
          "Pushed a branch to a remote repository using git push"

      when 'rebase'
        unlock_feat "Slice and Dice",
          "Rebased local commits to updated upstream head"

      when 'reflog'
        unlock_feat "Seamstress",
          "Investigated old branches using git reflog"

      when 'remote'
        if args[2] == 'add'
          unlock_feat "Connected",
            "Added an external repository with git remote add"
        end

      when 'reset'
        unlock_feat "Second Guess",
          "Changed the current HEAD state with git reset"

      when 'rm'
        unlock_feat "Destruction",
          "Removed something with git rm"

      when 'shell'
        unlock_feat "Annex",
          "Loaded a restricted login shell for Git-only SSH access with git shell"

      when 'show'
        unlock_feat "Showoff",
          "Displayed one or more objects (blobs, trees, tags and commits) with git show"

      when 'show-branch'
        unlock_feat "Forest Map",
          "Displayed a branch graph with git show-branch"

      when 'stash'
        unlock_feat "Hoarder",
          "Stashed local changes using git stash"

      when 'status'
        unlock_feat "Status Report",
          "Viewed the working tree status with git status"

      when 'submodule'
        if args[2] == 'add' 
          unlock_feat "Sublet",
            "Added a submodule with git submodule add"
        elsif args[2] == 'update'
          unlock_feat "Renovations",
            "Updated one or more submodules with git submodule update"
        end

      when 'svn'
        unlock_feat "Dinosaur",
          "Streamed changes to svn with git svn"

      when 'tag'
        unlock_feat "Label Wizard",
          "Created, deleted or listed one or more tags with git tag"

      when 'whatchanged'
        unlock_feat "History Professor",
          "Showed the difference each commit introduced with git whatchanged"

      end
    end

    private

    def unlock_feat(name, desc)
      puts name
      puts desc
    end
  end
end
