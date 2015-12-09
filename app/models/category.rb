class Category < ActiveRecord::Base
  has_many :categories, foreign_key: 'parent_id'
  has_many :topics
  
  scope :root, ->{ where("parent_id = ?", 0) }
  
  alias_attribute :sub_categories, :categories
  
  def self.visible_for user
    where("id IN(?)", AccessControl.category_ids_visibile_for(user))
  end
end