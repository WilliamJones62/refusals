class Driver < ApplicationRecord
  establish_connection "driver".to_sym

    def self.import(file)
      Driver.delete_all
      CSV.foreach(file.path, headers:true) do |row|
        Driver.create! row.to_hash
      end
    end

end
