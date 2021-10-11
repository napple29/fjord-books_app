class Report < ApplicationRecord
  belongs_to :user, foreign_key:'user_id'
  has_many :comments, as: :commentable
end
