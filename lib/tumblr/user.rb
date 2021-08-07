module Tumblr
  module User

    def info
      get('v2/user/info')
    end

    def dashboard(options = {})
      valid_opts=[:limit, :offset, :type, :since_id, :reblog_info, :notes_info]
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

    def filtered_content
      get('v2/user/filtered_content')
    end
    alias_method :get_filtered_content, :filtered_content

    # REVIEW: As of 2021-08-04, this API route appears to be broken; 
    #         always returns `{:status=>400, :msg=>"Bad Request"}`
    # @param [String] filtered_strings
    # @param [Hash] options
    def delete_filtered_content(filtered_strings=nil, **options)
      validate_options([:filtered_content], options)
      options[:filtered_content] ||= filtered_strings
      delete('v2/user/filtered_content', options)
    end

    # FIXME: When an array of multiple strings is included, this method 
    #        always returns `{:status=>401, :msg=>"Unauthorized"}`.
    #        The rewritten method below follows the API doc formatting more
    #        closely, but also returns an error. Change Faraday POST body
    #        type?
    # 
    # @param [String] filtered_strings
    # @param [Hash] options
    def add_filtered_content(filtered_strings=nil, **options)
      validate_options([:filtered_content], options)
      options[:filtered_content] ||= filtered_strings
      post('v2/user/filtered_content', options)
    end

    # EXAMPLE REQUEST BODIES:
    # 
    #     `filtered_content=something`
    #     `filtered_content[0]=something&filtered_content[1]=technology`
    # 
    # SOURCE: <https://www.tumblr.com/docs/en/api/v2#userfiltered_content---content-filtering>
    # 
    # def add_filtered_content(filtered_content=nil, **options)
    #   validate_options([:filtered_content], options)
    #   filtered_content = [
    #     filtered_content || options[:filtered_content]
    #   ].flatten.map { |str| str.strip.downcase }.uniq

    #   if    filtered_content.count==1
    #     options = "filtered_content=#{filtered_content[0]}"
    #   elsif filtered_content.count >1
    #     options = []
    #     filtered_content.each_with_index do |str,i|
    #       options.push("filtered_content[#{i}]=#{str.strip}")
    #     end
    #     options = options.join('&')
    #   end
    #   # puts "#{{ path: 'v2/user/filtered_content', body: options }}"
    #   post('v2/user/filtered_content', options)
    # end

  end
end
