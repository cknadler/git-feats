module GitFeats
  module Reporter

    extend self

    COLUMNS = 80

    def report(feat)
      puts "\n" + '*' * COLUMNS
      puts "Feat Completed!".center(COLUMNS)
      puts feat[:name].center(COLUMNS)
      puts feat[:desc].center(COLUMNS)
      puts '*' * COLUMNS + "\n\n"
    end
  end
end
