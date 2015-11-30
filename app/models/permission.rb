class Permission < ActiveRecord::Base
  belongs_to :setting_group
end
