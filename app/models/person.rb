class Person < ApplicationRecord
  include DeviseTokenAuth::Concerns::User

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :email_address
  has_one :employer_address, :class_name => 'Address'

  has_many :personal_addresses, :class_name => 'Address'
  has_many :phone_numbers
  has_many :profiles
  has_many :donations
  has_many :submissions
  has_many :attendances
  has_many :events, through: :attendances
  has_many :answers
  has_many :memberships
  has_many :groups, :through => :memberships
  #validates :given_name, presence: true
  #has_many :memberships
end
