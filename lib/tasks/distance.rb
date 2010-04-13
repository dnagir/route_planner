# Author:: Dmitriy Nagirnyak (Dmytrii Nagirniak), dnagir@gmail.com, http://dnagir.blogspot.com

module RoutePlanner::Tasks

  # Determines the distance between two points (towns).
  # Returns nil if no route is available.
  class DistanceTask
    def initialize(graph, path)
      @graph, @path = graph, path
    end  
    
    def calculate()
      start_name = @path[0,1]
      start_node = @graph.node(start_name)
      
      dist = 0
      @path[1..-1].each_char.map.inject(start_node) do |cur_node, next_name|        
        edge = cur_node.edge_to(next_name)
        return nil unless edge
        dist += edge.weight
        edge.destination
      end
      dist
    end
        
    def format_result
      dist = calculate
      dist ? dist.to_s : 'NO SUCH ROUTE'
    end
  end
  
end
