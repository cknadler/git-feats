require 'yaml'

module GitFeats

  module Feats

    extend self

    FEATS_PATH = 'feats.yml'
    
    def feat(sym)
      feats[sym]
    end

    def feats
      @feats ||= YAML.load_file(FEATS_PATH)
    end
  end
end
