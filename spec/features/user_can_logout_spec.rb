require 'rails_helper'

feature "User can logout" do
  scenario "User is able to logout" do
    user = User.create(username: "Angela", password: "password")

    visit login_path
    fill_in "Username", with: "Angela"
    fill_in "Password", with: "password"
    within 'form' do
      click_on "Login"
    end

    assert_equal user_path(user), current_path
    click_on "Logout"

    assert_equal root_path, current_path
    refute page.has_content?("Angela")
  end
end
