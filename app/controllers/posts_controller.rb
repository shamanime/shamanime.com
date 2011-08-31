class PostsController < ApplicationController
  def index
    @posts = Post.all.published.desc(:created_at).page params[:page]
  end
  
  def show
    if @post = Post.find_by_slug(params[:id])
      @title = @post.title
    else
      redirect_to root_path, :notice => 'The post you were looking for couldn\'t be found.'
    end
  end
end
