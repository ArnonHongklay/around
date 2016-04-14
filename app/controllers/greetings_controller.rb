class GreetingsController < ApplicationController
  def hello
    @page = params[:page].nil? ? 1 : params[:page]
    @posts = Blog::Post.page(@page).includes(:user).published
  end
end
