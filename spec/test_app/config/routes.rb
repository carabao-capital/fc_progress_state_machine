Rails.application.routes.draw do
  mount FcProgressStateMachine::Engine => "/fc_progress_state_machine"
end
