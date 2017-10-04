class CreateFcProgressStateMachineGraphs < ActiveRecord::Migration
  def change
    create_table :fc_progress_state_machine_graphs do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
