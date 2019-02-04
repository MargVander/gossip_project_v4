class Tag < ApplicationRecord
	has_many :join_table_gossip_tags
	has_many :gossips, through: :join_table_gossip_tags
end
