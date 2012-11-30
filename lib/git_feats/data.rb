require 'singleton'
require 'JSON'

module GitFeats
  class Data

    include Singleton
    include GitFeats::Actions

    PATH = Dir.home + '/.git_feats/feats'

    attr_reader :completed_feats

    def initialize
      @completed_feats = read_data_file || []
    end

    def add_completed_feat(feat)
      @completed_feats << feat 
      write_data_file
    end

    def completed_feat?(feat)
      @completed_feats.include?(feat.to_s)
    end

    private

    def read_data_file
      if File.exists?(PATH) && File.size?(PATH)
        begin
          return JSON.parse(IO.binread(PATH))
        rescue JSON::ParserError => e
          puts e
        end
      end
    end

    def write_data_file
      # Make a path to the data file if one doesn't already exist
      mkpath_to PATH
      
      data_file = File.open(PATH, "w")
      data_file.puts JSON.fast_generate(@completed_feats)
    end
  end
end
