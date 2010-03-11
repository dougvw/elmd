ActionController::Routing::Routes.draw do |map|

  #named routes
  map.with_options :controller => "pages" do |pages_map|
    pages_map.about        "about",              :action => "about"
    #pages_map.volunteer    "volunteer",          :action => "volunteer"
    pages_map.make_a_donation "make_a_donation",    :action => "make_a_donation"
    pages_map.endorsements    "endorsements",         :action => "endorsements"
    pages_map.admin           "admin",              :action => "admin"
    pages_map.the_issues    "the_issues" ,        :action => "the_issues"
    pages_map.contact      "contact",        :action => "contact"
    pages_map.contribute   "contribute",      :action => "contribute"
    pages_map.thankyou   "thankyou",      :action => "thankyou"
    #pages_map.send_email      "send_email",        :action => "send_email"
  end  
  map.with_options :controller => "recipients" do |recipients_map|
    recipients_map.signup "recipients/mailing_list", :action => "mailing_list"
  end
  map.with_options :controller => :posts do |posts_map|
    posts_map.news_feed 'news_feed', :controller => 'posts', :action => 'feed'
  end

  #resources
  map.resources :recipients
  map.resources :volunteers
  map.resources :issues
  map.resources :posts

  #root path
  map.root :controller => "pages"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
