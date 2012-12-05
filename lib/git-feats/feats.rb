require 'yaml'

module GitFeats
  module Feats

    extend self

    PATH = File.dirname(__FILE__) + '/feats/feats.yml'
    
    def all
      @feats ||= YAML.load_file(PATH)
    end
  end
end
