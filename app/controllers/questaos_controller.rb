class QuestaosController < ApplicationController
  before_action :authenticate_user!
   before_action :admin_only, only:  [:edit, :update, :destroy]

  before_action :set_questao, only: [:show, :edit, :update, :destroy]


  # GET /questaos
  # GET /questaos.json
  def index
        #@questaos = Questao.all
    @questaos = Questao.where(:disponivel => '1').all
    @questaos = Questao.order("id").where(:tema_id => 12).page(params[:page]).per(1)
  end

  def specializations
    assunto = Assunto.find(params[:assunto_id])
    respond_to do |format|
      format.json { render :json => assunto.temas }
    end
  end

  # GET /questaos/1
  # GET /questaos/1.json
  def show
  end

  # GET /questaos/new
  def new
    @questao = Questao.new
  end

  # GET /questaos/1/edit
  def edit
  end

  # POST /questaos
  # POST /questaos.json
  def create
    @questao = Questao.new(questao_params)
    @questao.user = current_user
    @questao.tema_id = (params[:tema_id])
    @questao.assunto_id = (params[:assunto_id])
    respond_to do |format|
      if @questao.save
        format.html { redirect_to @questao, notice: 'Questao was successfully created.' }
        format.json { render :show, status: :created, location: @questao }
      else
        format.html { render :new }
        format.json { render json: @questao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questaos/1
  # PATCH/PUT /questaos/1.json
  def update
    respond_to do |format|
      if @questao.update(questao_params)
        format.html { redirect_to @questao, notice: 'Questao was successfully updated.' }
        format.json { render :show, status: :ok, location: @questao }
      else
        format.html { render :edit }
        format.json { render json: @questao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questaos/1
  # DELETE /questaos/1.json
  def destroy
    @questao.destroy
    respond_to do |format|
      format.html { redirect_to questaos_url, notice: 'Questao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_questao
      @questao = Questao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questao_params
      params.require(:questao).permit(:pergunta, :resposta, :dica, :tema_id, :assunto_id)
    end
end
