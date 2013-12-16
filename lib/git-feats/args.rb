module GitFeats
  class Args < Array

    # Makes a new Args object
    def initialize(*args)
      super
      @executable = if `which hub` != ""
        "hub"
      else
        ENV["GIT"] || "git"
      end
    end

    # Returns an executable command 
    # that can be called with exec
    #
    # args - The args of the command
    #
    # Returns an array of args prepended with an executable
    def to_exec(args = self)
      Array(@executable) + args
    end

    # Checks if a pattern (string of args)
    # matches the first arguments in an Args object
    #
    # Examples: 
    #
    # Args('init').match?('init')                    #=> true
    # Args('add', '.').match?('add .')               #=> true
    # Args('commit', '-a', '-m').match?('commit -a') #=> true
    #
    # Args('commit').match?('init')                  #=> false
    # Args('commit').match?('commit -a')             #=> false
    #
    # Returns a boolean
    def match?(pattern)
      pattern.split.each_with_index do |arg, index|
        return false unless arg == self[index]
      end
      return true
    end
  end
end
