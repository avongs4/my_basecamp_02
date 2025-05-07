class AddCreatorToProjects < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :creator_id, :integer
  end
end
