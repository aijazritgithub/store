require "test_helper"

class ProductControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one) # Assuming you have fixtures for products
    @valid_params = { product: { name: "Test Product", price: 10.0, quantitiy: 5, description: "Sample description" } }
    @invalid_params = { product: { name: "", price: -5, quantitiy: -1, description: "" } }
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should create product with valid params" do
    assert_difference('Product.count', 1) do
      post products_url, params: @valid_params
    end
    assert_response :success
  end

  test "should not create product with invalid params" do
    assert_no_difference('Product.count') do
      post products_url, params: @invalid_params
    end
    assert_response :unprocessable_entity
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should update product with valid params" do
    patch product_url(@product), params: { product: { name: "Updated Name" } }
    assert_response :success
    @product.reload
    assert_equal "Updated Name", @product.name
  end

  test "should not update product with invalid params" do
    patch product_url(@product), params: @invalid_params
    assert_response :unprocessable_entity
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end
    assert_response :no_content
  end

  test "should return not found for non-existent product" do
    get product_url(9999)
    assert_response :not_found
  end
end