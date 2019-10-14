class Part < ApplicationRecord
  self.table_name = "refusal_parts"
  belongs_to :refusal, :foreign_key => "refusal_id"
  validate :qty_reason
  validate :reason_qty

  def qty_reason
    if !qty.blank? && reason.blank?
      errors.add(:reason, "cannot be blank.")
    end
  end

  def reason_qty
    if qty.blank? && !reason.blank?
      errors.add(:qty, "required.")
    end
  end

end
