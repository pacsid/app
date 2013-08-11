class AcessosController < ApplicationController
  before_action :set_acesso, only: [:show, :edit, :update, :destroy]

  # GET /acessos
  # GET /acessos.json
  def index
    @acessos = Acesso.all
  end

  # GET /acessos/1
  # GET /acessos/1.json
  def show
  end

  # GET /acessos/new
  def new
    @acesso = Acesso.new
  end

  # GET /acessos/1/edit
  def edit
  end

  # POST /acessos
  # POST /acessos.json
  def create
    @acesso = Acesso.new(acesso_params)

    respond_to do |format|
      if @acesso.save
        format.html { redirect_to @acesso, notice: 'Acesso was successfully created.' }
        format.json { render action: 'show', status: :created, location: @acesso }
      else
        format.html { render action: 'new' }
        format.json { render json: @acesso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acessos/1
  # PATCH/PUT /acessos/1.json
  def update
    respond_to do |format|
      if @acesso.update(acesso_params)
        format.html { redirect_to @acesso, notice: 'Acesso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @acesso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acessos/1
  # DELETE /acessos/1.json
  def destroy
    @acesso.destroy
    respond_to do |format|
      format.html { redirect_to acessos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acesso
      @acesso = Acesso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acesso_params
      params.require(:acesso).permit(:server_id, :email_id, :data)
    end
end
