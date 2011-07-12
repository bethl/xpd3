class PagesController < ApplicationController
  def home
    # @newsblast = "Crazy Days is just arround the corner!</p><br>  <p>We'll have a booth on Water St. this Thurs/Fri/Sat.</p><br>  <p>We will have in-store specials.  Hope to see you there!"
    @news_blast_items = [ "Crazy Days went great.", "Thanks to all who came out to see it."]
    
    # A news blast shall consist of
    # Date
    # Headline
    # list of facts
    
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
  
end
