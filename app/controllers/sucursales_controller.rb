class SucursalesController < ApplicationController
  before_action :set_sucursale, only: %i[ show edit update destroy ]
  
  # GET /sucursales
  def index
    @sucursales = Sucursale.all
  end

  # GET /sucursales/1
  def show
  end

  # GET /sucursales/new
  def new
    @sucursale = Sucursale.new
  end

  # GET /sucursales/1/edit
  def edit
  end

  # POST /sucursales
  def create
    @sucursale = Sucursale.new(sucursale_params)

    if @sucursale.save
      redirect_to @sucursale, notice: "Sucursale was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sucursales/1
  def update
    if @sucursale.update(sucursale_params)
      redirect_to @sucursale, notice: "Sucursale was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /sucursales/1
  def destroy
    @sucursale.destroy
    redirect_to sucursales_url, notice: "Sucursale was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sucursale
      @sucursale = Sucursale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sucursale_params
      params.require(:sucursale).permit(:name, :direc, :tel)
    end
end
