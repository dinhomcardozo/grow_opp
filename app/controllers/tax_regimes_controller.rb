class TaxRegimesController < ApplicationController
  before_action :set_tax_regime, only: %i[ show edit update destroy ]

  # GET /tax_regimes or /tax_regimes.json
  def index
    @tax_regimes = TaxRegime.all
  end

  # GET /tax_regimes/1 or /tax_regimes/1.json
  def show
  end

  # GET /tax_regimes/new
  def new
    @tax_regime = TaxRegime.new
  end

  # GET /tax_regimes/1/edit
  def edit
  end

  # POST /tax_regimes or /tax_regimes.json
  def create
    @tax_regime = TaxRegime.new(tax_regime_params)

    respond_to do |format|
      if @tax_regime.save
        format.html { redirect_to @tax_regime, notice: "Tax regime was successfully created." }
        format.json { render :show, status: :created, location: @tax_regime }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tax_regime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tax_regimes/1 or /tax_regimes/1.json
  def update
    respond_to do |format|
      if @tax_regime.update(tax_regime_params)
        format.html { redirect_to @tax_regime, notice: "Tax regime was successfully updated." }
        format.json { render :show, status: :ok, location: @tax_regime }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tax_regime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tax_regimes/1 or /tax_regimes/1.json
  def destroy
    @tax_regime.destroy!

    respond_to do |format|
      format.html { redirect_to tax_regimes_path, status: :see_other, notice: "Tax regime was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tax_regime
      @tax_regime = TaxRegime.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def tax_regime_params
      params.expect(tax_regime: [ :tax_regime_name, :status ])
    end
end
