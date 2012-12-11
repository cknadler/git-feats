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

    # Execute git command
    def run
      
      # Check for git-feats commands
      case @args[0]
      when "update-feats"
        update_feats
      when "version" || "--version"
        version
      when "stats"
        stats
      when "feats"
        feats
      else
        exec_args
      end
    end

    private

    def update_feats
      if Config.exists?
        API.upload_feats
      end
    end

    def version
      puts "git-feats version #{GitFeats::VERSION}" 
      exec_args
    end

    def stats
      
    end

    def feats

    end

    def exec_args
      exec(*@args.to_exec)
    end
  end
end
