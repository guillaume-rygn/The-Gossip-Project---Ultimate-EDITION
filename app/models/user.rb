class User < ApplicationRecord
  belongs_to :city, optional: true
  has_many :gossips

  has_many :private_messages
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"


  has_many :comments
  has_many :likes

  validates :first_name,
  presence: true

  validates :last_name,
  presence: true

  validates :email,
  presence: true,
  uniqueness: true

  #password
  has_secure_password
  validates :password_digest, 
    presence: true, 
    length: { minimum: 6 }
end
