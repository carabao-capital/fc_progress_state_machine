class CreateFcProgressStateMachineEdges < ActiveRecord::Migration
  def change
    create_table :fc_progress_state_machine_edges do |t|
      t.integer :a
      t.integer :b
      t.float :score

      t.timestamps null: false
    end
  end
end
