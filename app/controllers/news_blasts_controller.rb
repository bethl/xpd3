class NewsBlastsController < ApplicationController
  before_filter :admin_user, :only => [:create, :destroy, :index]
  
  # GET /news_blasts
  # GET /news_blasts.xml
  def index
    @news_blasts = NewsBlast.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news_blasts }
    end
  end

  # GET /news_blasts/1
  # GET /news_blasts/1.xml
  def show
    @news_blast = NewsBlast.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news_blast }
    end
  end

  # GET /news_blasts/new
  # GET /news_blasts/new.xml
  def new
    if !current_user?(User.find(1))
      flash[:error] = "You must be logged in to use this feature."
      redirect_to users_path
      return
    end
    
    
    
    @news_blast = NewsBlast.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news_blast }
    end
  end

  # GET /news_blasts/1/edit
  def edit
    @news_blast = NewsBlast.find(params[:id])
  end

  # POST /news_blasts
  # POST /news_blasts.xml
  def create
    @news_blast = NewsBlast.new(params[:news_blast])
    
    @news_blast.content = []
  
    params[:dyn].each do |n|
      next if n[1] == ""
      @news_blast.content << n[1]
    end
    
    respond_to do |format|
      if @news_blast.save
        #format.html { redirect_to(@news_blast, :notice => 'News blast was successfully created.') }
        format.html { redirect_to(root_url, :notice => 'News blast was successfully created.') }
        format.xml  { render :xml => @news_blast, :status => :created, :location => @news_blast }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @news_blast.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /news_blasts/1
  # PUT /news_blasts/1.xml
  def update
    @news_blast = NewsBlast.find(params[:id])

    respond_to do |format|
      if @news_blast.update_attributes(params[:news_blast])
        format.html { redirect_to(@news_blast, :notice => 'News blast was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news_blast.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news_blasts/1
  # DELETE /news_blasts/1.xml
  def destroy
    @news_blast = NewsBlast.find(params[:id])
    @news_blast.destroy

    respond_to do |format|
      format.html { redirect_to(news_blasts_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
