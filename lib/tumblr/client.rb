module Tumblr
  class Client

    class << self
      def default_api_host
        ENV['TUMBLR_API_HOST'] || 'api.tumblr.com'
      end
    end

    include Tumblr::Request
    include Tumblr::Blog
    include Tumblr::User
    include Tumblr::Post
    include Tumblr::Tagged
    include Tumblr::Helpers
    include Tumblr::Connection


    attr_accessor *Config::VALID_OPTIONS_KEYS

    def initialize(attrs={})
      attrs = Tumblr.options.merge(attrs)
      Config::VALID_OPTIONS_KEYS.each do |key|
        instance_variable_set("@#{key}".to_sym, attrs[key])
      end
    end

    def api_host
      self.class.default_api_host
    end

    def api_scheme
      @api_scheme || 'https'
    end

    def credentials
      {
        :consumer_key => @consumer_key,
        :consumer_secret => @consumer_secret,
        :token => @oauth_token,
        :token_secret => @oauth_token_secret
      }
    end

    def options
      options = {}
      Config::VALID_OPTIONS_KEYS.each{ |pname| options[pname] = send(pname) }
      options
    end

    def version
      Tumblr::VERSION
    end

  end
end
