module FcProgressStateMachine
  class StatesController < ApplicationController
    def show
      state = State.where(short_name: params[:id]).first

      render json: {
        state: state,
        next_states: state.try(:next_states),
      }
    end
  end
end
