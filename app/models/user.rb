class User < ApplicationRecord
  self.table_name = "refusal_return_users"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :refusals
  has_many :returns
end
