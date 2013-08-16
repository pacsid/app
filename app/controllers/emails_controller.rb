class EmailsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  # GET /emails
  # GET /emails.json
  def index
    @emails = Email.all
    respond_to do |format|
      format.html { render :html => @emails }
      format.xml { render :xml => @emails.to_xml }
    end
  end
  def top
    @emails = Email.find(:all, :order => 'visualizacao DESC')
    respond_to do |format|
      format.html { render :html => @emails }
      format.xml { render :xml => @emails.to_xml }
    end
  end

  def exportar_top
    @emails = Email.find(:all, :order => 'visualizacao DESC')
    @arqexportartop ="tmp/#{Date.today.strftime}emails.txt"
    file = File.new(@arqexportartop,"w")
    @emails.each do |email|
      file.write("#{email.email}\n")
    end
    file.close
    send_file(@arqexportartop, :disposition => 'attachment')
  end

  def exportar_acessos
    @acessos = Acesso.find(:all, :include => :email, :order => 'emails.id')
    @arqexpacessos = "tmp/#{Date.today.strftime}acessos.txt"
    file = File.new(@arqexpacessos, "w")
    @acessos.each do |acesso|
      file.write("#{acesso.email.email}\n")
    end
    file.close
    send_file(@arqexpacessos, :disposition => 'attachment')
  end

  def exportar_emails_srv(id)
    @emails = Email.where(:server_id => id)
    @arqemailssrv = "tmp/#{Date.today.strftime}emailsrv#{id}.txt"
    file = File.new(@arqemailssrv, "w")
    @emails.each do |email|
      file.write("#{email.email}\n")
    end
    file.close
    send_file(@arqemailssrv, :disposition => 'attachment')
  end


  # GET /emails/1
  # GET /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails
  # POST /emails.json
  def create
    @email = Email.new(email_params)

    respond_to do |format|
      if @email.save
        format.html { redirect_to @email, notice: 'Email was successfully created.' }
        format.json { render action: 'show', status: :created, location: @email }
      else
        format.html { render action: 'new' }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emails/1
  # PATCH/PUT /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to @email, notice: 'Email was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:email, :data, :server_id)
    end
end
