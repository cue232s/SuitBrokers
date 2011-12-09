class ProductFeatureOptionsController < ApplicationController
  layout 'admin1'

  before_filter :find_product_feature

  def new
    @product_feature_option = ProductFeatureOption.new(:product_feature_id => @product_feature.id)
    @product_feature_option_count = @product_feature.product_feature_options.size + 1
    @product_features = Product.sorted


  end

  def create
    new_position = params[:product_feature_option].delete(:position)
    # Instantiate a new object using form params
    @product_feature_option = ProductFeatureOption.new(params[:product_feature_option])
    #save the object
    if @product_feature_option.save
      @product_feature_option.move_to_position(new_position)
      #If save succeeds, redirect to the list action
      flash[:notice]= "Product Feature created."
      redirect_to(:action => 'list', :product_feature_id => @product_feature_option.product_feature_id)
    else
      #If save fails, redisplay the form so user can fix problems
      @product_feature_option = @product_feature.product_feature_options.size + 1
      @product_features = Product.sorted
      render('new')
    end


  end

  def edit
    @product_feature_option = ProductFeatureOption.find(params[:id])
    @product_features = Product.sorted
    @product_feature_option_count = @product_feature.product_feature_options.size
  end

  def update
    new_position = params[:product_feature_option].delete(:position)

    # find object using form parameters
    @product_feature_option = ProductFeatureOption.find(params[:id])
    #save the object
    if @product_feature_option.update_attributes(params[:product_feature_option])
      @product_feature_option.move_to_position(new_position)

      #If update succeeds, redirect to the show action
      flash[:notice] = "Product feature updated."

      redirect_to(:action => 'show', :id => @product_feature_option.id, :product_feature_id => @product_feature_option.product_feature_id)
    else
      #If update fails, redisplay the form so user can fix problems
      @product_feature_option_count = @product_feature.product_feature_options.size
      render('edit')     #or you can use the symbol :edit
    end
  end

  def list
    @product_feature_options = ProductFeatureOption.sorted.where(:product_feature_id => @product_feature.id)
  end
  def show
    @product_feature_option = ProductFeatureOption.find(params[:id])
  end

  def delete
    @product_feature_option = ProductFeatureOption.find(params[:id])
  end

  def destroy
    product_feature_option = ProductFeatureOption.find(params[:id])
    product_feature_option.move_to_position(nil)
    product_feature_option.destroy
    flash[:notice] = ' product_feature_option has been destroyed'
    redirect_to(:action => 'list', :product_feature_id => product_feature_option.product_feature_id)

  end

  private
  def find_product_feature
    if params[:product_feature_id]
      @product_feature = ProductFeature.find_by_id(params[:product_feature_id])
    end

  end


end
