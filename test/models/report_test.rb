# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    current_user = users(:alice)
    report1 = current_user.reports.new
    assert report1.editable?(users(:alice))

    current_user = users(:bob)
    report2 = current_user.reports.new
    assert_not report2.editable?(users(:alice))
  end

  test '#created_on' do
    report1 = users(:alice).reports.new(created_at: '2021-10-14 02:10:11.678236 UTC')
    assert_equal report1.created_on.to_s, '2021-10-14'
  end
end
