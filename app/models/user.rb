class User < ApplicationRecord
    has_many :entries
    has_many :projects, through: :entries

    has_secure_password
    validates_presence_of :username
    validates_uniqueness_of :username
end
             