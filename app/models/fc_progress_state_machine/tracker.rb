module FcProgressStateMachine
  class Tracker < ActiveRecord::Base
    belongs_to :lead
    belongs_to :graph
    belongs_to :state
  end
end
