class PagesController < ApplicationController
  restrict_to :admin, :only => [:admin]
  
  def index
    @posts = Post.find(:all, :limit => 3 , :order => "created_at DESC")
  end

  def admin
   
  end

  def about
   
  end
  
  def the_issues
   @issues = Issue.find(:all, :conditions => 'active > 0', :order => "order_number ASC")
   
  end
  
  # def endorsements
  #  
  # end
  
  def contact
    
  end
  
  def contribute
   
  end

  def volunteer
   
  end
  
  def thankyou
    
  end
  
end
