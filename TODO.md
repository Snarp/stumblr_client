# TODO

## Todo


- [`/blog/posts` create-or-reblog action](https://github.com/tumblr/docs/blob/master/api.md#posts---createreblog-a-post-neue-post-format) - `Tumblr::Post` module needs to be overhauled to support NPF format.

    - [Determine whether `/blog/posts` POST errors in creating new NPF posts relate to Faraday client handling of content types](https://github.com/tumblr/docs/blob/master/api.md#request-content-types)

    - Update file upload code to replace now-deprecated [`Faraday::UploadIO`](https://github.com/lostisland/faraday/discussions/1358)

- [Determine what OAuth2 changes are necessary](https://github.com/tumblr/docs/blob/master/api.md#oauth2-authorization)

- Maybe: Add YARDoc comments?

- Probably need to integrate more-precise means of setting request `Content-Type` headers in `Tumblr::Request` to accomodate [this stuff](https://github.com/tumblr/docs/blob/master/api.md#userfiltered_content---content-filtering):

        POST https://api.tumblr.com/v2/user/filtered_content
        Content-Type: application/x-www-form-urlencoded
        filtered_content=something

        POST https://api.tumblr.com/v2/user/filtered_content
        Content-Type: application/json
        { "filtered_content": [ "something", "technology" ] }


## Done

- <del>Allow use of the `:npf` argument in all routes that fetch arrays of posts: `drafts`, `blog_likes`, `queue`, `submissions`, `tagged`, `likes`.</del>

- <del>Either finish changing all instances of `options={}` to `**options` to respect Ruby 3 changes or rewind last set of changes</del>
    
    Temporarily rewinded some splats to avoid breaking options hashes which include keys formatted like this:

    `options["data[#{idx}]"] = Faraday::UploadIO.new(filepath, mime_type)`

    ...until NPF-compatibility overhaul of `Tumblr::Post` methods.