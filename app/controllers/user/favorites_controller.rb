class User::FavoritesController < User::BaseController

  def create
    fave = Favorite.create(user_id: current_user.id, gif_id: params[:id])
    if fave.save
      flash[:message] = "Saved to favorites!"
    else
      flash[:error] = "Already favorited"
    end
    redirect_to request.referrer
  end

  def index
    @gifs = current_user.gifs
  end

  def destroy
    fave = Favorite.find_by_user_id_and_gif_id(current_user.id, params[:id].to_i)
    Favorite.delete(fave.id)
    redirect_to request.referrer
  end

  def by_category
    @categories = current_user.gifs.all_by_category
  end

end
