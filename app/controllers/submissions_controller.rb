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

        @submission.process_tests
      else
        format.html { redirect_back fallback_location: "/", alert: @submission.errors }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
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
