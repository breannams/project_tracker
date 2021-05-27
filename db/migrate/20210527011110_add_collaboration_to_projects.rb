class AddCollaborationToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :collaboration, :boolean, :default => false
  end
end
