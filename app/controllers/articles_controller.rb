class ArticlesController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /articles
  # GET /articles.json
  def index
    params[:sort] ||= "article_text "
    params[:direction] ||= "desc"
    @articles_not_sorted = Article.where(:user => current_user.email)
    @articles = Article.search(params[:search]).order(params[:sort] + " " + params[:direction]).where(:user => current_user.email)
    @sales_per_article_last_week = Movement.where(:movement_date => Date.today-6..Date.today, :user => current_user.email).select("article_code, sum(quantity) as quantity").group("article_code")
    qty = Article.sum("stock_qty")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @articles }
      format.xlsx {
        xlsx_package = Article.where(:user => current_user.email).to_xlsx
        begin
          temp = Tempfile.new("articles.xlsx")
          xlsx_package.serialize temp.path
          send_data xlsx_package.to_stream.read, :filename => 'articles.xlsx', :type=> "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        ensure
          temp.close
          temp.unlink
        end
      }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @movements = Movement.where(:article_code => @article.article_code, :user => current_user.email).select("movement_date, article_code, sum(turnover) as turnover, sum(quantity) as quantity").group("movement_date, article_code").order("movement_date DESC")
    @average_sales = Movement.where(:article_code => @article.article_code, :movement_date => Date.today-6..Date.today, :user => current_user.email).sum("quantity").to_f / 7

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
    @suppliers = Supplier.where(:user => current_user.email).select("supplier")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
    @suppliers = Supplier.where(:user => current_user.email)
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        article = Article.last
        article.user = current_user.email
        article.save
        format.html { redirect_to @article, :notice => 'Article was successfully created.' }
        format.json { render :json => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.json { render :json => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])
    @suppliers = Supplier.where(:user => current_user.email).select("supplier_text")

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, :notice => 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
  
  def import
    Article.import(params[:file])
    redirect_to articles_path, notice: "Articles imported."
  end
  
end
