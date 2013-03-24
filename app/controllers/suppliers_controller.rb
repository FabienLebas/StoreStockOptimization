class SuppliersController < ApplicationController

  before_filter :authenticate_user!

  # GET /suppliers
  # GET /suppliers.json
  def index
    @suppliers = Supplier.where(:user => current_user.email).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @suppliers }
      format.xlsx {
        xlsx_package = Supplier.where(:user => current_user.email).to_xlsx
        begin
          temp = Tempfile.new("suppliers.xlsx")
          xlsx_package.serialize temp.path
          send_data xlsx_package.to_stream.read, :filename => 'suppliers.xlsx', :type=> "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        ensure
          temp.close
          temp.unlink
        end
      }
    end
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
    @supplier = Supplier.find(params[:id])
    @articles = Article.where(:supplier => @supplier.supplier, :user => current_user.email)
    @movements = Movement.where(:article_code => @articles.select("article_code")).order("movement_date DESC").all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @supplier }
    end
  end

  # GET /suppliers/new
  # GET /suppliers/new.json
  def new
    @supplier = Supplier.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @supplier }
    end
  end

  # GET /suppliers/1/edit
  def edit
    @supplier = Supplier.find(params[:id])
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(params[:supplier])

    respond_to do |format|
      if @supplier.save
        supplier = Supplier.last
        supplier.user = current_user.email
        supplier.save
        format.html { redirect_to @supplier, :notice => 'Supplier was successfully created.' }
        format.json { render :json => @supplier, :status => :created, :location => @supplier }
      else
        format.html { render :action => "new" }
        format.json { render :json => @supplier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /suppliers/1
  # PUT /suppliers/1.json
  def update
    @supplier = Supplier.find(params[:id])

    respond_to do |format|
      if @supplier.update_attributes(params[:supplier])
        format.html { redirect_to @supplier, :notice => 'Supplier was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @supplier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy

    respond_to do |format|
      format.html { redirect_to suppliers_url }
      format.json { head :no_content }
    end
  end
  
  def import
    Supplier.import(params[:file])
    redirect_to suppliers_path, notice: "Suppliers imported."
  end
  
end
