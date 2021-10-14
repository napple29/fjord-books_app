# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase

  test '#editable?' do
    current_user = users(:Alice)
    report_1 = current_user.reports.new
    assert report_1.editable?(users(:Alice))

    current_user = users(:Bob)
    report_2 = current_user.reports.new
    assert_not report_2.editable?(users(:Alice))
  end

  test '#created_on' do
    report_1 = users(:Alice).reports.new(created_at: '2021-10-14 02:10:11.678236 UTC')
    assert_equal "#{report_1.created_on}", '2021-10-14'
  end
end
