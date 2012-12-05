module GitFeats
  module Config

    extend self

    CONFIG_CMD = "git config --global feats.key"

    # Returns the config value for username
    def username
      @username ||= config_value.split('-')[0]
    end

    # Returns the config value for api key
    def api_key
      @api_key ||= config_value.split('-')[1]
    end

    # Check if config exists and is configured properly
    def exists?
      username && api_key
    end

    private

    # loads the config value from the global git config file
    def config_value
      @config_value ||= `#{CONFIG_CMD}`
    end
  end
end
