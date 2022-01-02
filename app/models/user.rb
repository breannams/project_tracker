class User < ApplicationRecord
    has_many :entries
    has_many :projects, through: :entries


    has_many :projects
    # has_many :created_projects, foreign_key: "creator_id", class_name: "Project"
    # has_many :collaboration_projects, foreign_key: "collaborator_id", class_name: "Project"






    has_secure_password
    validates_presence_of :username
    validates_uniqueness_of :username
end
             