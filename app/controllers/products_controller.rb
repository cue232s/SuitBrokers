class ProductsController < ApplicationController

  layout 'admin1'

  def index
    list
    render('list')
  end

   def new
    @product = Product.new
    @product_count = Product.count + 1
    @products = Product.sorted

    respond_to do |format|
      format.html
      format.js #{render :nothing => true }
    end

  end

  def create
    new_position = params[:product].delete(:position)

    @product = Product.new(params[:product])

    if @product.save

      @product.move_to_position(new_position)
      flash[:notice]= "Product created."
      redirect_to(:action => @products)
    else

      @product_count = Product.count + 1
      @products = Product.sorted
      render ('new')
    end
  end

  def delete
    @product = Product.find(params[:id])
  end


  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:notice]= product.name + " deleted."
    #redirect_to(:action => 'list')

    respond_to do |format|
      format.html { redirect_to products_url }
      format.js {render :js => true, :locals => {flash[:notice] => product.name + " deleted" }}
    end


  end


  def edit
    @product = Product.find(params[:id])
    @product_count = Product.count
    @products = Product.sorted
  end

  def update
		# find object using form parameters
    new_position = params[:product].delete(:position)
		@product = Product.find(params[:id])
		#save the object
		if @product.update_attributes(params[:product])

      @product.move_to_position(new_position)

		#If update succeeds, redirect to the show action
			flash[:notice] = "Product updated."

			redirect_to(:action => 'show', :id => @product.id)
		else		
		#If update fails, redisplay the form so user can fix problems
		@product_count = Product.count 
		render('edit')
		end		
  end

  def list
    @products = Product.order('position ASC')
  end

  def show
    @product = Product.find(params[:id])
  end

end
