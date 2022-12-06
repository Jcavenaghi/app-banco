class MainController < ApplicationController
  before_action :authenticate_user!
  def home
    #le otorgo todas las sucursales para que se muestren
    @branch_offices = BranchOffice.all
  end


end
