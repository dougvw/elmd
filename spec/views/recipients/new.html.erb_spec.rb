require 'spec_helper'

describe "/recipients/new.html.erb" do
  include RecipientsHelper

  before(:each) do
    assigns[:recipient] = stub_model(Recipient,
      :new_record? => true,
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

  it "renders new recipient form" do
    render

    response.should have_tag("form[action=?][method=post]", recipients_path) do
      with_tag("input#recipient_first_name[name=?]", "recipient[first_name]")
      with_tag("input#recipient_last_name[name=?]", "recipient[last_name]")
      with_tag("input#recipient_address_line1[name=?]", "recipient[address_line1]")
      with_tag("input#recipient_address_line2[name=?]", "recipient[address_line2]")
      with_tag("input#recipient_city[name=?]", "recipient[city]")
      with_tag("input#recipient_state[name=?]", "recipient[state]")
      with_tag("input#recipient_zip[name=?]", "recipient[zip]")
      with_tag("input#recipient_phone[name=?]", "recipient[phone]")
      with_tag("input#recipient_email[name=?]", "recipient[email]")
      with_tag("input#recipient_token[name=?]", "recipient[token]")
      with_tag("input#recipient_active[name=?]", "recipient[active]")
    end
  end
end
