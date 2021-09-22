# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :followers, class_name: "Relationship",
            foreign_key: "follower_id",
            dependent: :destroy
  has_many :followings, class_name: "Relationship",
            foreign_key: "following_id",
            dependent: :destroy
  has_many :following_users, through: :relationships, source: :following
  has_many :follower_users, through: :relationships, source: :follower

  def follow(other_user)
    followers.create(following_id: other_user)
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(followes_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    followings.include?(other_user)
  end

end
