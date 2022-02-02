module Tumblr
  module User

    def info
      get('v2/user/info')
    end

    def dashboard(options = {})
      valid_opts=[:limit,:offset,:type,:since_id,:reblog_info,:notes_info,:npf]
      validate_options(valid_opts, options)
      get('v2/user/dashboard', options)
    end

    def likes(options = {})
      validate_options([:limit, :offset, :before, :after], options)
      get('v2/user/likes', options)
    end

    def following(options = {})
      validate_options([:limit, :offset], options)
      get('v2/user/following', options)
    end

    def follow(url)
      post('v2/user/follow', :url => url)
    end

    def unfollow(url)
      post('v2/user/unfollow', :url => url)
    end

    def like(id, reblog_key)
      post('v2/user/like', :id => id, :reblog_key => reblog_key)
    end

    def unlike(id, reblog_key)
      post('v2/user/unlike', :id => id, :reblog_key => reblog_key)
    end

    # @return [Hash] `{ filtered_content: ['string 1','string 2', ...] }`
    def filtered_content
      get('v2/user/filtered_content')
    end
    alias_method :get_filtered_content, :filtered_content

    # REVIEW: As of 2022-02-02, this API route appears to be broken; it always returns `{:status=>400, :msg=>"Bad Request"}`. This is true regardless of whether the request body uses a 'application/json' (string array) or 'application/x-www-form-urlencoded' (single string) request body.
    # 
    # @param [String, Array<String>] filtered_content
    # @param [Hash]                  options
    # @return [Array, Hash]  `[]` if successful, otherwise error message Hash
    def delete_filtered_content(filtered_content=[], **options)
      validate_options([:filtered_content], options)
      options[:filtered_content] ||= filtered_content
      if options[:filtered_content].is_a?(Array)
        delete('v2/user/filtered_content', as_json: true, **options)
      elsif options[:filtered_content].is_a?(String)
        delete('v2/user/filtered_content', **options)
      else
        raise ArgumentError.new
      end
    end

    # @param [Array<String>]  filtered_strings
    # @param [Hash]           options
    # @return [Array, Hash]   `[]` if successful, otherwise error message Hash
    def add_filtered_content(filtered_strings=[], **options)
      validate_options([:filtered_content], options)
      options[:filtered_content] ||= filtered_strings
      post('v2/user/filtered_content', as_json: true, **options)
    end


    # @return [Hash] `{ filtered_tags: ['tag 1','tag 2',...]}`
    def filtered_tags
      get('v2/user/filtered_tags')
    end
    alias_method :get_filtered_tags, :filtered_tags

    # @param [Array<String>] filtered_tags
    # @param [Hash]          options
    # @return [Array, Hash]  `[]` if successful, otherwise error message Hash
    def add_filtered_tags(filtered_tags=[], **options)
      validate_options([:filtered_tags], options)
      options[:filtered_tags] ||= filtered_tags
      post('v2/user/filtered_tags', as_json: true, **options)
    end

    # @param [String]        tag
    # @return [Array, Hash]  `[]` if successful, otherwise error message Hash
    def delete_filtered_tag(tag)
      delete("v2/user/filtered_tags/#{tag}")
    end

  end
end
