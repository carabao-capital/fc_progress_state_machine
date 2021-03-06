require 'rails_helper'

module FcProgressStateMachine
  describe StatesController, :type => :controller do
    routes { FcProgressStateMachine::Engine.routes }

    before(:each) do
      graph = Graph.create(name: "default", version: 1)

      State.create({
        graph: graph,
        name: "new",
        short_name: "v1:or:nw",
        description: "new lead",
        condition: "self.class == Lead && self.status == 'new'",
        is_initial: true
      })

      State.create({
        graph: graph,
        name: "hot",
        short_name: "v1:or:ho",
        description: "hot lead",
        condition: "self.class == Lead && self.status == 'hot'",
        is_initial: true
      })

      State.create({
        graph: graph,
        name: "invalid",
        short_name: "v1:or:iv",
        description: "invalid lead",
        condition: "self.class == Lead && self.status == 'invalid'",
      })

      Edge.create({
        graph: graph,
        short_name_a: "v1:or:nw",
        short_name_b: "v1:or:iv"
      })

      Edge.create({
        graph: graph,
        short_name_a: "v1:or:ho",
        short_name_b: "v1:or:iv"
      })
    end

    let(:expected_response) do
      {
        state: State.first,
        next_states: State.first.next_states,
      }
    end

    describe "show" do
      specify  do
        get :show, {id: State.first.short_name}

        expect(response.body).to eq(expected_response.to_json)
      end
    end

  end
end
