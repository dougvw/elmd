class Recipient < ActiveRecord::Base
  
  require 'digest/md5'
  
  before_save :make_token
  
  validates_presence_of :first_name, :last_name, :email
  
  def make_token
    self.token = Digest::MD5.hexdigest("#{self.email}-#{Time.now.to_i}")
  end
  
  def unsubscribe_link
    "http://www.ericlarsonmd.com/recipients/show/#{self.token}"
  end
  
end
