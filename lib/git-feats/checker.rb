module GitFeats
  module Checker

    extend self

    # Main interface for checking feats
    def check(args)
      load_achievements
      return if (feat_vals = get_matched_feat_vals(args)).nil?
      History.add(feat_vals[:name])
      report_and_upload(feat_vals) if reportable?(feat_vals)
      write_achievements
    end

    private

    def report_and_upload(feat_vals)
      Completed.add(feat_vals[:name_sym]) 
      Reporter.report(feat_vals)
      API.upload_feats if Config.exists?
    end

    def reportable?(feat_vals)
      History.count(feat_vals[:name]) >= feat_vals[:count] && 
      !(Completed.exists?(feat_vals[:name_sym]))
    end

    # Load history and completed
    def load_achievements
      Completed.unserialize
      History.unserialize
    end

    # Write out history and completed feats
    def write_achievements
      Completed.serialize
      History.serialize
    end

    def get_matched_feat_vals(args)
      feat = Feats.all.detect { |pattern, feats| args.match?(pattern) }
      return if feat.nil?
      { name:     feat.first, 
        name_sym: feat.last.keys.first,
        desc:     feat[1].first.last[:desc],
        count:    feat[1].first.last[:count] }
    end
  end
end