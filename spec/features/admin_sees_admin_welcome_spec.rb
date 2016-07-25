require 'rails_helper'

feature "Admin sees the admin welcome page" do
  scenario "An admin logs in and sees different page than default user" do
    admin = User.create(username: "Angela", password: "password", role: 1)
    expect(admin.role).to eq("admin")

    visit login_path
    fill_in "Username", with: "Angela"
    fill_in 'sessions[password]', with: "password"
    within 'form' do
      click_on "Login"
    end

    assert_equal admin_welcome_index_path, current_path
    within("#greeting") do
      assert page.has_content?("Welcome, Admin #{admin.username}!")
    end
  end
end
