require 'rails_helper'

describe User do
  it { should validate_presence_of(:username) }

  it { should validate_presence_of(:password) }

  it { should validate_presence_of(:role) }

  it { should validate_uniqueness_of(:username) }

  it { should have_many(:favorites) }

  it { should have_many(:gifs).through(:favorites) }

  scenario "Upon creation user automatically has a default role" do
    user = User.create(username: "Angela", password: "password")

    expect(user.role).to eq("default")
  end
end
