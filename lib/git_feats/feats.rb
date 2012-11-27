require 'yaml'

module GitFeats
  
  module Feats

    extend self

    FEATS_PATH = 'feats.yml'

    def feat(symbol)
      feats[symbol.to_s] 
    end

    private

    def feats
      @feats ||= YAML.load_file(FEATS_PATH)
    end

  end
end
