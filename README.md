# git-feats [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/cknadler/git-feats) [![Dependency Status](https://gemnasium.com/cknadler/git-feats.png)](https://gemnasium.com/cknadler/git-feats) 

Complete git feats from the command line!

## Installation

Currently still in development and not on rubygems. Eventually: 

    $ gem install git-feats

## Usage

#### Alias

`git-feats` works best when aliased as `git`. Paste the following into your shell config file.

```
alias git=git-feats
```

#### Git

After you alias `git-feats`, just keep using `git` like you always have. Occasionally, you will complete feats and it will look like this:

```
$ git status

********************************************************************************
                                Feat Completed!                                 
                                 Status Report                                  
                 Viewed the working tree status with git status                 
********************************************************************************

# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   README.md
#
no changes added to commit (use "git add" and/or "git commit -a")

```

## Contributing

git-feats has a dead simple interface for making feats. 

Simply add a feat to the `lib/git-feats/feats/feats.yml` file and it will work in the gem.

If you are looking to contribute, that is a great place to start.

Also, the following:

* Tests (probably RSpec)
* Code Cleanup

Any suggestions are also welcomed with open arms.

#### How to contribute

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
