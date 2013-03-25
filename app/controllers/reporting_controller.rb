class ReportingController < ApplicationController
  def best_sellers
    @articles = Article.where(:user => current_user.email)
    @articles_last_4weeks = Movement.where(:user => current_user.email, :movement_date => Date.today-27..Date.today).select("article_code, sum(quantity) as quantity, sum(turnover) as turnover").group("article_code").order("turnover DESC")
  end

  def slow_movers
  end

  def end_life
  end
end
