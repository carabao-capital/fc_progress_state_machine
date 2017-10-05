class Lead < ActiveRecord::Base
  include FcProgressStateMachine::Trackable

  has_one :tracker, class_name: "FcProgressStateMachine::Tracker"
end
