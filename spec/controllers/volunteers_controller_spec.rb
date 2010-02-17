require 'spec_helper'

describe VolunteersController do

  def mock_volunteer(stubs={})
    @mock_volunteer ||= mock_model(Volunteer, stubs)
  end

  describe "GET index" do
    it "assigns all volunteers as @volunteers" do
      Volunteer.stub!(:find).with(:all).and_return([mock_volunteer])
      get :index
      assigns[:volunteers].should == [mock_volunteer]
    end
  end

  describe "GET show" do
    it "assigns the requested volunteer as @volunteer" do
      Volunteer.stub!(:find).with("37").and_return(mock_volunteer)
      get :show, :id => "37"
      assigns[:volunteer].should equal(mock_volunteer)
    end
  end

  describe "GET new" do
    it "assigns a new volunteer as @volunteer" do
      Volunteer.stub!(:new).and_return(mock_volunteer)
      get :new
      assigns[:volunteer].should equal(mock_volunteer)
    end
  end

  describe "GET edit" do
    it "assigns the requested volunteer as @volunteer" do
      Volunteer.stub!(:find).with("37").and_return(mock_volunteer)
      get :edit, :id => "37"
      assigns[:volunteer].should equal(mock_volunteer)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created volunteer as @volunteer" do
        Volunteer.stub!(:new).with({'these' => 'params'}).and_return(mock_volunteer(:save => true))
        post :create, :volunteer => {:these => 'params'}
        assigns[:volunteer].should equal(mock_volunteer)
      end

      it "redirects to the created volunteer" do
        Volunteer.stub!(:new).and_return(mock_volunteer(:save => true))
        post :create, :volunteer => {}
        response.should redirect_to(volunteer_url(mock_volunteer))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved volunteer as @volunteer" do
        Volunteer.stub!(:new).with({'these' => 'params'}).and_return(mock_volunteer(:save => false))
        post :create, :volunteer => {:these => 'params'}
        assigns[:volunteer].should equal(mock_volunteer)
      end

      it "re-renders the 'new' template" do
        Volunteer.stub!(:new).and_return(mock_volunteer(:save => false))
        post :create, :volunteer => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested volunteer" do
        Volunteer.should_receive(:find).with("37").and_return(mock_volunteer)
        mock_volunteer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :volunteer => {:these => 'params'}
      end

      it "assigns the requested volunteer as @volunteer" do
        Volunteer.stub!(:find).and_return(mock_volunteer(:update_attributes => true))
        put :update, :id => "1"
        assigns[:volunteer].should equal(mock_volunteer)
      end

      it "redirects to the volunteer" do
        Volunteer.stub!(:find).and_return(mock_volunteer(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(volunteer_url(mock_volunteer))
      end
    end

    describe "with invalid params" do
      it "updates the requested volunteer" do
        Volunteer.should_receive(:find).with("37").and_return(mock_volunteer)
        mock_volunteer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :volunteer => {:these => 'params'}
      end

      it "assigns the volunteer as @volunteer" do
        Volunteer.stub!(:find).and_return(mock_volunteer(:update_attributes => false))
        put :update, :id => "1"
        assigns[:volunteer].should equal(mock_volunteer)
      end

      it "re-renders the 'edit' template" do
        Volunteer.stub!(:find).and_return(mock_volunteer(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested volunteer" do
      Volunteer.should_receive(:find).with("37").and_return(mock_volunteer)
      mock_volunteer.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the volunteers list" do
      Volunteer.stub!(:find).and_return(mock_volunteer(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(volunteers_url)
    end
  end

end
