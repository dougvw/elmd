class Volunteer < ActiveRecord::Base

  validates_presence_of :first_name, :last_name, :email
  validates_format_of :email, :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  require 'digest/md5'
  
  before_save :make_token

 def make_token
    self.token = Digest::MD5.hexdigest("#{self.email}-#{Time.now.to_i}")
  end
  
  def unsubscribe_link
    "http://www.ericlarsonmd.com/volunteers/show/#{self.token}"
  end
    
end
