require 'spec_helper'

describe RecipientsController do

  def mock_recipient(stubs={})
    @mock_recipient ||= mock_model(Recipient, stubs)
  end

  describe "GET index" do
    it "assigns all recipients as @recipients" do
      Recipient.stub!(:find).with(:all).and_return([mock_recipient])
      get :index
      assigns[:recipients].should == [mock_recipient]
    end
  end

  describe "GET show" do
    it "assigns the requested recipient as @recipient" do
      Recipient.stub!(:find).with("37").and_return(mock_recipient)
      get :show, :id => "37"
      assigns[:recipient].should equal(mock_recipient)
    end
  end

  describe "GET new" do
    it "assigns a new recipient as @recipient" do
      Recipient.stub!(:new).and_return(mock_recipient)
      get :new
      assigns[:recipient].should equal(mock_recipient)
    end
  end

  describe "GET edit" do
    it "assigns the requested recipient as @recipient" do
      Recipient.stub!(:find).with("37").and_return(mock_recipient)
      get :edit, :id => "37"
      assigns[:recipient].should equal(mock_recipient)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created recipient as @recipient" do
        Recipient.stub!(:new).with({'these' => 'params'}).and_return(mock_recipient(:save => true))
        post :create, :recipient => {:these => 'params'}
        assigns[:recipient].should equal(mock_recipient)
      end

      it "redirects to the created recipient" do
        Recipient.stub!(:new).and_return(mock_recipient(:save => true))
        post :create, :recipient => {}
        response.should redirect_to(recipient_url(mock_recipient))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved recipient as @recipient" do
        Recipient.stub!(:new).with({'these' => 'params'}).and_return(mock_recipient(:save => false))
        post :create, :recipient => {:these => 'params'}
        assigns[:recipient].should equal(mock_recipient)
      end

      it "re-renders the 'new' template" do
        Recipient.stub!(:new).and_return(mock_recipient(:save => false))
        post :create, :recipient => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested recipient" do
        Recipient.should_receive(:find).with("37").and_return(mock_recipient)
        mock_recipient.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :recipient => {:these => 'params'}
      end

      it "assigns the requested recipient as @recipient" do
        Recipient.stub!(:find).and_return(mock_recipient(:update_attributes => true))
        put :update, :id => "1"
        assigns[:recipient].should equal(mock_recipient)
      end

      it "redirects to the recipient" do
        Recipient.stub!(:find).and_return(mock_recipient(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(recipient_url(mock_recipient))
      end
    end

    describe "with invalid params" do
      it "updates the requested recipient" do
        Recipient.should_receive(:find).with("37").and_return(mock_recipient)
        mock_recipient.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :recipient => {:these => 'params'}
      end

      it "assigns the recipient as @recipient" do
        Recipient.stub!(:find).and_return(mock_recipient(:update_attributes => false))
        put :update, :id => "1"
        assigns[:recipient].should equal(mock_recipient)
      end

      it "re-renders the 'edit' template" do
        Recipient.stub!(:find).and_return(mock_recipient(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested recipient" do
      Recipient.should_receive(:find).with("37").and_return(mock_recipient)
      mock_recipient.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the recipients list" do
      Recipient.stub!(:find).and_return(mock_recipient(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(recipients_url)
    end
  end

end
