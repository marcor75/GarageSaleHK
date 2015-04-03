class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  # authenticate_user is a Devise keyword
  before_action :authenticate_user!

  respond_to :html, :xml, :json 

  def sales
    @orders = Order.all.where(seller: current_user).order("created_at DESC")
  end

  def purchases
    @orders = Order.all.where(buyer: current_user).order("created_at DESC")
  end

  # index, show, edit, update deleted to prevent user from changing order history;
  # delete commented out for now, in case want to include a delete function at a later stage
  def new
    @order = Order.new
    @listing = Listing.find(params[:listing_id])
  end

  def create
    @order = Order.new(order_params)
    # setting the instance variables:    
    # next line tells Rails that listing being ordered has the id as found in the URL    
    @listing = Listing.find(params[:listing_id])
    # sets seller to the listings owner
    @seller = @listing.user

    # filling in the columns in the 'orders'-table:
    #n.l. sets listing_id column in 'orders'-table to the id of @listing
    @order.listing_id = @listing.id
    # sets buyer_id col. to currently signed-in user (different from user in line 31)
    @order.buyer_id = current_user.id
    @order.seller_id = @seller.id
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to root_url, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # def destroy
  # end

  
  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:address, :city, :state)
    end

end
