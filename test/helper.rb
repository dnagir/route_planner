require 'test/unit'
require 'route_planner'

class Test::Unit::TestCase

  MainGraph = 'AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7' # The provided graph for tests
  CircleGraph = 'AB10 BC10 CD10 DA10' # 4 towns connected in a roundabout-like way
  
  def trips_number(start, finish, opts, graph = MainGraph)
    RoutePlanner.new(graph).trips_number(start, finish, opts)
  end
  
  def distance(route, graph = MainGraph)
    RoutePlanner.new(graph).distance(route)
  end
  
  def shortest(start, finish, graph = MainGraph)
    RoutePlanner.new(graph).shortest_distance(start, finish)
  end

end
