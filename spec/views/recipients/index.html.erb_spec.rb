require 'spec_helper'

describe "/recipients/index.html.erb" do
  include RecipientsHelper

  before(:each) do
    assigns[:recipients] = [
      stub_model(Recipient,
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
      ),
      stub_model(Recipient,
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
    ]
  end

  it "renders a list of recipients" do
    render
    response.should have_tag("tr>td", "value for first_name".to_s, 2)
    response.should have_tag("tr>td", "value for last_name".to_s, 2)
    response.should have_tag("tr>td", "value for address_line1".to_s, 2)
    response.should have_tag("tr>td", "value for address_line2".to_s, 2)
    response.should have_tag("tr>td", "value for city".to_s, 2)
    response.should have_tag("tr>td", "value for state".to_s, 2)
    response.should have_tag("tr>td", "value for zip".to_s, 2)
    response.should have_tag("tr>td", "value for phone".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for token".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end
