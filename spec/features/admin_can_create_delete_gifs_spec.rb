require 'rails_helper'

describe "Admin can create and delete a gif" do
  scenario "they enter a word and see a gif on gif index" do
    admin = User.create(username: "Angela", password: "password", role: 1)
    visit login_path
    fill_in "Username", with: "Angela"
    fill_in 'sessions[password]', with: "password"
    within 'form' do
      click_on "Login"
    end
    click_on "Manage GIFs"
    assert_equal admin_gifs_path, current_path

    within("#gif_generator") do
      fill_in "Category", with: "unicorn"
      click_on "Generate Gif!"
    end

    assert_equal admin_gifs_path, current_path
    expect(page).to have_content("unicorn")
    expect(page).to have_css("img[src*=\"#{Gif.first.image_path}\"]")
  end

  scenario "default user cannot access gif index" do
    admin = User.create(username: "Angela", password: "password", role: 0)
    visit login_path
    fill_in "Username", with: "Angela"
    fill_in 'sessions[password]', with: "password"
    within 'form' do
      click_on "Login"
    end
    expect(page).to_not have_content("Manage Gifs")
    visit admin_gifs_path
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "admin can delete a gif" do
    admin = User.create(username: "Angela", password: "password", role: 1)
    visit login_path
    fill_in "Username", with: "Angela"
    fill_in 'sessions[password]', with: "password"
    within 'form' do
      click_on "Login"
    end

    click_on "Manage GIFs"
    assert_equal admin_gifs_path, current_path

    within("#gif_generator") do
      fill_in "Category", with: "unicorn"
      click_on "Generate Gif!"
    end

    within("#all_gifs") do
      click_on "Delete"
    end
    assert_equal admin_gifs_path, current_path
    expect(page).to have_content("unicorn gif was deleted")
  end
end
