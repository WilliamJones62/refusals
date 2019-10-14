class Return < ApplicationRecord
  belongs_to :user, :foreign_key => "user_id"
  has_many :return_parts, inverse_of: :return, :dependent => :destroy
  accepts_nested_attributes_for :return_parts
end
