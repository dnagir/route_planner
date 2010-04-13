# Author:: Dmitriy Nagirnyak (Dmytrii Nagirniak), dnagir@gmail.com, http://dnagir.blogspot.com
require 'tasks/task'

module RoutePlanner::Tasks

  # Determines the number of possible trips between two points (towns)
  # Returns 0 if no routes found.
  # Available options are: min_stops, max_stops, max_distance
  class CountRoutesTask < Task 
    def initialize(graph, start, finish, min_stops = 1, max_stops = 9999999999, max_distance = 9999999999)
      @graph, @start, @finish = graph, start, finish
      @min_stops, @max_stops, @max_distance = min_stops.to_i, max_stops.to_i, max_distance.to_i
    end
    
    def calculate
      total = 0      
      navigate_graph(@start) { total += 1}
      total
    end

    private

    # Traverses the whole graph unitl restriction for maximum stops or distance is reached.
    # Provides feedback via block when the passing through 'finish' point.
    def navigate_graph(start, stats = {:distance => 0, :stops => 0}, &callback)
      # lower bound is used to know of the 'finish' point should be counted or not
      # upper bound is used to know if the exploration should continue or not
      lower_bound_ok = stats[:stops] >= @min_stops
      upper_bound_ok = stats[:distance] <= @max_distance && stats[:stops] <= @max_stops
      
      callback.call if start == @finish && lower_bound_ok && upper_bound_ok
      if upper_bound_ok
        @graph.node(start).edges.each do |edge|
          inner_stats = {:distance => stats[:distance] + edge.weight, :stops => stats[:stops] + 1}
          # Continuew navigation the graph from the destination of the current edge
          navigate_graph(edge.destination.name, inner_stats,  &callback)
        end
      end
    end
    
  end
  
end
