class IpfixesController < ApplicationController
  # GET /ipfixes
  # GET /ipfixes.xml
  def index
    @ipfixes = Ipfix.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ipfixes }
    end
  end

  # GET /ipfixes/1
  # GET /ipfixes/1.xml
  def show
    @ipfix = Ipfix.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ipfix }
    end
  end

  # GET /ipfixes/new
  # GET /ipfixes/new.xml
  def new
    @ipfix = Ipfix.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ipfix }
    end
  end

  # GET /ipfixes/1/edit
  def edit
    @ipfix = Ipfix.find(params[:id])
  end

  # POST /ipfixes
  # POST /ipfixes.xml
  def create
    @already_existing_host = Ipfix.where(:host => params[:ipfix][:host])
    
      puts "HERE:"
      p params
      puts 
      
      # Check if host exists, if so
    if @already_existing_host.empty?
      @ipfix = Ipfix.new(params[:ipfix])
        
      respond_to do |format|
        if @ipfix.save
          format.html { redirect_to(@ipfix, :notice => 'Ipfix was successfully created.') }
          format.xml  { render :xml => @ipfix, :status => :created, :location => @ipfix }
          format.json { render :json => @ipfix, :status => :ok, :location => @ipfix }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @ipfix.errors, :status => :unprocessable_entity }
          format.json  { render :json => @ipfix.errors, :status => :unprocessable_entity }
        end
      end
      
    else
      @already_existing_host = @already_existing_host.first
      
      @already_existing_host.ip = params[:ipfix][:ip]
      respond_to do |format|
        if @already_existing_host.save
          format.html { redirect_to(@already_existing_host, :notice => 'Ipfix was successfully updated.') }
          format.xml  { render :xml => @already_existing_host, :status => :created, :location => @already_existing_host }
          format.json { render :json => @already_existing_host, :status => :ok, :location => @already_existing_host }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @already_existing_host, :status => :unprocessable_entity }
          format.json  { render :json => @already_existing_host, :status => :unprocessable_entity }
        end
      end
    end
    
  end

  # PUT /ipfixes/1
  # PUT /ipfixes/1.xml
  def update
    @ipfix = Ipfix.find(params[:id])

    respond_to do |format|
      if @ipfix.update_attributes(params[:ipfix])
        format.html { redirect_to(@ipfix, :notice => 'Ipfix was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ipfix.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ipfixes/1
  # DELETE /ipfixes/1.xml
  def destroy
    @ipfix = Ipfix.find(params[:id])
    @ipfix.destroy

    respond_to do |format|
      format.html { redirect_to(ipfixes_url) }
      format.xml  { head :ok }
    end
  end
end
