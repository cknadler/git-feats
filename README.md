# git-feats [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/cknadler/git-feats) [![Dependency Status](https://gemnasium.com/cknadler/git-feats.png)](https://gemnasium.com/cknadler/git-feats) 

Complete git feats from the command line!

## Installation

Currently still in development and not on rubygems. Eventually: 

    $ gem install git-feats

## Usage

`git-feats` works best when aliased as `git`.

## Contributing

#### `git-feats` needs:

* Tests (probably RSpec)
* More feats
  * Add a feat in `lib/feats/feats.yml`
  * Add a rule for the feat in `lib/runner.rb` under `def parse_feats`
  * Test it

Any suggestions are also welcomed with open arms.

#### How to contribute

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
