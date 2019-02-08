class User < ApplicationRecord
	attr_accessor :remember_token

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

	def User.digest(string)
	    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                                  BCrypt::Engine.cost
	    BCrypt::Password.create(string, cost: cost)
	  end

	  def User.new_token
	    SecureRandom.urlsafe_base64
	  end

		def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

	def authenticated?(remember_token)
		return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

	def forget
		update_attribute(:remember_digest, nil)
	end


end
