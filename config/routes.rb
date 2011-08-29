ShamanimeCom::Application.routes.draw do
  devise_for :users, :path_names => { :sign_in => "login", :sign_out => "logout" }

  namespace 'admin' do
    resources :users, :except => :show
    resources :posts, :except => :show
    root :to => 'posts#index'
    
    match '*a', :to => 'posts#index'
  end
  
  post "/contact", :controller => :contact, :action => :contact
  get "/contact", :controller => :pages, :action => :contact
  resources :posts, :only => [:index, :show]
  root :to => 'posts#index'
  
  match '*a', :to => 'posts#index'
end
