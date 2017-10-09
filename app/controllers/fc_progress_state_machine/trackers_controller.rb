module FcProgressStateMachine
  class TrackersController < ApplicationController
    def show
      tracker = Tracker.find(params[:id])
      state = tracker.state

      render json: {
        graph_version: tracker.graph.version,
        lead_id: tracker.lead.id,
        current_state: state,
        next_states: state.next_states,
      }
    end
  end
end
