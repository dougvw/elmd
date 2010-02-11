require 'spec_helper'

describe "/recipients/show.html.erb" do
  include RecipientsHelper
  before(:each) do
    assigns[:recipient] = @recipient = stub_model(Recipient,
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
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ first_name/)
    response.should have_text(/value\ for\ last_name/)
    response.should have_text(/value\ for\ address_line1/)
    response.should have_text(/value\ for\ address_line2/)
    response.should have_text(/value\ for\ city/)
    response.should have_text(/value\ for\ state/)
    response.should have_text(/value\ for\ zip/)
    response.should have_text(/value\ for\ phone/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ token/)
    response.should have_text(/false/)
  end
end
