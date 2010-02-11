ActionController::Routing::Routes.draw do |map|
  
   #named routes
  map.with_options :controller => "pages" do |pages_map|
    pages_map.about        "about",              :action => "about"
    pages_map.volunteer    "volunteer",          :action => "volunteer"
    pages_map.make_a_donation "make_a_donation",    :action => "make_a_donation"
    pages_map.issues          "issues",             :action => "issues"
    #pages_map.contact_us      "contact_us",        :action => "contact_us"
    #pages_map.send_email      "send_email",        :action => "send_email"
  end
  
  #resources
  map.resources :recipients
  
  #root path
  map.root :controller => "pages"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
