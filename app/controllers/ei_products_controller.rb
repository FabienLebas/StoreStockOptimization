class EiProductsController < ApplicationController
  # GET /ei_products
  # GET /ei_products.json

  before_filter :authenticate_user!

  def index
    if current_user.email == "fabienlebas@free.fr"
    @ei_products = EiProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ei_products }
    end
    end
  end

  # GET /ei_products/1
  # GET /ei_products/1.json
  def show
    if current_user.email == "fabienlebas@free.fr"
    @ei_product = EiProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ei_product }
    end
    end
  end

  # GET /ei_products/new
  # GET /ei_products/new.json
  def new
    if current_user.email == "fabienlebas@free.fr"
    @ei_product = EiProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ei_product }
    end
    end
  end

  # GET /ei_products/1/edit
  def edit
    if current_user.email == "fabienlebas@free.fr"
    @ei_product = EiProduct.find(params[:id])
    end
  end

  # POST /ei_products
  # POST /ei_products.json
  def create
    if current_user.email == "fabienlebas@free.fr"
    @ei_product = EiProduct.new(params[:ei_product])

    respond_to do |format|
      if @ei_product.save
        format.html { redirect_to @ei_product, notice: 'Ei product was successfully created.' }
        format.json { render json: @ei_product, status: :created, location: @ei_product }
      else
        format.html { render action: "new" }
        format.json { render json: @ei_product.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # PUT /ei_products/1
  # PUT /ei_products/1.json
  def update
    if current_user.email == "fabienlebas@free.fr"
    @ei_product = EiProduct.find(params[:id])

    respond_to do |format|
      if @ei_product.update_attributes(params[:ei_product])
        format.html { redirect_to @ei_product, notice: 'Ei product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ei_product.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # DELETE /ei_products/1
  # DELETE /ei_products/1.json
  def destroy
    if current_user.email == "fabienlebas@free.fr"
    @ei_product = EiProduct.find(params[:id])
    @ei_product.destroy

    respond_to do |format|
      format.html { redirect_to ei_products_url }
      format.json { head :no_content }
    end
    end
  end
end
