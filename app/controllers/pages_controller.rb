class PagesController < ApplicationController
  def index
   
  end

  def admin
   
  end

  def about
   
  end

  def positions
   
  end
  
  def the_issues
   @issues = Issue.active
  end
  
  def endorsements
   
  end
  
  def make_a_donation
   
  end

  def volunteer
   
  end

end
