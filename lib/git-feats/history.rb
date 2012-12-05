module GitFeats
  module History

    extend self

    PATH = Dir.home + '/.git_feats/history'

    # load data from file
    def unserialize
      @history = Serializer.unserialize(PATH) || {}
    end

    # write data to file
    def serialize
      Serializer.serialize(PATH, @history)
    end

    def add(pattern)
      if @history[pattern]
        @history[pattern] += 1
      else
        @history[pattern] = 1
      end
    end

    def count(pattern)
      @history[pattern]
    end
  end
end
