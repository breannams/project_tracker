class Project < ApplicationRecord
    has_many :entries
    has_many :project_categories
    
    has_many :categories, trhough: :project_categories
    has_many :users, through: :entries
end
