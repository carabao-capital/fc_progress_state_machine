module FcProgressStateMachine
  class Graph < ActiveRecord::Base
    has_many :trackers
    has_many :states
    has_many :edges

    has_many :initial_states, -> { initial }, class_name: "State"

    def self.next_states(short_name)
      next_state_short_names = edges.
        where(short_name_a: short_name).
        map(&:short_name_b)

      states.where(short_name: next_state_short_names)
    end
  end
end
