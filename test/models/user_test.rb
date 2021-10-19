# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#following?' do
    users(:alice).follow(users(:bob))
    assert users(:alice).following?(users(:bob))
  end

  test '#followed_by?' do
    users(:alice).follow(users(:bob))
    assert users(:bob).followed_by?(users(:alice))
  end

  test '#follow' do
    assert_not users(:alice).following?(users(:bob))
    users(:alice).follow(users(:bob))
    assert users(:alice).following?(users(:bob))
  end

  test '#unfollow' do
    users(:alice).follow(users(:bob))
    users(:alice).unfollow(users(:bob))
    assert_not users(:alice).following?(users(:bob))
  end

  test '#name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'Foo Bar'
    assert_equal 'Foo Bar', user.name_or_email
  end
end
