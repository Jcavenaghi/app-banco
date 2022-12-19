class DaysController < ApplicationController
  before_action :set_day, only: %i[ show edit update destroy ]
  # GET /days
  def index
    @days = Day.all
  end

  # GET /days/1
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def day_params
      params.require(:day).permit(:day_name)
    end
end
