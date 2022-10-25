# TODO

## Minor Todo:

- Either finish changing all instances of `options={}` to `**options` to respect Ruby 3 changes or rewind last set of changes

- <del>[`/user/filtered_content` - DELETE](https://github.com/tumblr/docs/blob/master/api.md#userfiltered_content---content-filtering)</del> - appears to be a Tumblr-side error

- <del>[`/user/filtered_tags`](https://github.com/tumblr/docs/blob/master/api.md#userfiltered_tags---tag-filtering)</del>

- <del>[`/blog/blocks/bulk`](https://github.com/tumblr/docs/blob/master/api.md#blocksbulk--block-a-list-of-blogs)</del>

- <del>[`/blog/posts?tag[0]=something&tag[1]=example`](https://github.com/tumblr/docs/blob/master/api.md#request-parameters-17)</del> - no changes needed

## Major Todo:

- [`/blog/posts` create-or-reblog action](https://github.com/tumblr/docs/blob/master/api.md#posts---createreblog-a-post-neue-post-format)

    - [Determine whether `/blog/posts` POST errors in creating new NPF posts relate to Faraday client handling of content types](https://github.com/tumblr/docs/blob/master/api.md#request-content-types)

- [Determine what OAuth2 changes are necessary](https://github.com/tumblr/docs/blob/master/api.md#oauth2-authorization)

- Maybe: Add YARDoc comments?