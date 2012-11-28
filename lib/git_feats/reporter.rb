module GitFeats

  module Reporter

    extend self

    def report_feat_completed(feat)
      feat = Feats.feat(feat)

      puts "\n" + '*' * 80
      puts "Feat Completed!".center(80)
      puts feat[:name].center(80)
      puts feat[:desc].center(80)
      puts '*' * 80 + "\n\n"
    end
  end
end
