# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    alice = users(:alice)
    alice_report = alice.reports.new
    assert alice_report.editable?(users(:alice))

    bob = users(:bob)
    bob_report = bob.reports.new
    assert_not bob_report.editable?(users(:alice))
  end

  test '#created_on' do
    report = Report.new(created_at: '2021-10-14 02:10:11.678236 UTC')
    assert_equal report.created_on.to_s, '2021-10-14'
  end
end
