class Refusal < ApplicationRecord
  belongs_to :user, :foreign_key => "user_id"
  has_many :parts, inverse_of: :refusal, :dependent => :destroy
  accepts_nested_attributes_for :parts
end
