class Project < ApplicationRecord
    has_many :entries
    has_many :categories
    has_many :users, through: :entries
end
