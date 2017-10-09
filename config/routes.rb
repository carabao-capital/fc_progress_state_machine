FcProgressStateMachine::Engine.routes.draw do
  resources :trackers, only: [:show]
end
