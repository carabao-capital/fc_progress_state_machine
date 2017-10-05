class CreateFcProgressStateMachineTrackers < ActiveRecord::Migration
  def change
    create_table :fc_progress_state_machine_trackers do |t|
      t.integer :lead_id
      t.integer :graph_id
      t.integer :state_id

      t.timestamps null: false
    end
  end
end
