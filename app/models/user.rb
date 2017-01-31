class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
         # use other modules if needed
         # :recoverable, :rememberable, :trackable

  # validations
  validates :first_name, presence: true
  validates :street, presence: true
  validates :country, presence: true
  validates :zip_code, presence: true
end
