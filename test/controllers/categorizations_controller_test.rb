require 'test_helper'

class CategorizationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get categorizations_create_url
    assert_response :success
  end

end
