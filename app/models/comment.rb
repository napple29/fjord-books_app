# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :commentable, polymorphic: true
end
