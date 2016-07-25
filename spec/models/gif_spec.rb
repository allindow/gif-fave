require 'rails_helper'

describe Gif do
  it { should have_many(:favorites) }

  it { should have_many(:users).through(:favorites) }

  it { should validate_presence_of(:category)}

  it { should validate_presence_of(:image_path) }

end
