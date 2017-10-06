class CreateFcProgressStateMachineTransitionLogs < ActiveRecord::Migration
  def change
    create_table :fc_progress_state_machine_transition_logs do |t|
      t.integer :tracker_id
      t.string :state_short_name
      t.datetime :transitioned_at

      t.timestamps null: false
    end
  end
end
