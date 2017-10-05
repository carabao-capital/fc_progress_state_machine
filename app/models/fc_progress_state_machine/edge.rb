module FcProgressStateMachine
  class Edge < ActiveRecord::Base
    belongs_to :graph

    belongs_to :state, {
      primary_key: :short_name,
      foreign_key: :short_name_a,
      class_name: "State"
    }

    has_one :next_state, {
      primary_key: :short_name_b,
      foreign_key: :short_name,
      class_name: "State"
    }
  end
end
