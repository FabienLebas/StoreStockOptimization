module MovementsHelper
  def movements_chart_series(movements, start_time)
    movements_by_day = Movement.where(:movement_date => start_time.to_date..Date.today).group("movement_date").select("movement_date, sum(turnover) as turnover")
    (start_time.to_date..Date.today).map do |date|
      movement = movements_by_day.detect { |movement| movement.movement_date.to_date == date }
      movement && movement.turnover.to_f || 0
    end
  end
end
