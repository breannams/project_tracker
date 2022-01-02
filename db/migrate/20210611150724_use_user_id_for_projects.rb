class UseUserIdForProjects < ActiveRecord::Migration[6.1]
  def change
    change_table :projects do |t|
      t.remove :creator
      t.remove :collaborator
      t.belongs_to :user
    end
  end
end
