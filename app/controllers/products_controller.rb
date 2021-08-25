class ProductsController < ApplicationController
  def index
    @products = Product.all
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.img_link == ""
      @product.img_link = "http://bandeiraimoveis-ba.com.br/application/modules/themes/views/default/assets/images/image-placeholder.png"
    end

    if @product.save
      redirect_to products_path, notice: "Product created successfully"
    else
      redirect_to products_path, alert: "Something went wrong, please try again later"
    end
  end
  
  def edit
    product = product_params
    @product = Product.find_by_id(product[:id])

    @product.update(product)
    redirect_to products_path, notice: "Product edited successfully"
  end

  def delete
    Product.find_by(id: params[:id]).destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:id, :title, :description, :price, :img_link)
  end

end