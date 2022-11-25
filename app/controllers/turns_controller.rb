class TurnsController < ApplicationController
  before_action :set_turn, only: %i[ show edit update destroy ]

  # GET /turns
  def index
    @turns = Turn.all
  end

  # GET /turns/1
  def show
  end

  # GET /turns/new
  def new
    @turn = Turn.new
  end

  # GET /turns/1/edit
  def edit
  end

  # POST /turns
  def create
    @turn = Turn.new(turn_params)

    if @turn.save
      redirect_to @turn, notice: "Turn was successfully created."
    else
      
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /turns/1
  def update
    if @turn.update(turn_params)
      redirect_to @turn, notice: "Turn was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /turns/1
  def destroy
    @turn.destroy
    redirect_to turns_url, notice: "Turn was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turn
      @turn = Turn.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def turn_params
      params.require(:turn).permit(:fecha, :reason, :state, :comment, :client_user_id, :staff_user_id, :sucursale_id)
    end
end
