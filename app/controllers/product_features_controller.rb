class ProductFeaturesController < ApplicationController

  layout 'admin1'

  before_filter :find_product

  def new
    @product_feature = ProductFeature.new(:product_id => @product.id)
    @product_feature_count = @product.product_features.size + 1
    @products = Product.sorted


  end

  def create
    new_position = params[:product_feature].delete(:position)
    # Instantiate a new object using form params
    @productFeature = ProductFeature.new(params[:product_feature])
    #save the object
    if @productFeature.save
      @productFeature.move_to_position(new_position)
      #If save succeeds, redirect to the list action
      flash[:notice]= "Product Feature created."
      redirect_to(:action => 'list', :product_id => @productFeature.product_id)
    else
      #If save fails, redisplay the form so user can fix problems
      @productFeature_count = @product.product_features.size + 1
      @products = Product.sorted
      render('new')
    end


  end

  def edit
    @product_feature = ProductFeature.find(params[:id])
    @products = Product.sorted
    @product_feature_count = @product.product_features.size
  end
  
  def update
    new_position = params[:product_feature].delete(:position)

    # find object using form parameters
    @product_feature = ProductFeature.find(params[:id])
    #save the object
    if @product_feature.update_attributes(params[:product_feature])
      @product_feature.move_to_position(new_position)

      #If update succeeds, redirect to the show action
      flash[:notice] = "Product feature updated."

      redirect_to(:action => 'show', :id => @product_feature.id, :product_id => @product_feature.product_id)
    else
      #If update fails, redisplay the form so user can fix problems
      @product_feature_count = @product.product_features.size
      render('edit')
    end
  end

  def list
    @product_features = ProductFeature.sorted.where(:product_id => @product.id)
  end
  def show
    @product_feature = ProductFeature.find(params[:id])
  end

  def delete
    @product_feature = ProductFeature.find(params[:id])
  end

  def destroy
    product_feature = ProductFeature.find(params[:id])
    product_feature.move_to_position(nil)
    product_feature.destroy
    flash[:notice] = ' product_feature has been destroyed'
    redirect_to(:action => 'list', :product_id => product_feature.product_id)

  end

  private
  def find_product
    if params[:product_id]
      @product = Product.find_by_id(params[:product_id])
    end

  end


end
