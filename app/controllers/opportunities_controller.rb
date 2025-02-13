class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: %i[ show edit update destroy ]

  # GET /opportunities or /opportunities.json
  def index
    @opportunities = Opportunity.all
  end

  # GET /opportunities/1 or /opportunities/1.json
  def show
  end

  # GET /opportunities/new
  def new
    @opportunity = Opportunity.new
    5.times { @opportunity.opportunity_products.build } # Inicializa 5 campos de produtos
  end

  # GET /opportunities/1/edit
  def edit
  end

  def create
    # Criar ou atualizar o contato
    contact_params = opportunity_params.slice(:email, :phone)
    @contact = Contact.find_or_initialize_by(email: contact_params[:email])
    @contact.assign_attributes(contact_params)
  
    if @contact.save
      # Criar ou atualizar a empresa
      company_params = opportunity_params.slice(:cnpj, :company_name)
      @company = Company.find_or_initialize_by(cnpj: company_params[:cnpj])
      @company.assign_attributes(company_params)
  
      if @company.save
        # Criar a oportunidade
        @opportunity = Opportunity.new(opportunity_params)
        @opportunity.contact = @contact
        @opportunity.company = @company
  
        if @opportunity.save
          redirect_to @opportunity, notice: "Oportunidade criada com sucesso."
        else
          render :new, status: :unprocessable_entity
        end
      else
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    if @opportunity.update(opportunity_params)
      @opportunity.calculate_total_price
      @opportunity.save
      redirect_to @opportunity, notice: "Oportunidade atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /opportunities/1 or /opportunities/1.json
  def destroy
    @opportunity.destroy
    redirect_to opportunities_path, notice: "Oportunidade excluída com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opportunity
      @opportunity = Opportunity.find(params[:id])
    end
  
    def opportunity_params
      params.require(:opportunity).permit(
        :contact_id, :company_id, :description,
        :email, :phone, :cnpj, :company_name,
        opportunity_products_attributes: [
          :id, :product_id, :quantity, :discount, :subtotal_price, :_destroy
        ]
      )
    end
end