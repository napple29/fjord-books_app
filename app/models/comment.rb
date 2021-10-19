# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  def name_or_email(comment)
    comment.user.name.presence || comment.user.email
  end
end
