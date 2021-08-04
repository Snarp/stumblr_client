require_relative 'tumblr/blog'
require_relative 'tumblr/user'
require_relative 'tumblr/request'
require_relative 'tumblr/connection'
require_relative 'tumblr/post'
require_relative 'tumblr/tagged'
require_relative 'tumblr/helpers'

require_relative 'tumblr/config'
require_relative 'tumblr/client'

module Tumblr

  autoload :VERSION, File.join(File.dirname(__FILE__), 'tumblr/version')

  extend Config

  class << self
    def new(options={})
      Tumblr::Client.new(options)
    end
  end

end
