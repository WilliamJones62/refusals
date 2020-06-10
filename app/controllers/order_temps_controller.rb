class OrderTempsController < ApplicationController
  before_action :set_order_temp, only: [:edit, :update, :destroy]
  before_action :build_stops, only: [:list]

  # GET /order_temps
  def index
    @order_temps = Return.all
  end

  def new
    @order_temp = current_user.order_temps.new
    @order_temp.order_numb = $order_numb
  end

  # GET /order_temps/1/edit
  def edit
  end

  # POST /order_temps
  def create
    @order_temp = current_user.order_temps.new(order_temp_params)

    respond_to do |format|
      if @order_temp.save
        format.html { redirect_to action: "search", notice: 'Order temperature was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /order_temps/1
  def update
    respond_to do |format|
      if @order_temp.update(order_temp_params)
        format.html { redirect_to action: "search", notice: 'Order temperature was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /order_temps/1
  def destroy
    @order_temp.destroy
    respond_to do |format|
      format.html { redirect_to order_temps_url, notice: 'Order temperature was successfully deleted.' }
    end
  end

  def find
    $route = params[:route]
    $first_time = true
    redirect_to order_temps_list_path
  end

  def list
  end

  def selected
    i = 1
    loop do
      i += 1
      if i > $length
        break
      end
      temperaturei = 'temperature'+i.to_s
      order_numbi = 'order_numb'+i.to_s
      order_temp = current_user.order_temps.find_by order_numb: params[order_numbi]
      if order_temp
        order_temp.temperature = params[temperaturei]
      else
        order_temp = current_user.order_temps.new(order_numb: params[order_numbi], temperature: params[temperaturei])
      end
      order_temp.save
    end
    redirect_to order_temps_list_path, notice: 'Route tempertures saved.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_temp
      @order_temp = current_user.order_temps.find(params[:id])
    end

    def build_stops
      @stops = []
      stops = Route.where(route_code: $route)
      $length = stops.length
      stops.each do |s|
        temp = current_user.order_temps.find_by(order_numb: s.order_numb)
        if temp
          temperature = temp.temperature
        else
          temperature = nil
        end
        stop_no_i = s.stop_no.to_i
        stop_no = stop_no_i.to_s.rjust(2, "0")
        hash = {order_numb: s.order_numb, shipname: s.shipname, stop_no: stop_no, temperature: temperature}
        @stops.push(hash)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_temp_params
      params.require(:order_temp).permit(:order_numb, :temperature, :route)
    end
end
