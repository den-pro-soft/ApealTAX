require 'test_helper'

class SelectionPropertyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get selection_property_index_url
    assert_response :success
  end

end
