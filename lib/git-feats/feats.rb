require 'yaml'

module GitFeats
  module Feats

    extend self

    FEATS_PATH = File.dirname(__FILE__) + '/feats/feats.yml'
    
    def feat(sym)
      feats[sym]
    end

    def feats
      @feats ||= YAML.load_file(FEATS_PATH)
    end
  end
end
