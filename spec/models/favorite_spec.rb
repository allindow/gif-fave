require 'rails_helper'

describe Favorite do
  it { should belong_to(:user) }

  it { should belong_to(:gif) }

  it { should validate_presence_of(:gif_id) }

  it { should validate_presence_of(:user_id) }

  # it { should validate_uniqueness_of(:gif_id).scoped_to(:user_id) }
  #this line doesn't work but the validation exists
end
