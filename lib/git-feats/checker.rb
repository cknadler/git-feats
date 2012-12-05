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
        if args.match?(pattern)
          History.add(pattern)

          feats.each do |feat, value|
            if History.count(pattern) >= value[:count]
              unless Completed.exists?(feat)
                Completed.add(feat) 
                Reporter.report(value)
              end
            end
          end
        end
      end

      # Write out history and completed feats
      Completed.serialize
      History.serialize
    end
  end
end
