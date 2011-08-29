require 'rdiscount'
class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  
  belongs_to :user
  
  scope :published, where(draft: "false")
  field :title, :type => String
  field :body, :type => String
  field :draft, :type => Boolean, :default => false
  field :published_at, :type => Date, :default => Time.now
  
  validates_presence_of :title, :body, :published_at, :user
  
  slug :title, :permanent => true
  
  def to_param
    slug
  end
  
  def markdown_body
    markdown_body = RDiscount.new(body).to_html
  end
end
