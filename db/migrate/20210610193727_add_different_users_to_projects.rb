class AddDifferentUsersToProjects < ActiveRecord::Migration[6.1]
  def change
    change_table :projects do |t|
    t.remove :user_id
    t.references :creator
    t.references :collaborator
    end
  end
end
