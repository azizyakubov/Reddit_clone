class Channel < ApplicationRecord
  has_many :discussions

  # Basically creates a JOIN table to find users through discussions without having an actual user_id field in the Channels table.
  # Check the schema for reference
  has_many :users, through: :discussions
  resourcify
end
