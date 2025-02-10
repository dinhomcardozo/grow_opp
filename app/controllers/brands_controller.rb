class BrandsController < ApplicationController
    before_action :set_brand, only: [:edit, :update, :destroy]

    def index
      @brands = Brand.all
    end
  
    def new
      @brand = Brand.new
      @clients = Client.all # Carrega todos os clientes para a caixa de seleção
    end
  
    def create
      @brand = Brand.new(brand_params)
      if @brand.save
        redirect_to brands_path, notice: 'Marca criada com sucesso.'
      else
        @clients = Client.all # Re-carrega os clientes em caso de erro
        render :new
      end
    end
  
    def edit
      @clients = Client.all # Carrega todos os clientes para a caixa de seleção
    end
  
    def update
      if @brand.update(brand_params)
        redirect_to brands_path, notice: 'Marca atualizada com sucesso.'
      else
        @clients = Client.all # Re-carrega os clientes em caso de erro
        render :edit
      end
    end
  
    def destroy
      @brand.destroy
      redirect_to brands_path, notice: 'Marca excluída com sucesso.'
    end
  
    private
  
    def set_brand
      @brand = Brand.find(params[:id])
    end
  
    def brand_params
      params.require(:brand).permit(:name, :status, :client_id)
    end
end