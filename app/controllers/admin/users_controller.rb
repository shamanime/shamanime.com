class Admin::UsersController <  Admin::BaseController
  respond_to :html, :json
  
  def index
    @title = "User listing"
    @users = User.all
  end

  def new
    @title = "New user"
    @user = User.new
  end

  def edit
    @title = "Edit user"
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    respond_with @user do |format|
      if @user.save
        format.html { redirect_to admin_users_url, :flash => { success: 'User was successfully created.' } }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    respond_with @user do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to admin_users_url, :flash => { success: 'User was successfully updated.' } }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_with @user do |format|
      format.html { redirect_to admin_users_url, :flash => { success: 'User was successfully destroyed.' } }
    end
  end
end