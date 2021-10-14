require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:report_1)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'creating the report' do
    visit reports_url
    click_on '日報'
    click_on '新規作成'

    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content
    click_on '登録する'
    assert_text '日報が作成されました'
  end

  test 'editing the report' do
    visit reports_url
  
    click_on '編集'
    fill_in 'タイトル', with: 'lsコマンド4日目'
    fill_in '内容', with: '３列表示難しい'
    click_on '更新する'
    assert_text '日報が更新されました'
  end

  test 'destroying the report' do
    visit reports_url

    page.accept_confirm do
      click_on '削除'
    end
  end
end
