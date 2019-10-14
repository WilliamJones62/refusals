class HomeController < ApplicationController
  def show
  end

  def selected
    t = Truck.find_by truck_number: params[:truck]
    if t.blank?
      redirect_to action: "show", notice: 'Truck does not exist.'
    else
      cookies[:truck] = params[:truck]
      redirect_to action: "show"
    end
  end

end
