# frozen_string_literal: true

class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :following, class_name: 'User'
  validates :follower_id, uniqueness: { scope: :following_id,
                                        message: Relationship.human_attribute_name('error_message') }
  validates :following_id, uniqueness: { scope: :follower_id,
                                         message: Relationship.human_attribute_name('error_message') }
end
