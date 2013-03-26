class ReportingController < ApplicationController
  def best_sellers
    @articles_4weeks = Movement.where(:user => current_user.email, :movement_date => Date.today-27..Date.today).select("article_code").group("article_code")
    @articles_last_4weeks_to = Movement.where(:user => current_user.email, :movement_date => Date.today-27..Date.today).select("article_code, sum(quantity) as quantity, sum(turnover) as turnover").group("article_code").order("turnover DESC")
    @articles_last_4weeks_qty = Movement.where(:user => current_user.email, :movement_date => Date.today-27..Date.today).select("article_code, sum(quantity) as quantity, sum(turnover) as turnover").group("article_code").order("quantity DESC")  
    
    @articles_12weeks = Movement.where(:user => current_user.email, :movement_date => Date.today-83..Date.today).select("article_code").group("article_code")
    @articles_last_12weeks_to = Movement.where(:user => current_user.email, :movement_date => Date.today-83..Date.today).select("article_code, sum(quantity) as quantity, sum(turnover) as turnover").group("article_code").order("turnover DESC")
    @articles_last_12weeks_qty = Movement.where(:user => current_user.email, :movement_date => Date.today-83..Date.today).select("article_code, sum(quantity) as quantity, sum(turnover) as turnover").group("article_code").order("quantity DESC")    
  
  end

  def slow_movers
    @articles_4weeks = Movement.where(:user => current_user.email, :movement_date => Date.today-27..Date.today).select("article_code").group("article_code")
    @articles_last_4weeks_to = Movement.where(:user => current_user.email, :movement_date => Date.today-27..Date.today).select("article_code, sum(quantity) as quantity, sum(turnover) as turnover").group("article_code").order("turnover ASC")
    @articles_last_4weeks_qty = Movement.where(:user => current_user.email, :movement_date => Date.today-27..Date.today).select("article_code, sum(quantity) as quantity, sum(turnover) as turnover").group("article_code").order("quantity ASC")  
    
    @articles_12weeks = Movement.where(:user => current_user.email, :movement_date => Date.today-83..Date.today).select("article_code").group("article_code")
    @articles_last_12weeks_to = Movement.where(:user => current_user.email, :movement_date => Date.today-83..Date.today).select("article_code, sum(quantity) as quantity, sum(turnover) as turnover").group("article_code").order("turnover ASC")
    @articles_last_12weeks_qty = Movement.where(:user => current_user.email, :movement_date => Date.today-83..Date.today).select("article_code, sum(quantity) as quantity, sum(turnover) as turnover").group("article_code").order("quantity ASC")
        
  end

  def end_life
    
  end
end
