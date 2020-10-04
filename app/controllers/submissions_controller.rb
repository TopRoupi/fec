# frozen_string_literal: true

class SubmissionsController < ApplicationController
  before_action :set_exercice, only: [:show]
  before_action :authenticate_user!
  include SubmissionsHelper

  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
    @page = params[:page]
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.new(submission_params)
    @submission.user = current_user

    respond_to do |format|
      if @submission.save
        format.html { redirect_to submission_ide_path(@submission.exercice_id, "results") }
        format.json { render @submission }
      else
        format.html { redirect_back fallback_location: "/", alert: "Something wrong" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end

    # tests = @submission.exercice.tests_specification.tests
    # tests_result = run_tests_battery
    #
    # (0...tests.length).each do |i|
    #   SubmissionsTest.create(
    #     submission_id: @submission.id,
    #     test: tests[i],
    #     pass: tests_result[i]["status"]["description"] == "Accepted",
    #     time_running: tests_result[i]["time"],
    #     output: tests_result[i]["stdout"],
    #     code_errors: tests_result[i]["stderr"],
    #     compile_output: tests_result[i]["compile_output"],
    #     mem_peak: tests_result[i]["memory"],
    #     description: tests_result[i]["status"]["description"]
    #   )
    # end
    #
    # render inline: "<%= render 'submissions/submission_results' %>"
  end

  private

  def run_tests_battery
    sub = Judge0::Submission.new { |config|
      config.source_code = @submission.code
      config.language_id = @submission.language.cod
    }

    tests = @submission.exercice.tests_specification.tests.map { |test| [test.input, test.output] }

    sub.tests_battery(tests)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_exercice
    @exercice = Exercice.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def submission_params
    params.require(:submission).permit(:code, :user_id, :language_id, :exercice_id)
  end
end
