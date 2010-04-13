module RoutePlanner
  
  # Represents an edge in the oriented graph
  class Edge
    attr_reader :source, :destination
    attr_reader :weight
    private_class_method :new
    
    
    # Initialises the graph with the list of its nodes
    def initialize(src, dst, weight)
      @source, @destination, @weight = src, dst, weight
      src.edges << self
    end
    
    def self.link_nodes(src, dst, weight)
      new(src, dst, weight)
    end
        
  end

end
