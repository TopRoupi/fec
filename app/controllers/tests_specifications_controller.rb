class TestsSpecificationsController < ApplicationController
  before_action :set_tests_specification, only: [:edit, :update]
  before_action :authenticate_user!
  before_action :ensure_admin!

  # GET /tests_specifications/1/edit
  def edit
  end

  # PATCH/PUT /tests_specifications/1
  # PATCH/PUT /tests_specifications/1.json
  def update
    respond_to do |format|
      if @tests_specification.update(tests_specification_params)
        format.html { redirect_to edit_tests_specification_path(@tests_specification), notice: 'Tests specification was successfully updated.' }
        format.json { render :show, status: :ok, location: @tests_specification }
      else
        format.html { render :edit }
        format.json { render json: @tests_specification.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tests_specification
      @tests_specification = TestsSpecification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tests_specification_params
      if params.require(:tests_specification).key? 'tests_attributes'
        params.require(:tests_specification)['tests_attributes'].each do |test|
          test[1]['output'].gsub!(/\r\n?/, "\n") if test[1]['output']
        end
      end
      params.require(:tests_specification)
        .permit(
          :code,
          :limit_time,
          :limit_mem,
          :exercice_id,
          tests_attributes: %I[id
                               output
                               input
                               visible
                               _destroy]
        )
    end
end
