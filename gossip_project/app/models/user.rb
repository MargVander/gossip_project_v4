class User < ApplicationRecord
	belongs_to :city
	has_many :gossips
	has_many :sent_messages, foreign_key: 'sender_id', class_name: 'PrivateMessage'
	has_many :received_message, foreign_key: 'recipient_id', class_name: 'PrivateMessage', through: :join_table_user_private_messages
	# has_many :comments
	# has_many :likes

end
