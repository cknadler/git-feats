module GitFeats

  module Commands

    extend self

    def parse(args)

      case args.command

      when 'add'
        unlock_feat :bricks_and_mortar

      when 'am'
        unlock_feat :delivery

      when 'bisect'
        unlock_feat :bug_hunter

      when 'blame'
        unlock_feat :blame_game

      when 'bundle'
        unlock_feat :cold_transfer
          "Bundled git objects and refs with git bundle"

      when 'cherry-pick'
        unlock_feat :fine_grain

      when 'checkout'
        unlock_feat :shopping_spree
        if args[2] == '-b'
          unlock_feat :impulse_buy
        end

      when 'clean'
        unlock_feat :clean

      when 'clone'
        unlock_feat :replicator

      when 'commit'
        unlock_feat :author

      when 'commit-tree' || 'hash-object' || 'update-index' || 'update-ref'
        unlock_feat :hardcore

      when 'config'
        unlock_feat :tinkerer

      when 'diff'
        unlock_feat :foreshadowing

      when 'fetch'
        unlock_feat :fetch

      when 'filter-branch'
        unlock_feat :hedge_trimming

      when 'format-patch'
        unlock_feat :mail_clerk

      when 'gc'
        unlock_feat :housekeeping

      when 'grep'
        unlock_feat :private_investigator

      when 'imap-send'
        unlock_feat :mailman

      when 'init'
        unlock_feat :empty_lot

      when 'instaweb'
        unlock_feat :pixels_everywhere

      when 'log'
        unlock_feat :historian

      when 'merge'
        unlock_feat :unification

      when 'mv'
        unlock_feat :moving_day

      when 'pull'
        unlock_feat :assimilation

      when 'push'
        unlock_feat :social_butterfly

      when 'rebase'
        unlock_feat :slice_and_dice

      when 'reflog'
        unlock_feat :seamstress

      when 'remote'
        if args[2] == 'add'
          unlock_feat :connected
        end

      when 'reset'
        unlock_feat :second_guess

      when 'rm'
        unlock_feat :fireball

      when 'shell'
        unlock_feat :annex

      when 'show'
        unlock_feat :showoff

      when 'show-branch'
        unlock_feat :forest_cartography

      when 'stash'
        unlock_feat :hoarder

      when 'status'
        unlock_feat :status_report

      when 'submodule'
        if args[2] == 'add' 
          unlock_feat :sublet
        elsif args[2] == 'update'
          unlock_feat :renovations
        end

      when 'svn'
        unlock_feat :dinosaur

      when 'tag'
        unlock_feat :label_wizard

      when 'whatchanged'
        unlock_feat :historian

      end
    end

    private

    def unlock_feat(feat)
      @manifest = Manifest.instance

      unless @manifest.completed_feat?(feat)
        @manifest.add_completed_feat(feat)
        Reporter.report_feat_completed(feat)
      end
    end
  end
end
