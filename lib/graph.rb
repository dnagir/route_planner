require 'node'
require 'edge'

module RoutePlanner
  
  # Represents directed graph with weights
  class Graph
    attr_reader :nodes
    # Initialises the graph with the list of its nodes
    def initialize(nodes)
      @nodes = nodes
    end
    
  
    # Returns a node from the given graph_info
    # nil if none exists
    def node(name)
      @nodes.find { |n| n.equal?(name) }
    end
    
  
    # Parses the string definition of a graph into its internal structure
    # and creates a new instance of the Graph.
    def self.parse(graph_info)
      nodes = []
      graph_info.scan(/\w\w\d+/).each do |x|
        start = x[0,1]
        finish = x[1,1]
        weight = x[2..-1].to_i
        # Create the nodes if ones do not exist yet
        start_node  = nodes.find { |n| n.equal?(start) } || Node.new(start)
        finish_node = nodes.find { |n| n.equal?(finish) } || Node.new(finish)
        
        # Add the nodes if they are not there yet
        nodes << start_node unless nodes.include?(start_node)
        nodes << finish_node unless nodes.include?(finish_node)
        
        # Links the 2 nodes via edge
        Edge.link_nodes(start_node, finish_node, weight)
      end
      new(nodes)
    end
  end

end
