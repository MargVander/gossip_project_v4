class JoinTableUserPrivateMessage < ApplicationRecord
	belongs_to :recipient, class_name: "User"
	belongs_to :private_message
end
