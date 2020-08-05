require 'test_helper'

class TestsSpecificationsControllerTest < ActionDispatch::IntegrationTest
  context 'an authenticated admin' do
    setup do
      sign_in create(:admin)
      @tests_specification = create(:tests_specification)
    end

    should "get edit" do
      get edit_tests_specification_url(@tests_specification)
      assert_response :success
    end

    should "update tests_specification" do
      patch tests_specification_url(@tests_specification),
            params: {
              tests_specification: {
                code: @tests_specification.code,
                exercice_id: @tests_specification.exercice_id,
                limit_mem: @tests_specification.limit_mem,
                limit_time: @tests_specification.limit_time
                }
              }
      assert_redirected_to tests_specification_url(@tests_specification)
    end
  end
  
  context 'a unauthenticated user' do
    setup do
      @tests_specification = create(:tests_specification)
    end
  
    should "not get edit" do
      get edit_tests_specification_url(@tests_specification)
      assert_response :redirect
    end

    should "not update tests_specification" do
      updated_code = "aaaaaaaaaaaaaaaaaaaa"
      patch tests_specification_url(@tests_specification),
            params: {
              tests_specification: {
                code: updated_code,
                exercice_id: @tests_specification.exercice_id,
                limit_mem: @tests_specification.limit_mem,
                limit_time: @tests_specification.limit_time
                }
              }
      @tests_specification.reload
      refute_equal(@tests_specification.code, updated_code)
    end
  end
end
