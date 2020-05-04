class SubmissionsController < ApplicationController
  before_action :set_exercice, only: [:show]
  before_action :authenticate_user!

  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
    @languages = Language.all
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.new(submission_params)

    respond_to do |format|
      if @submission.save
        format.html { redirect_to @submission, notice: 'Submission was successfully created.' }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercice
      @exercice = Exercice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:code, :user_id, :language_id, :exercice_id)
    end
end
