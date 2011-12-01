class CustomerController < ApplicationController

  layout 'admin'

  def index
    list
    render('list')
  end

  def list
    @customers = Customer.order("id ASC")
  end

  def show
    @customer = Customer.find(params[:id])
    @customerOrders = Customer.find(params[:id]).ShoppingCarts
  end

  def delete
    @customer = Customer.find(params[:id])
  end

  def destroy
    Customer.find(params[:id]).destroy
    flash[:notice] = "Customer has been deleted."
    redirect_to(:action => 'list')
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params[:customer])

    if @customer.save
      flash[:notice] = "Customer Created"
      redirect_to(:action => 'list')
    else
      render('new')
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update_attributes(params[:customer])
    if @customer.save!
       flash[:notice] = "Customer updated."
       redirect_to(:action => 'list')
    else
      render('edit')
    end


  end



end
