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
      @history[pattern] = (@history[pattern] ? @history[pattern] + 1 : 1)
    end

    def count(pattern)
      @history[pattern]
    end

    def data
      @history
    end
  end
end
