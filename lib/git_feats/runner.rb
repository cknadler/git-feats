module GitFeats

  class Runner

    attr_reader :args
    
    # initialize a new runner
    def initialize(*args)
      @args = Args.new(args)
      Commands.parse(@args)
    end

    # execute shortcut
    def self.execute(*args)
      new(*args).execute
    end

    # execute arguments as git command
    def execute
      exec(*args.to_exec)
    end
  end
end
    
