module GitFeats

  class Args < Array
    
    def initialize(*args)
      super
      @executable = ENV["GIT"] || "git"
    end

    def to_exec(args = self)
      Array(@executable) + args
    end
  end
end
