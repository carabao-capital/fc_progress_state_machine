class CreateFcProgressStateMachineEdges < ActiveRecord::Migration
  def change
    create_table :fc_progress_state_machine_edges do |t|
      t.integer :graph_id
      t.string :short_name_a
      t.string :short_name_b
      t.float :score

      t.timestamps null: false
    end
  end
end
