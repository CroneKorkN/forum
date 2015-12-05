class Category < ActiveRecord::Base
  has_many :categories, foreign_key: 'parent_id'
  has_many :topics
  
  scope :root, ->{ where("parent_id = ?", 0) }
  
  alias_attribute :sub_categories, :categories
end