class DriversController < ApplicationController

  def import
    Driver.import(params[:file])
    redirect_to root_url, notice: "Driver list imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_params
      params.require(:driver).permit(:badge, :name)
    end
end
