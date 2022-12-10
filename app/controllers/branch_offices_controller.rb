class BranchOfficesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_branch_office, only: %i[ show edit update destroy ]
  
  # GET /sucursales
  def index
    @branch_offices = BranchOffice.all
  end

  # GET /sucursales/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch_office
      @branch_office = BranchOffice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def branch_office_params
      params.require(:branch_office).permit(:name, :direc, :tel)
    end
end
