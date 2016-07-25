require 'rails_helper'

describe "User can view gifs by category" do
  scenario "they can view all gifs by category" do
    user = User.create(username: "Angela", password: "password", role: 0)
    gif1 = Gif.create(image_path: "https://media.giphy.com/media/3o6UBo8U2iHUG5mszS/giphy.gif", category: "puppy")
    gif2 = Gif.create(image_path: "http://media3.giphy.com/media/5xtDarEXlXBmnOuTh0k/200_d.gif", category: "puppy")
    gif3 = Gif.create(image_path: "https://media0.giphy.com/media/13hwobIccdiC2I/200_d.gif", category: "kitty")
    visit login_path
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


    visit user_gifs_by_category_path

    within("#puppy") do
      expect(page).to have_css("img[src*=\"#{gif1.image_path}\"]")
      expect(page).to have_css("img[src*=\"#{gif2.image_path}\"]")
    end

    within("#kitty") do
      expect(page).to have_css("img[src*=\"#{gif3.image_path}\"]")
    end
  end

  scenario "they can view their favorites by category" do
    user = User.create(username: "Angela", password: "password", role: 0)
    gif1 = user.gifs.create(image_path: "https://media.giphy.com/media/3o6UBo8U2iHUG5mszS/giphy.gif", category: "puppy")
    gif2 = user.gifs.create(image_path: "https://media0.giphy.com/media/13hwobIccdiC2I/200_d.gif", category: "kitty")
    visit login_path
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_favorites_by_category_path

    within("#puppy") do
      expect(page).to have_css("img[src*=\"#{gif1.image_path}\"]")
    end

    within("#kitty") do
      expect(page).to have_css("img[src*=\"#{gif2.image_path}\"]")
    end
  end
end
