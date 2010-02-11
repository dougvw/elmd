require 'spec_helper'

describe Recipient do
  before(:each) do
    @valid_attributes = {
      :first_name => "value for first_name",
      :last_name => "value for last_name",
      :address_line1 => "value for address_line1",
      :address_line2 => "value for address_line2",
      :city => "value for city",
      :state => "value for state",
      :zip => "value for zip",
      :phone => "value for phone",
      :email => "value for email",
      :token => "value for token",
      :active => false
    }
  end

  it "should create a new instance given valid attributes" do
    Recipient.create!(@valid_attributes)
  end
end
