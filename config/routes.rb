FcProgressStateMachine::Engine.routes.draw do
  resources :trackers, only: [:show]
  resources :graphs, only: [:show]
  resources :states, only: [:show]
end
