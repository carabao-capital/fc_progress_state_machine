module FcProgressStateMachine
  class Tracker < ActiveRecord::Base
    belongs_to :lead
    belongs_to :graph
    belongs_to :state

    has_many :transition_logs

    after_commit :create_transition_log

    private

    def create_transition_log
      transition_logs.create({
        state_short_name: state.short_name,
        transitioned_at: updated_at
      })
    end
  end
end
