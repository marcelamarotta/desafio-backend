class CongressmenController < ApplicationController
  def index
    @congressmen = Congressman.all
    @congressmen.map do |congressman|
        total = 0
        congressman.expenses.each do |expense|
          total =+ expense.amount.to_i
        end
        congressman[:total] = total
    end
  end

  def show
    @congressman = Congressman.find(params[:id])
    total = 0
    @congressman.expenses.each do |expense|
      total =+ expense.amount.to_i
    end
    @congressman[:total] = total
  end
end
