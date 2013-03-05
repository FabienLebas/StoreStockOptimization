module MovementsHelper
  def movements_chart_series_to(movements, start_time)
    movements_by_day = Movement.where(:movement_date => start_time.to_date..Date.today).group("movement_date").select("movement_date, sum(turnover) as turnover")
    (start_time.to_date..Date.today).map do |date|
      movement = movements_by_day.detect { |movement| movement.movement_date.to_date == date }
      movement && movement.turnover.to_f || 0
    end
  end
  
  def movements_chart_series_qty(movements, start_time)
    movements_by_day = Movement.where(:movement_date => start_time.to_date..Date.today).group("movement_date").select("movement_date, sum(quantity) as quantity")
    (start_time.to_date..Date.today).map do |date|
      movement = movements_by_day.detect { |movement| movement.movement_date.to_date == date }
      movement && movement.quantity.to_f || 0
    end
  end  
  
  def movements_chart_series_stock(movements, start_time)
    movement_by_day = Movement.where(:movement_date => start_time.to_date..Date.today).group("movement_date").select("movement_date, sum(quantity) as quantity")   
    (start_time.to_date..Date.today).map do |date|
    stock = (Article.sum("stock_qty") + Movement.where(:movement_date => date+1..Date.today).sum("quantity")) 
    end
  end
  
  def movements_chart_series_stockValue(movements, start_time)
    movement_by_day = Movement.where(:movement_date => start_time.to_date..Date.today).group("movement_date").select("movement_date, sum(quantity) as quantity")   
    (start_time.to_date..Date.today).map do |date|
    stock = (Article.sum("stock_qty * selling_price_inc_vat").to_f + Movement.where(:movement_date => date+1..Date.today).sum("turnover").to_f) 
    end
  end
  
end
