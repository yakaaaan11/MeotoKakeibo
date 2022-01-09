require 'test_helper'

class ReimbursementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reimbursements_index_url
    assert_response :success
  end

end
