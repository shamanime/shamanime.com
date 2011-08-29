# encoding: utf-8
class Contact
  include ActiveModel::Validations
  
  validates_presence_of :name, :email, :message
  # to deal with form, you must have an id attribute
  attr_accessor :id,:name, :email, :message
  
  validates :email, :format => { :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i }, :allow_blank => :true

  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end

  def to_key
  end

  def save
    if self.valid?
      Site.contact(@attributes).deliver
      return true
    end
    return false
  end
end