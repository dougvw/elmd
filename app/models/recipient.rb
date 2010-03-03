class Recipient < ActiveRecord::Base
  
  require 'digest/md5'
  
  before_save :make_token
  
  validates_presence_of :email, :zip
  validates_uniqueness_of :email, :message => " : your address is already on the list!"
  
  def make_token
    self.token = Digest::MD5.hexdigest("#{self.email}-#{Time.now.to_i}")
  end
  
  def unsubscribe_link
    "http://www.ericlarsonmd.com/recipients/show/#{self.token}"
  end
  
end
