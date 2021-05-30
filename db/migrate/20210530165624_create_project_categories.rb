class CreateProjectCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :project_categories do |t|
      t.belongs_to :project
      t.belongs_to :category
      t.timestamps
    end
  end
end
