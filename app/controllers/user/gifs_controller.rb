class User::GifsController < User::BaseController

  def index
    @gifs = Gif.all
  end

  def by_category
    @categories = Gif.all_by_category
  end

end
