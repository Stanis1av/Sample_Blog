class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  has_many :comments # связываем две сущности между собой
  belongs_to :user

  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end

  # def tag_list
  #   self.tags.collect do |tag|
  #     tag.name
  #   end.join(", ")
  # end
end
