class User < ApplicationRecord
	belongs_to :city, optional: true
	has_many :likes
	has_many :gossips
	has_many :comments
	has_many :sent_messages, foreign_key: 'sender_id', class_name: 'PrivateMessage'
	has_many :received_message, foreign_key: 'recipient_id', class_name: 'PrivateMessage', through: :join_table_user_private_messages
	validates :first_name,
    presence: true
		validates :last_name,
    presence: true
	has_secure_password


end
