module GitFeats
  module Completed

    extend self

    PATH = Dir.home + '/.git_feats/completed'

    # load data from file
    def unserialize
      @completed = Serializer.unserialize(PATH) || []
    end

    # write data to file
    def serialize
      Serializer.serialize(PATH, @completed)
    end

    # Add a feat to the list of completed feats
    def add(feat)
      @completed << feat 
    end

    # check of a user has already completed a feat
    def exists?(feat)
      @completed.include?(feat.to_s)
    end
  end
end
