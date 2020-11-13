class Article < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true

  has_many :comments # связываем две сущности между собой
end
