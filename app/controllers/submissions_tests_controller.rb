class SubmissionsTestsController < ApplicationController
  before_action :set_submissions_test, only: [:show, :edit, :update, :destroy]

  # GET /submissions_tests
  # GET /submissions_tests.json
  def index
    @submissions_tests = SubmissionsTest.all
  end

  # GET /submissions_tests/1
  # GET /submissions_tests/1.json
  def show
  end

  # GET /submissions_tests/new
  def new
    @submissions_test = SubmissionsTest.new
  end

  # GET /submissions_tests/1/edit
  def edit
  end

  # POST /submissions_tests
  # POST /submissions_tests.json
  def create
    @submissions_test = SubmissionsTest.new(submissions_test_params)

    respond_to do |format|
      if @submissions_test.save
        format.html { redirect_to @submissions_test, notice: 'Submissions test was successfully created.' }
        format.json { render :show, status: :created, location: @submissions_test }
      else
        format.html { render :new }
        format.json { render json: @submissions_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submissions_tests/1
  # PATCH/PUT /submissions_tests/1.json
  def update
    respond_to do |format|
      if @submissions_test.update(submissions_test_params)
        format.html { redirect_to @submissions_test, notice: 'Submissions test was successfully updated.' }
        format.json { render :show, status: :ok, location: @submissions_test }
      else
        format.html { render :edit }
        format.json { render json: @submissions_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions_tests/1
  # DELETE /submissions_tests/1.json
  def destroy
    @submissions_test.destroy
    respond_to do |format|
      format.html { redirect_to submissions_tests_url, notice: 'Submissions test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submissions_test
      @submissions_test = SubmissionsTest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submissions_test_params
      params.require(:submissions_test).permit(:submission_id, :test_id, :pass, :time_running, :output, :errors, :warnings, :mem_peak)
    end
end
