class ExercicesController < ApplicationController
  before_action :set_exercice, only: [:show, :edit, :update, :destroy]

  # GET /exercices
  # GET /exercices.json
  def index
    @exercices = Exercice.all
  end

  # GET /exercices/1
  # GET /exercices/1.json
  def show
  end

  # GET /exercices/new
  def new
    @exercice = Exercice.new
    @exercice.content = "parágrafo para explicar o problema\n\n"\
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

  # GET /exercices/1/edit
  def edit
  end

  # POST /exercices
  # POST /exercices.json
  def create
    @exercice = Exercice.new(exercice_params)

    respond_to do |format|
      if @exercice.save
        format.html { redirect_to @exercice, notice: 'Exercice was successfully created.' }
        format.json { render :show, status: :created, location: @exercice }
      else
        format.html { render :new }
        format.json { render json: @exercice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercices/1
  # PATCH/PUT /exercices/1.json
  def update
    respond_to do |format|
      if @exercice.update(exercice_params)
        format.html { redirect_to @exercice, notice: 'Exercice was successfully updated.' }
        format.json { render :show, status: :ok, location: @exercice }
      else
        format.html { render :edit }
        format.json { render json: @exercice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercices/1
  # DELETE /exercices/1.json
  def destroy
    @exercice.destroy
    respond_to do |format|
      format.html { redirect_to exercices_url, notice: 'Exercice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_exercice
    @exercice = Exercice.find(params[:id])
  end

  def exercice_params
    params.require(:exercice).permit(:category_id,
                                     :language_id,
                                     :name,
                                     :level,
                                     :content,
                                     :code,
                                     :limit_time,
                                     :limit_mem,
                                     tests_attributes: %I[id
                                                          output
                                                          input
                                                          visible
                                                          _destroy])
  end
end
