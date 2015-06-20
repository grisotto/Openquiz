class AssuntosController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, only:  [:edit, :update, :destroy]
  before_action :set_assunto, only: [:show, :edit, :update, :destroy]


  # GET /assuntos
  # GET /assuntos.json
  def index
    # @assuntos = Assunto.all - agora so mostra os assuntos com disponivel = 1
    @assuntos = Assunto.where(:disponivel => '1').all

  end

  # GET /assuntos/1
  # GET /assuntos/1.json
  def show
  end

  # GET /assuntos/new
  def new
    @assunto = Assunto.new
  end

  # GET /assuntos/1/edit
  def edit
  end

  # POST /assuntos
  # POST /assuntos.json
  def create
    @assunto = Assunto.new(assunto_params)
	@assunto.user = current_user
    respond_to do |format|
      if @assunto.save
        #format.html { redirect_to @assunto, notice: 'Assunto was successfully created.' }
        #format.json { render :show, status: :created, location: @assunto }
      format.html { redirect_to assuntos_url, notice: 'O Assunto foi criado com sucesso.' }
      format.json { head :no_content }

      else
        format.html { render :new }
        format.json { render json: @assunto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assuntos/1
  # PATCH/PUT /assuntos/1.json
  def update
    respond_to do |format|
      if @assunto.update(assunto_params)
        format.html { redirect_to @assunto, notice: 'Assunto was successfully updated.' }
        format.json { render :show, status: :ok, location: @assunto }
      else
        format.html { render :edit }
        format.json { render json: @assunto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assuntos/1
  # DELETE /assuntos/1.json
  def destroy
    @assunto.destroy
    respond_to do |format|
      format.html { redirect_to assuntos_url, notice: 'Assunto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

def admin_only
    unless current_user.admin?
       redirect_to assuntos_url
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_assunto
      @assunto = Assunto.friendly.find(params[:id])
      #@assunto = Assunto.find(params[:id])
      #Logica para nao deixar o usuario editar modulos com disponivel = 0
      unless @assunto.disponivel == 1
   
         redirect_to assuntos_url, :alert => "Este assunto ainda está em fase de aprovação. Aguarde" 
      
       end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assunto_params
      params.require(:assunto).permit(:nome_assunto, :descricao, :link_image)
    end
end

