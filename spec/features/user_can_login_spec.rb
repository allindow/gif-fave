require 'rails_helper'

feature "User can login" do
  scenario "A user can be created" do
    visit new_user_path

    fill_in "Username", with: "Angela"
    fill_in "Password", with: "password"
    within 'form' do
      click_on "Create Account"
    end
    assert page.has_content?("Welcome, Angela!")
  end

  scenario "A user can login with valid credentials" do
    user = User.create(username: "Angela", password: "password")
    visit login_path
    fill_in "Username", with: "Angela"
    fill_in 'sessions[password]', with: "password"
    within 'form' do
      click_on "Login"
    end

    assert_equal user_path(user), current_path

    within("#greeting") do
      assert page.has_content?("Welcome, Angela!")
    end
  end

  scenario "A user gets error with invalid credentials" do
    user = User.create(username: "Angela", password: "password")

    visit login_path
    fill_in "Username", with: "Angela"
    fill_in "Password", with: "awesome"
    within 'form' do
      click_on "Login"
    end

    assert page.has_content?("Invalid username or password")
  end

end
