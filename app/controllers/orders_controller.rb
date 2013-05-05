class OrdersController < ApplicationController

  before_filter :authenticate_user!

  # GET /orders
  # GET /orders.json
  def index
    params[:sort] ||= "article_code"
    params[:direction] ||= "desc"
    @orders = Order.order(params[:sort] + " " + params[:direction]).where(:user => current_user.email)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @orders }
      format.xlsx {
        xlsx_package = Order.where(:user => current_user.email).to_xlsx
        begin
          temp = Tempfile.new("orders.xlsx")
          xlsx_package.serialize temp.path
          send_data xlsx_package.to_stream.read, :filename => 'orders.xlsx', :type=> "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        ensure
          temp.close
          temp.unlink
        end
      }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new
    @suppliers = Supplier.where(:user => current_user.email).select("supplier")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    @suppliers = Supplier.where(:user => current_user.email).select("supplier")
    
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        if Article.where(:user => current_user.email, :article_code => @order.article_code).empty?
          raise "The article code #{@order.article_code} does not exist, so the order will not be saved."
          else
            order = Order.last
            order.user = current_user.email
            order.save
            format.html { redirect_to @order, :notice => 'Order was successfully created.' }
            format.json { render :json => @order, :status => :created, :location => @order }
          end
      else
        format.html { render :action => "new" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])
    @suppliers = Supplier.where(:user => current_user.email).select("supplier_text")

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, :notice => 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
  
  def import
    Order.import(params[:file])
    redirect_to articles_path, notice: "Orders imported."
  end
  
end
