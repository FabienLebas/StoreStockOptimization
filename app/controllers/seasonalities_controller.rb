class SeasonalitiesController < ApplicationController

  before_filter :authenticate_user!

  # GET /seasonalities
  # GET /seasonalities.json
  def index
    @seasonalities = Seasonality.where(:user => current_user.email).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @seasonalities }
    end
  end

  # GET /seasonalities/1
  # GET /seasonalities/1.json
  def show
    @seasonality = Seasonality.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @seasonality }
    end
  end

  # GET /seasonalities/new
  # GET /seasonalities/new.json
  def new
    @seasonality = Seasonality.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @seasonality }
    end
  end

  # GET /seasonalities/1/edit
  def edit
    @seasonality = Seasonality.find(params[:id])
  end

  # POST /seasonalities
  # POST /seasonalities.json
  def create
    @seasonality = Seasonality.new(params[:seasonality])

    respond_to do |format|
      if @seasonality.save
        seasonality = Seasonality.last
        seasonality.user = current_user.email
        seasonality.save
        format.html { redirect_to @seasonality, :notice => 'Seasonality was successfully created.' }
        format.json { render :json => @seasonality, :status => :created, :location => @seasonality }
      else
        format.html { render :action => "new" }
        format.json { render :json => @seasonality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /seasonalities/1
  # PUT /seasonalities/1.json
  def update
    @seasonality = Seasonality.find(params[:id])

    respond_to do |format|
      if @seasonality.update_attributes(params[:seasonality])
        format.html { redirect_to @seasonality, :notice => 'Seasonality was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @seasonality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /seasonalities/1
  # DELETE /seasonalities/1.json
  def destroy
    @seasonality = Seasonality.find(params[:id])
    @seasonality.destroy

    respond_to do |format|
      format.html { redirect_to seasonalities_url }
      format.json { head :no_content }
    end
  end
end
