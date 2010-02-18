require 'spec_helper'

describe Issue do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :body => "value for body",
      :active => false
    }
  end

  it "should create a new instance given valid attributes" do
    Issue.create!(@valid_attributes)
  end
end
