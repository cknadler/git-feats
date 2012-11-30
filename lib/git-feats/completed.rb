require 'singleton'
require 'json'

module GitFeats
  class Completed
    include Singleton

    DIR = Dir.home + '/.git_feats'
    PATH = DIR + '/completed'

    def initialize
      @completed = unserialize || []
    end

    # Add a feat to the list of completed feats
    def add(feat)
      @completed << feat 
      serialize
    end

    # Check for the existance of a feat in completed feats
    #
    # Returns true if feat is completed, false otherwise
    def exists?(feat)
      @completed.include?(feat.to_s)
    end

    private

    # Unserialize data from completed feats file
    def unserialize
      if File.exists?(PATH) && !File.zero?(PATH)
        begin
          return JSON.parse(IO.binread(PATH))
        rescue JSON::ParserError => e
          puts e
        end
      end
    end

    # Serialize data to completed feats file
    def serialize
      # Make a path to the data file if one doesn't already exist
      FileUtils.mkpath(DIR) unless File.directory?(DIR)

      File.open(PATH, "w") do |f|
        f.puts @completed.to_json
      end
    end
  end
end
