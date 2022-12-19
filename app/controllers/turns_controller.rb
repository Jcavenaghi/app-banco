class TurnsController < ApplicationController
  before_action :set_turn, only: %i[ show edit update destroy ]

  # GET /turns
  def index
    @turns = Turn.where(client_user_id: current_user.id)
  end

  # GET /turns/1
  def show
    @turn = Turn.where(client_user_id: current_user.id).find_by(id: params[:id])
  end

  # GET /turns/new
  def new
    @days =  Day.where(branch_office_id: params[:branch_office_id])
    @turn = Turn.new()
  end

  # GET /turns/1/edit
  def edit
  end

  # POST /turns
  def create
    #convierto la fecha del selet en un date y lo paso a numero para saber que día
    #de la semana es.
    year = turn_params["fecha(1i)"].to_i
    month = turn_params["fecha(2i)"].to_i
    day = turn_params["fecha(3i)"].to_i
    hour = turn_params["fecha(4i)"].to_i
    date = DateTime.new(year,month,day)
    date_max =DateTime.new(year,month,day,23,59,59)
    date_day = Date.parse("#{year}-#{month}-#{day}").strftime("%u").to_i
    if ((date_day> 0) && (date_day < 6))
      #si no tiene turno en el día solicitado, se le otorga.
      if (Turn.where(client_user_id: current_user.id).where(fecha: (date..date_max))  == [])
        day_office = Day.where(branch_office_id: turn_params["branch_office_id"].to_i).find_by(day_name: date_day)
        if ((hour >= day_office.begin_turn.hour) && (hour <= day_office.end_turn.hour))
          @turn = Turn.new(turn_params)
          if @turn.save
            redirect_to @turn, notice: "El turno fue creado exitosamente!"
          else
            render :new, status: :unprocessable_entity
          end
        else
          redirect_to root_path, notice: "El horario ingresado no es válido para el día solicitado."
        end
      else
        redirect_to root_path, notice: "Usted ya posee un turno para este día en está sucursal"
      end
    else
      redirect_to root_path, notice: "No se otorgan turnos días no habiles (solo de lunes a viernes)."
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
      params.require(:turn).permit(:fecha, :hour, :reason, :state, :comment, :client_user_id, :staff_user_id, :branch_office_id)
    end
end
