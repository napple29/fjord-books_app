# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :followings, class_name: "Relationship",
            foreign_key: "follower_id",
            dependent: :destroy
  has_many :followers, class_name: "Relationship",
            foreign_key: "following_id",
            dependent: :destroy
  has_many :following, through: :followings, source: :following
  has_many :followers, through: :followers, source: :follower

  def follow(other_user)
    followings.create(following_id: other_user.id)
  end

  def unfollow(other_user)
    followings.find_by(following_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

end
