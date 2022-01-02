class UserIdForProjects < ActiveRecord::Migration[6.1]
  def change
    
      remove_column :projects, :creator_id, :integer
      remove_column :projects, :collaborator_id, :integer
  
      
  end
end
