class Project < ApplicationRecord
    has_many :entries
    belongs_to :category
    has_many :users, through: :entries
end
