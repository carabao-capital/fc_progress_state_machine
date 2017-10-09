module FcProgressStateMachine
  class GraphsController < ApplicationController
    def show
      graph = Graph.find(params[:id])

      render json: {
        states: graph.states,
      }
    end
  end
end
