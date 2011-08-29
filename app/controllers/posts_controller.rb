class PostsController < ApplicationController
  def index
    @posts = Post.all.published.desc(:created_at).paginate(page: params[:page], per_page: 7)
  end
  
  def show
    @post = Post.find_by_slug(params[:id])
    @title = @post.title
  end
end
