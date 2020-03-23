class ReturnsController < ApplicationController
  before_action :set_return, only: [:edit, :update, :destroy]

  # GET /returns
  def index
    @returns = Return.all
  end

  def new
    @return = current_user.returns.new
    @return.order_numb = $order_numb
    order_parts = Orditem.where(order_numb: $order_numb)
    order_parts.each do |i|
      @return.return_parts.build part_code: i.part_code, part_desc: i.part_desc, uom: i.uom, order_qty: i.qty
    end
  end

  # GET /returns/1/edit
  def edit
  end

  # POST /returns
  def create
    @return = current_user.returns.new(return_params)

    respond_to do |format|
      if @return.save
        @return.return_parts.each do |p|
          ordhead = Ordhead.find_by order_numb: @return.order_numb
          invitem = Invitem.find_by order_numb: @return.order_numb, part_code: p.part_code
          c = Complaint.new
          c.user = current_user.email
          c.part = p.part_code
          c.part_count = p.qty
          if ordhead
            c.issue = ordhead.return_reason
          end
          c.issue_date = p.created_at
          c.order = @return.order_numb
          c.status = 'ACTIVE'
          if invitem
            c.lot = invitem.lot
            c.invoice = invitem.invoice_numb
          end
          c.save
        end
        format.html { redirect_to action: "search", notice: 'RA was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /returns/1
  def update
    respond_to do |format|
      if @return.update(return_params)
        @return.return_parts.each do |p|
          ordhead = Ordhead.find_by order_numb: @return.order_numb
          invitem = Invitem.find_by order_numb: @return.order_numb, part_code: p.part_code
          c = Complaint.new
          c.user = current_user.email
          c.part = p.part_code
          c.part_count = p.qty
          if ordhead
            c.issue = ordhead.return_reason
          end
          c.issue_date = p.created_at
          c.order = @return.order_numb
          c.status = 'ACTIVE'
          if invitem
            c.lot = invitem.lot
            c.invoice = invitem.invoice_numb
          end
          c.save
        end
        format.html { redirect_to action: "search", notice: 'Return was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /returns/1
  def destroy
    @return.destroy
    respond_to do |format|
      format.html { redirect_to returns_url, notice: 'Return was successfully deleted.' }
    end
  end

  def find
    $order_numb = params[:order_numb]
    @return = Return.find_by order_numb: params[:order_numb]
    if @return
      redirect_to edit_return_path(@return)
    else
      order_parts = Orditem.where(order_numb: params[:order_numb]).take(1)
      if order_parts.length > 0
        redirect_to action: "new"
      else
        # no order found
        redirect_to returns_search_path, notice: 'No records found for this order number.'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_return
      @return = Return.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def return_params
      params.require(:return).permit(:order_numb, :truck,
        return_parts_attributes: [
          :id,
          :part_code,
          :part_desc,
          :uom,
          :order_qty,
          :confirmed,
          :qty,
          :temperature
        ]
      )
    end
end
