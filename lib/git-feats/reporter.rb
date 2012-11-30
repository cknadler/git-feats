module GitFeats
  module Reporter

    extend self

    def feat_completed(feat)
      completed = Feats.feat(feat)
      puts "\n" + '*' * 80
      puts "Feat Completed!".center(80)
      puts completed[:name].center(80)
      puts completed[:desc].center(80)
      puts '*' * 80 + "\n\n"
    end
  end
end
