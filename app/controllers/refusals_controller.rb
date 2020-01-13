class RefusalsController < ApplicationController
  before_action :set_refusal, only: [:edit, :update, :destroy]
  before_action :build_reasons, only: [:new, :edit, :create, :update]

  # GET /refusals
  def index
    @refusals = Refusal.all
  end

  # GET /refusals/new
  def new
    @refusal = current_user.refusals.new
    @refusal.invoice_numb = $invoice_numb
    invoice_parts = Invitem.where(invoice_numb: $invoice_numb)
    invoice_parts.each do |i|
      @refusal.parts.build part_code: i.part_code, part_desc: i.part_desc, uom: i.uom, invoice_qty: i.qty
    end
  end

  # GET /refusals/1/edit
  def edit
  end

  # POST /refusals
  def create
    @refusal = current_user.refusals.new(refusal_params)

    respond_to do |format|
      if @refusal.save
        @refusal.parts.each do |p|
          if @quality_issue.include?(p.reason)
            invitem = Invitem.find_by invoice_numb: @refusal.invoice_numb, part_code: p.part_code
            c = Complaint.new
            c.user = current_user.email
            c.part = p.part_code
            c.part_count = p.qty
            c.issue = p.reason
            c.issue_date = p.created_at
            c.invoice = @refusal.invoice_numb
            c.status = 'ACTIVE'
            if invitem
              c.lot = invitem.lot
            end
            c.save
          end
        end
        format.html { redirect_to action: "search", notice: 'Refusal was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /refusals/1
  def update
    respond_to do |format|
      if @refusal.update(refusal_params)
        @refusal.parts.each do |p|
          if @quality_issue.include?(p.reason)
            c = Complaint.find_by user: current_user.email, part: p.part_code, issue_date: p.created_at
            if !c.blank?
              # updating an existing complaint
              c.issue = p.reason
              c.part_count = p.qty
              c.save
            else
              # need to create a new complaint
              invitem = Invitem.find_by invoice_numb: @refusal.invoice_numb, part_code: p.part_code
              c = Complaint.new
              c.user = current_user.email
              c.part = p.part_code
              c.part_count = p.qty
              c.issue = p.reason
              c.issue_date = p.created_at
              c.invoice = @refusal.invoice_numb
              c.status = 'ACTIVE'
              if invitem
                c.lot = invitem.lot
              end
              c.save
            end
          else
            # check if a complaint exists
            c = Complaint.find_by user: current_user.email, part: p.part_code, issue_date: p.created_at
            if !c.blank?
              # this is no longer a quality issue so delete the complaint
              c.delete
            end
          end
        end
        format.html { redirect_to action: "search", notice: 'Refusal was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /refusals/1
  def destroy
    @refusal.destroy
    respond_to do |format|
      format.html { redirect_to refusals_url, notice: 'Refusal was successfully deleted.' }
    end
  end

  def find
    $invoice_numb = params[:invoice_numb]
    @refusal = Refusal.find_by invoice_numb: params[:invoice_numb]
    if @refusal
      redirect_to edit_refusal_path(@refusal)
    else
      invoice_parts = Invitem.where(invoice_numb: params[:invoice_numb]).take(1)
      if invoice_parts.length > 0
        redirect_to action: "new"
      else
        # no invoice found
        redirect_to refusals_search_path, notice: 'No records found for this invoice number.'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_refusal
      @refusal = Refusal.find(params[:id])
    end

    def build_reasons
      @reason = ['BUTCHERING', 'FOREIGN MATERIAL', 'HANDLING', 'LOOSE/BLOWN BAG', 'MISSING', 'PRODUCT SPEC.', 'SHELF LIFE', 'TEMPERATURE', 'WRONG ITEM']
      @quality_issue = ['BUTCHERING', 'FOREIGN MATERIAL', 'HANDLING', 'LOOSE/BLOWN BAG', 'PRODUCT SPEC.', 'SHELF LIFE', 'TEMPERATURE']
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def refusal_params
      params.require(:refusal).permit(:invoice_numb, :truck,
        parts_attributes: [
          :id,
          :part_code,
          :part_desc,
          :uom,
          :invoice_qty,
          :reason,
          :qty
        ]
      )

    end
end
