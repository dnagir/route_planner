# Author:: Dmitriy Nagirnyak (Dmytrii Nagirniak), dnagir@gmail.com, http://dnagir.blogspot.com
require 'tasks/task'

module RoutePlanner::Tasks

  # Determines the shortest distance between the two nodes.
  # Returns nil if no route available.
  class ShortestTask < Task
    Infinity = 1.0 / 0
  
    def initialize(graph, start, finish)
      @graph, @start, @finish = graph, start, finish
    end  
    
    # Using Dijkstra's algorithm
    def calculate
      all_nodes = @graph.nodes.map { |n| n.name }
      dist = { } # Store the min distance from the start node to all others and accumulate it here
      all_nodes.each { |x| dist[x] = Infinity } # Initially all nodes are very far away
      dist[@start] = 0 # Current node has the shortest path to itself
      
      if @start == @finish then
        # The trick for the 'funny' requirement #9: travelling to the same town you should leave it.
        # 'start' becomes a normal node and edged nodes are set to the values to start from them
        all_nodes.delete(@start)
        dist[@start] = Infinity
        start_node = @graph.node(@start)
        start_node.edges.each { |edg| dist[edg.destination.name] = edg.weight } if start_node
      end
          
      while not all_nodes.empty? do
        min_node_name = all_nodes.min { |a,b| dist[a] <=> dist[b] }
        return nil unless min_node_name # remaining nodes are inaccessible from source

        all_nodes.delete(min_node_name) # cur node has been marked - no need to use it

        min_node = @graph.node(min_node_name)
        if min_node
          # Find the shorter path from current node to its successors if possible
          min_node.edges.each do |edge|   
            alt = dist[min_node_name] + edge.weight
            next_name = edge.destination.name
            dist[next_name] = alt if dist[next_name] && alt < dist[next_name]
          end
        end
      end
      return nil if dist[@finish] == Infinity
      dist[@finish]
    end
    
  end
  
end
