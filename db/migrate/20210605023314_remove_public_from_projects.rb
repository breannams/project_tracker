class RemovePublicFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :public
  end
end
