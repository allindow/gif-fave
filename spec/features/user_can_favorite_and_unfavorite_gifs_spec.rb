require 'rails_helper'

describe "A default user can favorite and unfavorite gifs" do
  scenario "They can see a favorited gif on their favorites page" do
    Gif.create(image_path: "https://media.giphy.com/media/3o6UBo8U2iHUG5mszS/giphy.gif", category: "puppy")
    user = User.create(username: "Angela", password: "password", role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_gifs_path
    expect(page).to have_css("img[src*=\"#{Gif.first.image_path}\"]")
    click_on "Favorite"

    visit user_favorites_path
    expect(page).to have_css("img[src*=\"#{Gif.first.image_path}\"]")
  end

  scenario "They can unfavorite a gif" do
    user = User.create(username: "Angela", password: "password", role: 0)
    user.gifs.create(image_path: "https://media.giphy.com/media/3o6UBo8U2iHUG5mszS/giphy.gif", category: "puppy")
    visit login_path
    fill_in "Username", with: "Angela"
    fill_in 'sessions[password]', with: "password"
    within 'form' do
      click_on "Login"
    end

    visit user_favorites_path
    expect(page).to have_css("img[src*=\"#{Gif.first.image_path}\"]")
    click_on "Unfavorite"

    visit user_favorites_path
    expect(page).to_not have_css("img[src*=\"#{Gif.first.image_path}\"]")
    expect(page).to have_content("You haven't favorited any Gifs!")
  end
end
