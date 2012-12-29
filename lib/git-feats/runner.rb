module GitFeats
  class Runner

    # Creates a new Runner
    #
    # args - The args to be run with git
    def initialize(*args)
      @args = Args.new(args)
      # parse args for feats
      Checker.check(@args)
    end

    # Run shortcut
    def self.run(*args)
      new(*args).run
    end

    # Run the args as one of the following:
    # - Pure git-feats command
    # - Overridden git command
    # - Pure git command
    def run
      # Pure git-feats command
      case @args[0]
      when "feats"
        run_feats_cmd

      # Overriden git command
      when "version" || "--version"
        version

      # Pure git command
      else
        exec_args
      end
    end

    private

    # Run git-feats specific update command
    def feats_update
      API.upload_feats if Config.exists?
    end

    # Run git-feats specific help command
    def feats_help
      puts <<help
usage: git feats <command>

commands:
  update  Update your feats and command history on gitfeats.com
  help    Display git-feats specific help
help
    end

    # Override `git version` to output the git-feats version
    def version
      puts "git-feats version #{GitFeats::VERSION}" 
      exec_args
    end

    # Run a git-feats specific command
    #
    # Precondition: The first argument is 'feats'
    # ex: 'git feats update'
    def run_feats_cmd
      @args[1] == "update" ? feats_update : feats_help
    end

    # Exec the args as a git command
    def exec_args
      exec(*@args.to_exec)
    end
  end
end
