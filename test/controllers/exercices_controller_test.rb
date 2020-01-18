require 'test_helper'

class ExercicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercice = create(:exercice)
  end

  test 'should get index' do
    get exercices_url
    assert_response :success
  end

  test 'should get new' do
    get new_exercice_url
    assert_response :success
  end

  test 'should create exercice' do
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

  test 'should show exercice' do
    get exercice_url(@exercice)
    assert_response :success
  end

  test 'should get edit' do
    get edit_exercice_url(@exercice)
    assert_response :success
  end

  test 'should update exercice' do
    patch exercice_url(@exercice), params: { exercice: { category_id: @exercice.category_id, code: @exercice.code, content: @exercice.content, language_id: @exercice.language_id, level: @exercice.level, limit_mem: @exercice.limit_mem, limit_time: @exercice.limit_time, name: @exercice.name } }
    assert_redirected_to exercice_url(@exercice)
  end

  test 'should destroy exercice' do
    assert_difference('Exercice.count', -1) do
      delete exercice_url(@exercice)
    end

    assert_redirected_to exercices_url
  end
end
