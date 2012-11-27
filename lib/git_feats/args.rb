module GitFeats

  class Args < Array
    
    def initialize(*args)
      super
      @executable = ENV["GIT"] || "git"
    end

    # returns an array of the arguments appended with git executable
    def to_exec(args = self)
      Array(@executable) + args
    end

    # returns the command (first argument) of the arguments
    def command
      self[0]
    end
  end
end
