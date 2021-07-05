class Post < ApplicationRecord
  # связываем сущности между собой
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :taggings
  has_many :tags, through: :taggings
  #
  validates :title, presence: true
  validates :body, presence: true
  #
  default_scope { order(created_at: :desc) }

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
end
