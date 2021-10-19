# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:alice_report)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'creating the report' do
    visit reports_url
    click_on '日報'
    click_on '新規作成'

    fill_in 'タイトル', with: 'lsコマンド3日目'
    fill_in '内容', with: 'ファイルを表示できた！'
    click_on '登録する'
    assert_text '日報が作成されました'

    assert_text 'タイトル'
    assert_text 'lsコマンド3日目'
    assert_text '内容'
    assert_text 'ファイルを表示できた！'
  end

  test 'editing the report' do
    visit reports_url

    click_on '編集'
    fill_in 'タイトル', with: 'lsコマンド4日目'
    fill_in '内容', with: '３列表示難しい'
    click_on '更新する'
    assert_text '日報が更新されました'

    assert_text 'タイトル'
    assert_text 'lsコマンド4日目'
    assert_text '内容'
    assert_text '３列表示難しい'
  end

  test 'destroying the report' do
    visit reports_url
    current_user = users(:alice)
    assert_equal 1, current_user.reports.count
    assert_text 'lsコマンド3日目'
    page.accept_confirm do
      click_on '削除'
    end

    assert_no_text 'lsコマンド3日目'
    assert_equal 0, current_user.reports.count
  end
end
