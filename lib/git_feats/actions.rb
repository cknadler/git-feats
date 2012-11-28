require 'fileutils'

module GitFeats 

  module Actions

    def mkpath_to(path)
      unless File.exists? path
        FileUtils.mkpath File.dirname(path)
      end
    end

    def touch(path)
      FileUtils.touch(path)
    end
  end
end
