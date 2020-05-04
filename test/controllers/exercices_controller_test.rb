require 'test_helper'

class ExercicesControllerTest < ActionDispatch::IntegrationTest
  context 'a authenticated admin' do
    setup do
      sign_in create(:admin)
      @exercice = create(:exercice)
    end

    should 'get index' do
      get exercices_url
      assert_response :success
    end

    should 'get new' do
      get new_exercice_url
      assert_response :success
    end

    should 'create exercice' do
      assert_difference('Exercice.count') do
        post exercices_url, params: {
                              exercice: {
                                category_id: @exercice.category_id,
                                code: @exercice.code,
                                content: @exercice.content,
                                language_id: @exercice.language_id,
                                level: @exercice.level,
                                limit_mem: @exercice.limit_mem,
                                limit_time: @exercice.limit_time,
                                name: @exercice.name,
                                tests_attributes: {
                                  '0': {
                                    input: @exercice.tests[0].input,
                                    output: @exercice.tests[0].output,
                                    visible: @exercice.tests[0].visible
                                  },
                                  '1': {
                                    input: @exercice.tests[1].input,
                                    output: @exercice.tests[1].output,
                                    visible: @exercice.tests[1].visible
                                  }
                                }
                              }
                            }
      end

      assert_redirected_to exercice_url(Exercice.last)
    end

    should 'show exercice' do
      get exercice_url(@exercice)
      assert_response :success
    end

    should 'get edit' do
      get edit_exercice_url(@exercice)
      assert_response :success
    end

    should 'update exercice' do
      patch exercice_url(@exercice), params: { exercice: { category_id: @exercice.category_id, code: @exercice.code, content: @exercice.content, language_id: @exercice.language_id, level: @exercice.level, limit_mem: @exercice.limit_mem, limit_time: @exercice.limit_time, name: @exercice.name } }
      assert_redirected_to exercice_url(@exercice)
    end

    should 'destroy exercice' do
      assert_difference('Exercice.count', -1) do
        delete exercice_url(@exercice)
      end

      assert_redirected_to exercices_url
    end
  end





  context 'a unauthenticated user' do
    setup do
      @exercice = create(:exercice)
    end

    should 'get index' do
      get exercices_url
      assert_response :success
    end

    should 'not get new' do
      get new_exercice_url
      assert_response :redirect
    end

    should 'not create exercice' do
      assert_no_difference('Exercice.count') do
        post exercices_url, params: {
                              exercice: {
                                category_id: @exercice.category_id,
                                code: @exercice.code,
                                content: @exercice.content,
                                language_id: @exercice.language_id,
                                level: @exercice.level,
                                limit_mem: @exercice.limit_mem,
                                limit_time: @exercice.limit_time,
                                name: @exercice.name,
                                tests_attributes: {
                                  '0': {
                                    input: @exercice.tests[0].input,
                                    output: @exercice.tests[0].output,
                                    visible: @exercice.tests[0].visible
                                  },
                                  '1': {
                                    input: @exercice.tests[1].input,
                                    output: @exercice.tests[1].output,
                                    visible: @exercice.tests[1].visible
                                  }
                                }
                              }
                            }
      end

      assert_response :redirect
    end

    should 'show exercice' do
      get exercice_url(@exercice)
      assert_response :success
    end

    should 'not get edit' do
      get edit_exercice_url(@exercice)
      assert_response :redirect
    end

    should 'not update exercice' do
      updated_name = "sooooooooooam"
      patch exercice_url(@exercice), params: { exercice: { category_id: @exercice.category_id, code: @exercice.code, content: @exercice.content, language_id: @exercice.language_id, level: @exercice.level, limit_mem: @exercice.limit_mem, limit_time: @exercice.limit_time, name: updated_name } }
      @exercice.reload
      refute_equal(@exercice.name, updated_name)
    end

    should 'not destroy exercice' do
      assert_no_difference('Exercice.count', -1) do
        delete exercice_url(@exercice)
      end

      assert_response :redirect
    end
  end
end
