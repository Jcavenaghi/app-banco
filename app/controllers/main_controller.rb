class MainController < ApplicationController
  def home
    #le otorgo todas las sucursales para que se muestren
    @branch_offices = BranchOffice.all
  end


end
