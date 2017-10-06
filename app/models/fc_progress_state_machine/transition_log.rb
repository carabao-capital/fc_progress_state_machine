module FcProgressStateMachine
  class TransitionLog < ActiveRecord::Base
    belongs_to :tracker
  end
end
