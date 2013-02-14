# git-feats [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/cknadler/git-feats) 

`git-feats` is a command line wrapper for `git` that allows you to complete feats based on your `git` usage.

## Installation

    $ gem install git-feats
    
`git-feats` is is best aliased as `git`, so you can type `$ git <command>` as you normally would and complete feats.

See [alias](#alias) for instructions.

## Usage

#### With alias

If you alias `git-feats`, just keep using `git` like you always have. Occasionally, you will complete feats and it will look like this:

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

#### Without alias

If you don't alias `git` to `git-feats` you can still use `git-feats` in place of `git`:

```
$ git-feats status
```

#### git-feats commands

git-feats also has commands that git-feats specific and don't mess with git.


```
$ git feats

usage: git feats <command>

commands:
  update  Update your feats and command history on gitfeats.com
  help    Display git-feats specific help
```

## Alias

Add the following to your `.bash_profile` or other startup script:

```
alias git=git-feats
```

## .com

`git-feats` has a sweet web frontend at [gitfeats.com](http://gitfeats.com).

Linking your account is as easy as:

```
git config --global github.user <your github username>
```

```
git config --global feats.key <your api key>
```

## Contributors

* [Chris Knadler](https://github.com/cknadler)
* [Jennifer Coryell](https://github.com/dasmoose)
* [Ian Eckert](https://github.com/ieckert)
* [Mike Wood](https://github.com/mykewould)

git-feats was inspired by [git-achievements](https://github.com/icefox/git-achievements).


## Contributing

`git-feats` has a dead simple interface for making feats. 

Simply add a feat to the [feats file][feats-file] and it will work in the gem.

If you are looking to contribute, that is a great place to start.

Also, git-feats needs the following:

* Tests (probably RSpec)
* Code Cleanup

Any suggestions are also welcomed with open arms. Please fork, send pull requests and make issues.

#### How to contribute

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Copyright

Copyright (c) 2012 Chris Knadler, Jennifer Coryell and Ian Eckert. 

See LICENSE for details.

[feats-file]: https://github.com/cknadler/git-feats/blob/master/lib/git-feats/feats/feats.yml
