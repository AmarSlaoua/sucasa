class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company
  has_one :accommodation
  has_many :reviews
  has_many :messages

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :job, presence: true
  validates :seniority, presence: true
  #validation password
end
