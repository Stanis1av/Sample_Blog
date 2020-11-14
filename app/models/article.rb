class Article < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true

  has_many :comments # связываем две сущности между собой
  belongs_to :user

  def subject
    title
  end

  def last_comment
    comments.last
  end
end
