class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]

  # GET /companies or /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1 or /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies or /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: "Oppa! Empresa criada com suce$$o!" }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: "Oppa! Empresa atualizada com suce$$o!" }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @company.destroy!

    respond_to do |format|
      format.html { redirect_to companies_path, status: :see_other, notice: "A empresa foi excluída com sucesso!" }
      format.json { head :no_content }
    end
  end

  # Busca de companies na opportunity
  def search
    query = params[:query] # Parâmetro enviado pelo Select2
    companies = Company.where("company_name ILIKE ? OR cnpj ILIKE ?", "%#{query}%", "%#{query}%")
    
    # Formata os resultados no formato esperado pelo Select2
    formatted_companies = companies.map do |company|
      {
        id: company.id, # ID da empresa
        text: "#{company.company_name} (#{company.cnpj})" # Texto exibido no dropdown
      }
    end

    render json: formatted_companies # Retorna os resultados em JSON
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:company_name, :cnpj, :phone, :address, :address_number, :country, :state, :city)
    end
end
