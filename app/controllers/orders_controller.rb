class OrdersController < ApplicationController

  def confirm
    @menu = Menu.find(params[:menu_id])

    # combine select menu and text_field
    full_order_address = params[:order][:order_address] || params[:order][:address_area] + params[:order][:address_road]
    @order = @menu.orders.new(order_params)
    # re-assign order_address with new combined address
    @order.order_address = full_order_address
      respond_to do |format|
      format.html {redirect_to :template => "menus/wrong"}
      format.js {
        render :template => "orders/confirm"
      }
    end
  end

  def create
    @menu = Menu.find(params[:menu_id])
    @order = @menu.orders.new(order_params)

    @order.user = current_user

    if @menu.enough?(@order.menu_count)
      if @order.save
       redirect_to menu_path(@menu)
      else
       render :template => "menus/wrong"
      end
    else
     render :template => "menus/out_of_stock"
    end

  end

  def index
    @orders = current_user.orders.page(params[:page]).per(5)
  end

  private

  def order_params
    params.require(:order).permit(:order_name,:order_phone,:order_address,:menu_count)
  end

end
