module PostsHelper
    def post_tag_list
        @post.tags.collect do |tag|
            tag.name
        end.join(", ")
    end

    def post_excerpt(post)
        sanitize(truncate(post.body, length: 150)) if post && post.body.present?
    end
end
