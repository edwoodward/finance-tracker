class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        flash[:alert] = "Please enter a valid stock ticker symbol"
        redirect_to portfolio_path
      end
    else 
      flash[:alert] = "A stock ticker symbol must be entered"
      redirect_to portfolio_path
    end
    
  end
end