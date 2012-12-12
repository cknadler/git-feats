module GitFeats
  module Config

    extend self

    CONFIG_USER_CMD = "git config --global github.user"
    CONFIG_KEY_CMD = "git config --global feats.key"

    # Returns the config value for username
    def name
      @name ||= `#{CONFIG_USER_CMD}`.chomp
    end

    # Returns the config value for api key
    def key
      @key ||= `#{CONFIG_KEY_CMD}`.chomp
    end

    # Check if config exists and is configured properly
    def exists?
      !name.empty? && !key.empty?
    end
  end
end
