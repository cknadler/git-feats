require 'faraday'
require 'json'

module GitFeats
  module API

    extend self

    URL = 'http://localhost:3000'

    def upload_feats(background=true)
      # make the request normally
      return puts post_feats unless background
      # spawn the request as a background process
      request = fork do
        begin
          post_feats
        rescue
        end
      end
      Process.detach(request)
    end

    private

    def post_feats
      conn.post do |req|
        req.url '/api/feats'
        req.headers['Content-Type'] = 'application/json'
        req.body = upload_feats_body.to_json
      end
    end

    # Return the faraday connection or create one
    def conn
      @conn ||= new_connection
    end

    def new_connection
      # Create git-feats connection
      Faraday.new(:url => URL) { |faraday| faraday.request  :url_encoded } 
    end

    # Construct the body for the upload feats post
    def upload_feats_body
      {
        username: Config.name,
        key:      Config.key,
        history:  History.data
      }
    end
  end
end
