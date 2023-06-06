class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company
  accepts_nested_attributes_for :company
  has_one :accommodation
  has_many :reviews
  has_many :messages

  #validation password
end
