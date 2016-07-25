class Admin::GifsController < Admin::BaseController
  include Admin::GifsHelper

  def create
    if category_param.empty?
      flash[:error] = "No category provided"
      redirect_to admin_gifs_path
    else
      gif = Gif.create(image_path: gif_url_name(category_param), category: category_param)
      redirect_to admin_gifs_path
    end
  end

  def index
    @gifs = Gif.all
    @gif = Gif.new
  end

  def destroy
    gif = Gif.find(params[:id])
    favorites = Favorite.where(gif_id: params[:id])
    favorites.delete_all
    gif.delete
    flash[:message] = "#{gif.category} gif was deleted."
    redirect_to admin_gifs_path
  end

private
  def category_param
    params[:gif][:category]
  end
end
