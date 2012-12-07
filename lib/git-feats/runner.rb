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
      exec(*@args.to_exec)
    end
  end
end
