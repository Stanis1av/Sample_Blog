module ArticlesHelper
    def article_tag_list
    @article.tags.collect do |tag|
    tag.name
  end.join(", ")
  end
end
