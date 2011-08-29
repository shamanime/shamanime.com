class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource
  before_filter :load_recent_posts

  def layout_by_resource
    if devise_controller?
      "admin"
    else
      "application"
    end
  end
  
  def load_recent_posts
    @recent_posts = Post.published.desc(:created_at).limit(5)
  end
end
