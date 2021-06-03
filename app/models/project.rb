class Project < ApplicationRecord
    belongs_to :user
    has_many :entries, dependent: :delete_all
    has_many :project_categories
    
    has_many :categories, through: :project_categories
    has_many :users, through: :entries
    
    validates_presence_of :title, :description

    accepts_nested_attributes_for :categories
    
    def categories_attributes=(attributes)
      attributes.values.each do |category_attr|
        if !category_attr[:name].blank?
        category = Category.find_or_create_by(category_attr) 
        self.categories << category
        end
      end
    end

end
