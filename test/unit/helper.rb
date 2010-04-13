require 'test/unit'
require 'graph'

class Test::Unit::TestCase
  def setup
    @a = Node.new('A')
    @b = Node.new('B')
  end

  Node = RoutePlanner::Node
  Edge = RoutePlanner::Edge
  Graph = RoutePlanner::Graph  
end
