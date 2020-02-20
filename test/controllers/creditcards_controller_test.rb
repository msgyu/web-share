require 'test_helper'

class CreditcardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get creditcards_index_url
    assert_response :success
  end

  test "should get new" do
    get creditcards_new_url
    assert_response :success
  end

  test "should get create" do
    get creditcards_create_url
    assert_response :success
  end

  test "should get destroy" do
    get creditcards_destroy_url
    assert_response :success
  end

end
