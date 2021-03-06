class Project < ApplicationRecord
  
    has_many :entries, dependent: :delete_all

    


    has_many :project_categories
    has_many :categories, through: :project_categories



    has_many :users, through: :entries
    #has_many :collaborators, through: :entries, class_name: "User" ????
    belongs_to :user
    # belongs_to :creator, class_name: "User"
    # belongs_to :collaborator, class_name: "User" --- probably not this one.






    validates_presence_of :title, :description

    accepts_nested_attributes_for :categories
    
    scope :collaboration, -> { where(collaboration: true)}


    def categories_attributes=(attributes)
      attributes.values.each do |category_attr|
        if !category_attr[:name].blank?
        category = Category.find_or_create_by(category_attr) 
        self.categories << category
        end
      end
    end

end
