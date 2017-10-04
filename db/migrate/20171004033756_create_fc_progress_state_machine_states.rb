class CreateFcProgressStateMachineStates < ActiveRecord::Migration
  def change
    create_table :fc_progress_state_machine_states do |t|
      t.string :name
      t.string :description
      t.string :condition

      t.timestamps null: false
    end
  end
end
