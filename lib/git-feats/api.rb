require 'faraday'
require 'json'

module GitFeats
  module API

    extend self

    URL = 'http://localhost:3000'

    def upload_feats
      # Post json to git-feats
      conn.post do |req|
        req.url '/api/post_feats'
        req.headers['Content-Type'] = 'application/json'
        req.body = upload_feats_body.to_json
      end
    end

    private

    # Return the faraday connection or load a new one
    def conn
      @conn ||= new_connection
    end

    def new_connection
      # Create git-feats connection
      connection = Faraday.new(:url => URL) do |faraday|
        faraday.request  :url_encoded
        faraday.adapter  Faraday.default_adapter
      end
      connection
    end

    # Construct the body for the upload feats post
    def upload_feats_body
      {
        :username  => Config.username,
        :key       => Config.api_key,
        :history   => History.data,
        :completed => Completed.data
      }
    end
  end
end
