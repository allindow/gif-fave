class User::BaseController < ApplicationController
  before_action :check_regular_user

  def check_regular_user
    render file: '/public/404' unless current_regular_user?
  end

end
