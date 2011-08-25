class CmdlinesController < ApplicationController
  # GET /cmdlines
  # GET /cmdlines.xml
  def index
    @cmdlines = Cmdline.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cmdlines }
    end
  end

  # GET /cmdlines/1
  # GET /cmdlines/1.xml
  def show
    @cmdline = Cmdline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cmdline }
    end
  end

  # GET /cmdlines/new
  # GET /cmdlines/new.xml
  def new
    @cmdline = Cmdline.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cmdline }
    end
  end

  # GET /cmdlines/1/edit
  def edit
    @cmdline = Cmdline.find(params[:id])
  end

  # POST /cmdlines
  # POST /cmdlines.xml
  def create
    @cmdline = Cmdline.new(params[:cmdline])

    respond_to do |format|
      if @cmdline.save
        format.html { redirect_to(@cmdline, :notice => 'Cmdline was successfully created.') }
        format.xml  { render :xml => @cmdline, :status => :created, :location => @cmdline }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cmdline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cmdlines/1
  # PUT /cmdlines/1.xml
  def update
    @cmdline = Cmdline.find(params[:id])

    respond_to do |format|
      if @cmdline.update_attributes(params[:cmdline])
        format.html { redirect_to(@cmdline, :notice => 'Cmdline was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cmdline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cmdlines/1
  # DELETE /cmdlines/1.xml
  def destroy
    @cmdline = Cmdline.find(params[:id])
    @cmdline.destroy

    respond_to do |format|
      format.html { redirect_to(cmdlines_url) }
      format.xml  { head :ok }
    end
  end
end
