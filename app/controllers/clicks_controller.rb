class ClicksController < ApplicationController
  before_action :set_click, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /clicks
  # GET /clicks.json
  def index
    @clicks = Click.all
  end

  # GET /clicks/1
  # GET /clicks/1.json
  def show
  end

  # GET /clicks/new
  def new
    @click = Click.new
  end

  # GET /clicks/1/edit
  def edit
  end

  # POST /clicks
  # POST /clicks.json
  def create
    @click = Click.new(click_params)

    respond_to do |format|
      if @click.save
        format.html { redirect_to @click, notice: 'Click was successfully created.' }
        format.json { render action: 'show', status: :created, location: @click }
      else
        format.html { render action: 'new' }
        format.json { render json: @click.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clicks/1
  # PATCH/PUT /clicks/1.json
  def update
    respond_to do |format|
      if @click.update(click_params)
        format.html { redirect_to @click, notice: 'Click was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @click.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clicks/1
  # DELETE /clicks/1.json
  def destroy
    @click.destroy
    respond_to do |format|
      format.html { redirect_to clicks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_click
      @click = Click.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def click_params
      params.require(:click).permit(:ip, :time, :server_id)
    end
end
