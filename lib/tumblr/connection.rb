require 'faraday'
require 'faraday_middleware'

module Tumblr
  module Connection

    def connection(options={})
      options = options.clone

      default_options = {
        :headers => {
          :accept => 'application/json',
          :user_agent => "tumblr_client/#{Tumblr::VERSION}"
        },
        :url => "#{api_scheme}://#{api_host}/"
      }

      client = Faraday.default_adapter

      Faraday.new(default_options.merge(options)) do |conn|
        data = { :api_host => api_host, :ignore_extra_keys => true}.merge(credentials)
        unless credentials.empty?
          conn.request :oauth, data
        end
        conn.request :multipart
        conn.request :url_encoded
        conn.response :json, :content_type => /\bjson$/
        conn.adapter client
      end
    end

  end
end
