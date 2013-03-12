class PlannedOrdersController < ApplicationController

  before_filter :authenticate_user!

  # GET /planned_orders
  # GET /planned_orders.json
  def index
    @planned_orders = PlannedOrder.where(:user => current_user.email).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @planned_orders }
    end
  end

  # GET /planned_orders/1
  # GET /planned_orders/1.json
  def show
    @planned_order = PlannedOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @planned_order }
    end
  end

  # GET /planned_orders/new
  # GET /planned_orders/new.json
  def new
    @planned_order = PlannedOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @planned_order }
    end
  end

  # GET /planned_orders/1/edit
  def edit
    @planned_order = PlannedOrder.find(params[:id])
  end

  # POST /planned_orders
  # POST /planned_orders.json
  def create
    @planned_order = PlannedOrder.new(params[:planned_order])

    respond_to do |format|
      if @planned_order.save
        planned_order = PlannedOrder.last
        planned_order.user = current_user.email
        planned_order.save
        format.html { redirect_to @planned_order, :notice => 'Planned order was successfully created.' }
        format.json { render :json => @planned_order, :status => :created, :location => @planned_order }
      else
        format.html { render :action => "new" }
        format.json { render :json => @planned_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /planned_orders/1
  # PUT /planned_orders/1.json
  def update
    @planned_order = PlannedOrder.find(params[:id])

    respond_to do |format|
      if @planned_order.update_attributes(params[:planned_order])
        format.html { redirect_to @planned_order, :notice => 'Planned order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @planned_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /planned_orders/1
  # DELETE /planned_orders/1.json
  def destroy
    @planned_order = PlannedOrder.find(params[:id])
    @planned_order.destroy

    respond_to do |format|
      format.html { redirect_to planned_orders_url }
      format.json { head :no_content }
    end
  end
end
