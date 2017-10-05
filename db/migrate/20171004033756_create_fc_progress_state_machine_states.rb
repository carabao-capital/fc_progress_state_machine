class CreateFcProgressStateMachineStates < ActiveRecord::Migration
  def change
    create_table :fc_progress_state_machine_states do |t|
      t.integer :graph_id
      t.string :name, null: false
      t.string :short_name, null: false
      t.string :description, null: false
      t.string :condition, null: false
      t.boolean :is_initial

      t.timestamps null: false
    end

    add_index :fc_progress_state_machine_states, :short_name,
            name: 'index_fc_progress_state_machine_states_on_short_name',
            unique: true
  end
end
