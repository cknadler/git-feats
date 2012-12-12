require 'faraday'
require 'json'

module GitFeats
  module API

    extend self

    URL = 'http://www.gitfeats.com'

    def upload_feats
      # Post json to git-feats
      begin
        puts "Updating feats on gitfeats.com..."
        # Attempt to update feats
        conn.post do |req|
          req.url '/api/post_feats'
          req.headers['Content-Type'] = 'application/json'
          req.body = upload_feats_body.to_json
        end
        puts "Successfully updated!\n\n"
      rescue
        puts "Connection failed...\n\n"
      end
    end

    private

    # Return the faraday connection or create one
    def conn
      @conn ||= new_connection
    end

    def new_connection
      # Create git-feats connection
      Faraday.new(:url => URL) do |faraday|
        faraday.request  :url_encoded
        faraday.adapter  Faraday.default_adapter
      end
    end

    # Construct the body for the upload feats post
    def upload_feats_body
      {
        :username  => Config.name,
        :key       => Config.key,
        :history   => History.data
      }
    end
  end
end
