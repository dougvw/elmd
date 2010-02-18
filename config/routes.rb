ActionController::Routing::Routes.draw do |map|
 

  
  
   #named routes
    map.with_options :controller => "pages" do |pages_map|
    pages_map.about        "about",              :action => "about"
    #pages_map.volunteer    "volunteer",          :action => "volunteer"
    pages_map.make_a_donation "make_a_donation",    :action => "make_a_donation"
    pages_map.endorsements    "endorsements",         :action => "endorsements"
    pages_map.admin           "admin",              :action => "admin"
    pages_map.the_issues    "the_issues" ,        :action => "the_issues"
    #pages_map.contact_us      "contact_us",        :action => "contact_us"
    #pages_map.send_email      "send_email",        :action => "send_email"
  end
  
  #resources
  map.resources :recipients
  map.resources :volunteers
  map.resources :issues
  
  #root path
  map.root :controller => "pages"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
