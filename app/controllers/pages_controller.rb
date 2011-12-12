class PagesController < ApplicationController
  skip_before_filter :authenticate
  
  
  def home
    @news_blast = NewsBlast.last
    @user = current_user
  end

  def about
  end

  def gallery
  end

  def specials
  end

  def products
  end

  def news
  end
  
  def directions
  end
  
  
  def manage
    @employee = Employee.new
  end
  
  def template
  end
  
  def brendan
  end
end
