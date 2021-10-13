# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  def self.comment_user_name(comment)
    if comment.user.nil?
      '退会したユーザ'
    elsif comment.user.name.blank?
      comment.user.email
    else
      comment.user.name
    end
  end
end
