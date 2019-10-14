class ReturnPart < ApplicationRecord
  belongs_to :return, :foreign_key => "return_id"
  validate :qty_temp
  validate :temp_qty

  def qty_temp
    if !qty.blank? && temperature.blank?
      errors.add(:temperature, "cannot be blank.")
    end
  end

  def temp_qty
    if qty.blank? && !temperature.blank?
      errors.add(:qty, "required.")
    end
  end
end
