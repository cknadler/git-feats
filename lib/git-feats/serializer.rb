require 'json'
require 'fileutils'

module GitFeats
  module Serializer
    
    extend self

    # serialize a ruby object to a file in json
    #
    # path - file path
    # data - data to be serialized
    #
    # Returns nothing
    def serialize(path, data)
      # Make a path to the data file if one doesn't already exist
      mkpath_to path

      File.open(path, "w") do |f|
        f.puts data.to_json
      end
    end

    # unserialize a json file to a ruby object
    #
    # path - file path
    #
    # Returns a ruby object or nil
    def unserialize(path)
      if File.exists?(path) && !File.zero?(path)
        begin
          return JSON.parse(IO.binread(path))
        rescue JSON::ParserError => e
          puts e
        end
      end 
    end

    private

    def mkpath_to(path)
      unless File.exists? path
        FileUtils.mkpath File.dirname(path)      
      end
    end
  end
end
