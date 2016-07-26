require 'rails_helper'

describe Favorite do
  it { should belong_to(:user) }

  it { should belong_to(:gif) }

  it { should validate_presence_of(:gif) }

  it { should validate_presence_of(:user) }
end
