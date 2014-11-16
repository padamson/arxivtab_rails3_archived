class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @doc = current_user.docs.build
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    #stamp
  end

  def help
  end
  
  def about
  end

  def contact
  end
end
