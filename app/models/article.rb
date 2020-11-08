class Article < ApplicationRecord
  has_many :comments # связываем две сущности между собой
end
