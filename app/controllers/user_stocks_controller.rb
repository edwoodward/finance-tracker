class UserStocksController < ApplicationController

  def create
    stock = Stock.check_for_stock(params[:ticker])
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end
    @user_stock = UserStock.create(user:current_user, stock: stock)
    flash[:notice] = "Stock #{stock.name} added to portfolio"
    redirect_to portfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    user_stock.destroy
    flash[:notice] = "#{stock.ticker} was removed from portfolio"
    redirect_to portfolio_path
  end
end
