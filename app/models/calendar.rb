class Calendar < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :events

  accepts_nested_attributes_for :events
  attr_accessible :events_attributes
end
