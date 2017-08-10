require 'rails_helper'
sleep_seconds = 0.5

feature 'Evaluation', js: true do
  scenario 'click name redirect to evaluation page' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit batch_path(1)
    sleep sleep_seconds
    click_on "Fan Ta"
    sleep sleep_seconds
    expect(page.current_path).to eq batch_student_path(1,3)
  end

  scenario 'click picture redirect to evaluation page' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit batch_path(1)
    sleep sleep_seconds
    find("img[src='http://oolongteauk.co.uk/images/logo.png']").click
    sleep sleep_seconds
    expect(page.current_path).to eq batch_student_path(1,6)
  end

  scenario 'Evaluation form default date is today' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit batch_student_path(2,7)
    sleep sleep_seconds
    # This is to select the color.
    expect(page.find_by_id('evaluation_time').value).to eq Date.today.to_s
  end

  scenario 'add a new evaluation, redirected to batch show page' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit batch_student_path(2,7)
    sleep sleep_seconds
    # This is to select the color.
    page.find_by_id('evaluation_color').find("option[value='GREEN']").select_option
    click_on 'Save'
    sleep sleep_seconds
    expect(page.current_path).to eq batch_path(2)
    sleep sleep_seconds
  end

end