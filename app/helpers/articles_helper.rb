module ArticlesHelper
  
  def article_chart_series_to(article, start_time)
    movements_by_day = Movement.where(:article_code => @article.article_code, :movement_date => start_time.to_date..Date.today, :user => current_user.email).group("movement_date").select("movement_date, sum(turnover) as turnover")
    (start_time.to_date..Date.today).map do |date|
      movement = movements_by_day.detect { |movement| movement.movement_date.to_date == date }
      movement && movement.turnover.to_f || 0
    end
  end
  
  def article_chart_series_qty(article, start_time)
    movements_by_day = Movement.where(:article_code => @article.article_code, :movement_date => start_time.to_date..Date.today, :user => current_user.email).group("movement_date").select("movement_date, sum(quantity) as quantity")
    (start_time.to_date..Date.today).map do |date|
      movement = movements_by_day.detect { |movement| movement.movement_date.to_date == date }
      movement && movement.quantity.to_f || 0
    end
  end
  
  def article_chart_series_stock(article, start_time)
    movement_by_day = Movement.where(:movement_date => start_time.to_date..Date.today, :article_code => @article.article_code, :user => current_user.email).group("movement_date").select("movement_date, sum(quantity) as quantity")   
    (start_time.to_date..Date.today).map do |date|
    stock = (@article.stock_qty + Movement.where(:movement_date => date+1..Date.today, :article_code => @article.article_code, :user => current_user.email).sum("quantity")) 
    end
  end

  def sortable (column, title = nil)
    title ||= column.titleize
    direction = column == params[:sort] && params[:direction] == "desc" ? "asc" : "desc"
    link_to title, :sort => column, :direction => direction
  end
  
end
