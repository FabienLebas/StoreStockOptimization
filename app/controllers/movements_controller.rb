class MovementsController < ApplicationController
  # GET /movements
  # GET /movements.json
  def index
    @movements = Movement.order("movement_date DESC").all
    @movements_grouped = Movement.select("movement_date, sum(turnover) as turnover, sum(quantity) as quantity").group("movement_date").order("movement_date DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @movements }
    end
  end

  # GET /movements/1
  # GET /movements/1.json
  def show
    @movement = Movement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @movement }
    end
  end

  # GET /movements/new
  # GET /movements/new.json
  def new
    @movement = Movement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @movement }
    end
  end

  # GET /movements/1/edit
  def edit
    @movement = Movement.find(params[:id])
  end

  # POST /movements
  # POST /movements.json
  def create
    @movement = Movement.new(params[:movement])

    respond_to do |format|
      if @movement.save
        article = Article.where(:article_code => @movement.article_code).first
        article.stock_qty = article.stock_qty - @movement.quantity
        article.save
        format.html { redirect_to @movement, :notice => 'Movement was successfully created.' }
        format.json { render :json => @movement, :status => :created, :location => @movement }
      else
        format.html { render :action => "new" }
        format.json { render :json => @movement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /movements/1
  # PUT /movements/1.json
  def update
    @movement = Movement.find(params[:id])

    respond_to do |format|
      if @movement.update_attributes(params[:movement])
        format.html { redirect_to @movement, :notice => 'Movement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @movement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /movements/1
  # DELETE /movements/1.json
  def destroy
    @movement = Movement.find(params[:id])
    article = Article.where(:article_code => @movement.article_code).first
    article.stock_qty = article.stock_qty + @movement.quantity
    article.save    
    @movement.destroy

    respond_to do |format|
      format.html { redirect_to movements_url }
      format.json { head :no_content }
    end
  end
  
  def getTO
  	selected_date = Date.parse(params[:date])
  	new_html_to_return1 = Movement.where(:movement_date =>selected_date).sum("turnover")
  	new_html_to_return2 = Movement.where(:movement_date =>selected_date).sum("quantity")
  	new_html_to_return3 = Movement.where(:movement_date =>selected_date).select("article_code, sum(turnover)").group("article_code").order("sum(turnover) DESC").first.article_code
  	new_html_to_return4 = Article.where(:article_code =>Movement.where(:movement_date => selected_date).select("article_code, sum(turnover)").group("article_code").order("sum(turnover) DESC").first.article_code).first.article_text
  	  	@table = [new_html_to_return1, new_html_to_return2, new_html_to_return3, new_html_to_return4]
        render :json => @table
  end

  def getTO2Dates
  	selected_date1 = Date.parse(params[:date1])
  	selected_date2 = Date.parse(params[:date2])
  	new_html_to_return1 = Movement.where(:movement_date =>selected_date1..selected_date2).sum("turnover")
  	new_html_to_return2 = Movement.where(:movement_date =>selected_date1..selected_date2).sum("quantity")
  	new_html_to_return3 = Movement.where(:movement_date =>selected_date1..selected_date2).select("article_code, sum(turnover)").group("article_code").order("sum(turnover) DESC").first.article_code
  	new_html_to_return4 = Article.where(:article_code =>Movement.where(:movement_date => selected_date1..selected_date2).select("article_code, sum(turnover)").group("article_code").order("sum(turnover) DESC").first.article_code).first.article_text
  	  	@table = [new_html_to_return1, new_html_to_return2, new_html_to_return3, new_html_to_return4]
        render :json => @table
  end
  
  def getStartDate
    @startDate = [Date.parse(Movement.order("movement_date ASC").first.movement_date)]
    respond_to do |format|
        format.html
        format.json { render :json => @startDate }
      end
  end

end
