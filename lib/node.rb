# Author:: Dmitriy Nagirnyak (Dmytrii Nagirniak), dnagir@gmail.com, http://dnagir.blogspot.com

module RoutePlanner
  
  # Represents a node in the oriented graph
  class Node
    attr_reader :name, :edges
    # Initialises the graph with the list of its nodes
    def initialize(name)
      @name = name
      @edges = []
    end
    
    def self.equal?(a, b)
      a = a.name if a.respond_to?(:name)
      b = b.name if b.respond_to?(:name)
      a == b
    end
    
    def equal?(other)
      Node.equal?(self.name, other)
    end
    
    def edge_to(node_name)
      @edges.find { |e| e.destination.equal?(node_name) }
    end
    
    def node_to(node_name)
      e = edge_to(node_name)
      e ? e.destination : nil
    end
    
  end

end
