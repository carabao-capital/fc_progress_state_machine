module FcProgressStateMachine
  module Trackable
    class << self
      def included(klass)
        klass.class_eval do
          extend ClassMethods
          after_commit :change_state

          def change_state
            if self.class == Lead

              # Assumption: if tracker == nil,
              # it must be in the initial state

              unless tracker
                # All new Trackers must be based
                # on the latest version of the
                # state machine
                graph = Graph.last

                initial_states = graph.initial_states
                initial_states.each do |is|
                  if eval(is.condition)
                    Tracker.create({
                      lead: self,
                      graph: graph,
                      state: is,
                    })
                  end
                end
              else
                next_states = tracker.state.next_states

                next_states.each do |ns|
                  if eval(ns.condition)
                    tracker.update_attributes({
                      state: ns,
                    })
                  end
                end
              end
            else
              # something
            end
          end
        end
      end

    end

    module ClassMethods
      extend ClassMethods

    end
  end
end
