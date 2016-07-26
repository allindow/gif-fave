module UserHelper

  def favorite_gif?(gif)
    current_regular_user? && gif.users.include?(current_user)
  end

  def not_favorite_gif?(gif)
    current_regular_user? && gif.users.exclude?(current_user)
  end
  
end
