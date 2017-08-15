class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    @sale.total = @sale.value - (@sale.value * @sale.discount / 100)
    unless @sale.tax == 0
      @sale.total = @sale.total * 1.19
      @sale.tax = 19
    else
      @sale.tax = 0
    end
    @sale.save
    redirect_to sales_done_path
  end

  def done
    @sale = Sale.all
  end

  private
  def sale_params
    params.require(:sale).permit(:detail, :category, :value, :discount, :tax, :total, :cod)
  end
end
