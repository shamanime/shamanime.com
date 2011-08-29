class Admin::PostsController <  Admin::BaseController
  respond_to :html, :json
  before_filter :get_users, :except => [:index, :destroy]
  
  def index
    @title = "Post listing"
    @posts = Post.all.desc(:created_at)
  end

  def new
    @title = "New post"
    @post = Post.new
  end

  def edit
    @title = "Edit post"
    @post = Post.find_by_slug(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    respond_with @post do |format|
      if @post.save
        format.html { redirect_to admin_posts_url, :flash => { success: 'Post was successfully created.' } }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @post = Post.find_by_slug(params[:id])
    respond_with @post do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to admin_posts_url, :flash => { success: 'Post was successfully updated.' } }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @post = Post.find_by_slug(params[:id])
    @post.destroy
    respond_with @post do |format|
      format.html { redirect_to admin_posts_url, :flash => { success: 'Post was successfully destroyed.' } }
    end
  end
  
  private
  def get_users
    @users = User.all
  end
end