# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test '#following?' do
    users(:Alice).follow(users(:Bob))
    assert users(:Alice).following?(users(:Bob))
  end

  test '#followed_by?' do
    users(:Alice).follow(users(:Bob))
    assert users(:Bob).followed_by?(users(:Alice))
  end

  test '#follow' do
    assert_not users(:Alice).following?(users(:Bob))
    users(:Alice).follow(users(:Bob))
    assert users(:Alice).following?(users(:Bob))
  end

  test '#unfollow' do
    users(:Alice).follow(users(:Bob))
    users(:Alice).unfollow(users(:Bob))
    assert_not users(:Alice).following?(users(:Bob))
  end

  test "#name_or_email" do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'Foo Bar'
    assert_equal 'Foo Bar', user.name_or_email
  end
end
