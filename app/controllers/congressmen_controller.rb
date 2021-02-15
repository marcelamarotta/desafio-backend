class CongressmenController < ApplicationController
  def index
    @congressmen = Congressman.all
    @congressmen_expenses = []
    @congressmen.map do |congressman|
      total = congressman.expenses.sum(:amount) 
      total_spend = {total: total, congressman_id: congressman.id }
      @congressmen_expenses << total_spend
    end
  end

  def show
    @congressman = Congressman.find(params[:id])
    @expenses = @congressman.expenses
  end
end
