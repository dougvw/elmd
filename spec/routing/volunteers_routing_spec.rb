require 'spec_helper'

describe VolunteersController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/volunteers" }.should route_to(:controller => "volunteers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/volunteers/new" }.should route_to(:controller => "volunteers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/volunteers/1" }.should route_to(:controller => "volunteers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/volunteers/1/edit" }.should route_to(:controller => "volunteers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/volunteers" }.should route_to(:controller => "volunteers", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/volunteers/1" }.should route_to(:controller => "volunteers", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/volunteers/1" }.should route_to(:controller => "volunteers", :action => "destroy", :id => "1") 
    end
  end
end
