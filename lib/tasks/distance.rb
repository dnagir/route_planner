# Author:: Dmitriy Nagirnyak (Dmytrii Nagirniak), dnagir@gmail.com, http://dnagir.blogspot.com
require 'tasks/task'

module RoutePlanner::Tasks

  # Determines the distance of the provided route.
  # Returns nil if no route is available.
  class DistanceTask < Task
    def initialize(graph, path)
      @graph, @path = graph, path
    end  
    
    def calculate
      start_name = @path[0,1]
      start_node = @graph.node(start_name)
      
      dist = 0
      # Follow the route, excluding the starting node
      @path[1..-1].each_char.map.inject(start_node) do |cur_node, next_name|        
        edge = cur_node.edge_to(next_name)
        return nil unless edge
        dist += edge.weight
        edge.destination # The next node in the route
      end
      dist
    end
  end
  
end
