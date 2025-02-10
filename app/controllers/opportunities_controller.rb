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
    @opportunity.id = Opportunity.maximum(:id).to_i + 1 #define ID único para opportunity
    @opportunity.opportunity_products.build
  end

  # GET /opportunities/1/edit
  def edit
  end

  # POST /opportunities or /opportunities.json
  def create
    @opportunity = Opportunity.new(opportunity_params)
    if @opportunity.save
      redirect_to @opportunity, notice: "Oportunidade criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /opportunities/1 or /opportunities/1.json
  def update
    if @opportunity.update(opportunity_params)
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
        :contact_id, :company_id, :notes, :total_price,
        opportunity_products_attributes: [:id, :product_id, :quantity, :discount, :subtotal_price]
      )
    end
end
