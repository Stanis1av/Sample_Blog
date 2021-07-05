module PostsHelper
    def article_tag_list
        @article.tags.collect do |tag|
            tag.name
        end.join(", ")
    end

    def post_excerpt(post)
        sanitize(truncate(post.body, length: 50)) if post && post.body.present?
    end
end
