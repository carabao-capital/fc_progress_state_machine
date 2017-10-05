module FcProgressStateMachine
  class State < ActiveRecord::Base
    belongs_to :graph
    has_many :edges, primary_key: :short_name, foreign_key: :short_name_a
    has_many :next_states, through: :edges, class_name: "State"

    scope :initial, -> do
      where(is_initial: true)
    end
  end
end
