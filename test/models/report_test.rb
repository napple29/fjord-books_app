# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    current_user = users(:Alice)
    report1 = current_user.reports.new
    assert report1.editable?(users(:Alice))

    current_user = users(:Bob)
    report2 = current_user.reports.new
    assert_not report2.editable?(users(:Alice))
  end

  test '#created_on' do
    report1 = users(:Alice).reports.new(created_at: '2021-10-14 02:10:11.678236 UTC')
    assert_equal report1.created_on.to_s, '2021-10-14'
  end
end
