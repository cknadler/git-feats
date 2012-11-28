require 'singleton'
require 'JSON'

module GitFeats
  class Manifest

    include Singleton
    include GitFeats::Actions

    MANIFEST_PATH = ENV['HOME'] + '/.git_feats/data.json'

    attr_reader :manifest
    attr_reader :completed_feats

    def initialize
      @manifest = read_manifest_file || {}
      @completed_feats = @manifest['completed_feats'] || []
    end

    def add_completed_feat(feat)
      @completed_feats << feat 
      write_manifest_file
    end

    def completed_feat?(feat)
      @completed_feats.include?(feat)
    end

    private

    def read_manifest_file
      if File.exists?(MANIFEST_PATH) && File.size?(MANIFEST_PATH)
        begin
          puts JSON.parse(MANIFEST_PATH)
        rescue JSON::ParserError => e
          puts e
        end
      end
    end

    def write_manifest_file
      make_manifest
      @manifest['completed_feats'] = @completed_feats
      puts @manifest
      file = File.open(MANIFEST_PATH, 'w')
      file.puts JSON.generate(@manifest)
    end

    def make_manifest
      mkpath_to MANIFEST_PATH
      touch MANIFEST_PATH
    end
  end
end
