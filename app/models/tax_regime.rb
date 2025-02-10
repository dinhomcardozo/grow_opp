class TaxRegimesController < ApplicationController
    before_action :set_tax_regime, only: [:show, :edit, :update, :destroy]
  
    def index
      @tax_regimes = TaxRegime.all
    end
  
    def show
    end
  
    def new
      @tax_regime = TaxRegime.new
    end
  
    def create
      @tax_regime = TaxRegime.new(tax_regime_params)
      if @tax_regime.save
        redirect_to @tax_regime, notice: 'Tax regime was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @tax_regime.update(tax_regime_params)
        redirect_to @tax_regime, notice: 'Tax regime was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @tax_regime.destroy
      redirect_to tax_regimes_url, notice: 'Tax regime was successfully destroyed.'
    end
  
    private
  
    def set_tax_regime
      @tax_regime = TaxRegime.find(params[:id])
    end
  
    def tax_regime_params
      params.require(:tax_regime).permit(:tax_regime_name, :status)
    end
  end