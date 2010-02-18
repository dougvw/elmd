class Issue < ActiveRecord::Base
  validates_presence_of :title, :body
  named_scope :active,  :conditions => ["active = ?", true]
end
