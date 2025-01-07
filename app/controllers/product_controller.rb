class ProductController < ApplicationController
  before_action :set_id, only: [:update, :destroy, :show]

  def index
    render json: Product.all, status: :ok
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: { message: "Product created successfully",product :product }, status: :ok
    else
      render json: product.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: @product, status: :ok
    else
      render json: @product.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    head :no_content
  end

  def show
    render json: @product, status: :ok
  end

  private

  def product_params
    params.require(:product).permit(:name)
  end

  def set_id
    @product = Product.find_by(id: params[:id])
    render json: { error: 'Product not found' }, status: :not_found unless @product
  end
end