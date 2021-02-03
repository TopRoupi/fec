# frozen_string_literal: true

class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_admin!, except: [:index, :show]

  # GET /exercises
  # GET /exercises.json
  def index
    @exercises ||= Exercise.all.limit(6)
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
    @exercise.content = "parágrafo para explicar o problema\n\n"\
                        "### Entrada\n\n"\
                        "parágrafo para explicar as entradas\n\n"\
                        "### Saída\n\n"\
                        "parágrafo para explicar as saídas\n\n"\
                        "| Exemplos de Entrada | Exemplos de Saída |\n"\
                        "| :- | :- |\n"\
                        "| valor1 | resultado1 |\n"\
                        "| valor2 | resultado2 |\n"\
                        "| valor3 | resultado3 |\n"
  end

  # GET /exercises/1/edit
  def edit
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = Exercise.new(exercise_params)

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to @exercise, notice: "Exercise was successfully created." }
        format.json { render :show, status: :created, location: @exercise }
      else
        format.html { render :new }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to @exercise, notice: "Exercise was successfully updated." }
        format.json { render :show, status: :ok, location: @exercise }
      else
        format.html { render :edit }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise.destroy
    respond_to do |format|
      format.html { redirect_to exercises_url, notice: "Exercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:category_id, :name, :level, :content)
  end
end
