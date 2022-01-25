require 'test_helper'

class MiniCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mini_categories_index_url
    assert_response :success
  end

  test "should get edit" do
    get mini_categories_edit_url
    assert_response :success
  end

end
