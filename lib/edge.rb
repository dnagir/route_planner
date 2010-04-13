# Author:: Dmitriy Nagirnyak (Dmytrii Nagirniak), dnagir@gmail.com, http://dnagir.blogspot.com

module RoutePlanner
  
  # Represents an edge in the oriented graph
  class Edge
    attr_reader :source, :destination
    attr_reader :weight
    private_class_method :new # use link_nodes instead
    
    
    # Initialises the graph with the list of its nodes
    def initialize(src, dst, weight)
      @source, @destination, @weight = src, dst, weight
      src.edges << self # Add this edge to the source
    end
    
    def self.link_nodes(src, dst, weight)
      new(src, dst, weight)
    end
        
  end

end
