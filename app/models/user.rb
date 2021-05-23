class User < ApplicationRecord
    has_many :entries
    has_many :projects, through: :entries
end
