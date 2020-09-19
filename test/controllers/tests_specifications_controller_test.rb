require 'test_helper'

class TestsSpecificationsControllerTest < ActionDispatch::IntegrationTest
  context 'an authenticated admin' do
    setup do
      sign_in create(:admin)
      @tests_specification = create(:tests_specification)

      def @tests_specification.nested_attributes
        attributes = attributes()
        attributes[:tests_attributes] = tests.map.with_index { |t, i| [i, t.attributes] }.to_h
        attributes
      end
    end

    should "get edit" do
      get edit_tests_specification_url(@tests_specification)
      assert_response :success
    end

    should "update tests_specification" do
      @tests_specification.code = 'edited code'
      patch tests_specification_url(@tests_specification),
            params: {
              tests_specification: @tests_specification.attributes
            }
      assert_equal @tests_specification.code, 'edited code'
      assert_redirected_to edit_tests_specification_url(@tests_specification)
    end

    should "update tests_specification tests" do
      @tests_specification.tests[0].output = 'edited output'
      patch tests_specification_url(@tests_specification),
        params: {
          tests_specification: @tests_specification.nested_attributes
        }
      @tests_specification.reload
      assert_equal(@tests_specification.tests[0].output, 'edited output')
    end

    should "update tests_specification with a new test" do
      attributes = @tests_specification.nested_attributes
      attributes[:tests_attributes]['-1'] = build(:test).attributes
      assert_difference 'Test.count' do
        patch tests_specification_url(@tests_specification),
          params: {
            tests_specification: attributes
          }
      end
      assert_response :redirect
    end

    should "update tests_specification deleting a test" do
      @tests_specification.tests << build(:test)
      attributes = @tests_specification.nested_attributes
      attributes[:tests_attributes][2]['_destroy'] = true
      assert_difference('Test.count', -1) do
        patch tests_specification_url(@tests_specification),
          params: {
            tests_specification: attributes
          }
      end
      assert_response :redirect
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
      @tests_specification.code = 'edited code'
      patch tests_specification_url(@tests_specification),
            params: {
              tests_specification: @tests_specification.attributes
            }
      @tests_specification.reload
      refute_equal(@tests_specification.code, 'edited code')
    end
  end
end
