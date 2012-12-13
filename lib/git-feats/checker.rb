module GitFeats
  module Checker

    extend self

    # Main interface for checking feats
    #
    # @params[GitFeats::Args] Takes in args.
    # @return[GitFeats::History] Prints out history and completed feats, returns the history serialized.
    def check(args)

      # Load history and completed
      Completed.unserialize
      History.unserialize

      # request flag
      upload = false

      # Check for feats and update history
      Feats.all.each do |pattern, feats|
        if args.match?(pattern)
          History.add(pattern)

          feats.each do |feat, value|
            if History.count(pattern) >= value[:count]
              unless Completed.exists?(feat)
                Completed.add(feat) 
                Reporter.report(value)
                upload = true
              end
            end
          end
        end
      end

      # upload feats if the request flag is set
      upload_feats if upload

      # Write out history and completed feats
      Completed.serialize
      History.serialize
    end

    private

    # call upload feats from API if config values exist
    def upload_feats
      API.upload_feats if Config.exists?
    end
  end
end
