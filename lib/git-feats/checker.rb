module GitFeats
  module Checker

    extend self

    # Main interface for checking feats
    def check(args)

      # Load history and completed
      Completed.unserialize
      History.unserialize

      # Check for feats and update history
      Feats.all.each do |pattern, feats|
        next unless args.match?(pattern)
        History.add(pattern)
        
        feats.each do |feat, value|
          next unless complete_and_report?(feat, value, pattern)
          Completed.add(feat) 
          Reporter.report(value)
          upload_feats if feat == feats.keys.last
        end
      end

      # Write out history and completed feats
      Completed.serialize
      History.serialize
    end

    def complete_and_report?(feat, value, pattern)
      History.count(pattern) >= value[:count] && !Completed.exists?(feat)
    end

    private

    # call upload feats from API if config values exist
    def upload_feats
      API.upload_feats if Config.exists?
    end
  end
end
