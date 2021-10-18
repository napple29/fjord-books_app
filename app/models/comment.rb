# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  def name_or_email(comment)
    if comment.user.name.blank?
      comment.user.email
    else
      comment.user.name
    end
  end
end
