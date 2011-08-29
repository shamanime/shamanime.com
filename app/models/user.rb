class User
  include Mongoid::Document
  include Mongoid::Timestamps
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :timeoutable
  
  has_many :posts

  field :name
  field :username, :type => String
  field :email, :type => String
  validates_presence_of :name, :username
  validates_uniqueness_of :username, :name, :email, :case_sensitive => false
  attr_accessible :name, :email, :password, :password_confirmation, :username
  
  def last_post
    post = posts.published.desc(:created_at).first
  end
end
