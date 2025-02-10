class LicensesController < ApplicationController
  before_action :set_license, only: %i[show edit update destroy]

  def index
    @licenses = License.all
  end

  def show
  end

  def new
    @license = License.new
  end

  def create
    @license = License.new(license_params)
    if @license.save
      redirect_to @license, notice: "Licença criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @license.update(license_params)
      redirect_to @license, notice: "Licença atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @license.destroy
    redirect_to licenses_path, notice: "Licença excluída com sucesso."
  end

  private

  def set_license
    @license = License.find(params[:id])
  end

  def license_params
    params.require(:license).permit(:description, :license_years, :license_months, :license_days, :status)
  end
end