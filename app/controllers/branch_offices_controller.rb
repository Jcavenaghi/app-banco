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

  # GET /sucursales/new
  def new
    @branch_office = BranchOffice.new
  end

  # GET /sucursales/1/edit
  def edit
  end

  # POST /sucursales
  def create
    @branch_office = BranchOffice.new(branch_office_params)

    if @branch_office.save
      redirect_to @branch_office, notice: "Sucursal creada correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sucursales/1
  def update
    if @branch_office.update(branch_office_params)
      redirect_to @branch_office, notice: "Sucursal modificada correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /sucursales/1
  def destroy
    @branch_office.destroy
    redirect_to branch_offices_url, notice: "Sucursale was successfully destroyed."
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
