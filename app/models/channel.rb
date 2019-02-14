class Channel < ApplicationRecord
  has_many :discussions

  # Basically creates a JOIN table to find users through discussions without having an actual user_id field in the Channels table.
  # Check the schema for reference
  has_many :users, through: :discussions
  resourcify

  extend FriendlyId
  friendly_id :channel, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    channel_changed?
  end
end
