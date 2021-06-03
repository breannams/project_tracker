class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many_attached :images
  validates_presence_of :notes
end
