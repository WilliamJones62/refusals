class Truck < ApplicationRecord
  establish_connection "production".to_sym
end
