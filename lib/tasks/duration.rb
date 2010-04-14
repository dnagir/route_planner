# Author:: Dmitriy Nagirnyak (Dmytrii Nagirniak), dnagir@gmail.com, http://dnagir.blogspot.com
require 'tasks/task'

module RoutePlanner::Tasks


  class DurationTask < Task
    def initialize(graph, path)
      @graph, @path = graph, path
    end  
    
    def calculate
      start_name = @path[0,1]
      start_node = @graph.node(start_name)
      
      duration = 0
      # Follow the route, excluding the starting node
      @path[1..-1].each_char.map.inject(start_node) do |cur_node, next_name|        
        edge = cur_node.edge_to(next_name)
        return nil unless edge
        duration += edge.weight
        duration += 2 unless cur_node.equal?(start_name)
        edge.destination # The next node in the route
      end
      duration
    end
  end
  
end
