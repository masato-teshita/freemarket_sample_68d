class Comment < ApplicationRecord
  belongs_to :user
  # belongs_to :post
  belongs_to :item
  belongs_to :user
end
