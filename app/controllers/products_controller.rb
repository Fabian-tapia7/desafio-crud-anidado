class ProductsController < ApplicationController

  def create
    @product = Product.new(product_params)
    @product.save
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product.category, notice: 'product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to @product.category
  end

  def product_params
    params.require(:product).permit(:name, :price, :category_id)
  end
end
