class SettingGroup < ActiveRecord::Base
  belongs_to :setting_group
  has_many :settings
end
