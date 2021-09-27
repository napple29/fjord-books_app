# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :user_followings, class_name: 'Relationship',
                             foreign_key: 'follower_id',
                             inverse_of: 'follower',
                             dependent: :destroy
  has_many :user_followers, class_name: 'Relationship',
                            foreign_key: 'following_id',
                            inverse_of: 'following',
                            dependent: :destroy
  has_many :following, through: :user_followings, source: :following
  has_many :followers, through: :user_followers, source: :follower

  def follow(other_user)
    user_followings.create(following_id: other_user.id)
  end

  def unfollow(other_user)
    user_followings.find_by(following_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
