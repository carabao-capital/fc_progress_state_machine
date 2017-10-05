require "rails_helper"

module FcProgressStateMachine
  describe Trackable do
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

    it "creates a Tracker on initial states" do
      lead = Lead.create(status: "hot")

      expect(lead.tracker.state.short_name).to eq "v1:or:ho"
    end

    it "creates a Tracker on initial states" do
      lead = Lead.create(status: "hot")
      lead.update_attributes(status: "invalid")

      expect(lead.tracker.state.short_name).to eq "v1:or:iv"
    end
  end
end
