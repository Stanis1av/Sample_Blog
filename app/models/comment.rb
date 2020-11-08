class Comment < ApplicationRecord
  belongs_to :article # комментарии пренадлежит статье
end
