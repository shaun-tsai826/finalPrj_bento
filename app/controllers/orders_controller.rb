class OrdersController < ApplicationController


  def create
    @menu = Menu.find(params[:menu_id])
    @order = @menu.orders.new(order_params)
    if @order.save
       redirect_to menu_path(@menu)
    else
       render :template => :back
    end
  end

  def confirm
    @menu = Menu.find(params[:menu_id])
    @order = @menu.orders.new(order_params)
      respond_to do |format|
      format.html {redirect_to :back}
      format.js {
        render :template => "orders/confirm"
      }

  end



  private
  def order_params
    params.require(:order).permit(:order_name,:order_phone,:order_address,:menu_count)
  end




end
