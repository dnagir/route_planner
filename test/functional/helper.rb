require 'test/unit'
require 'route_planner'
require 'graph'
require 'tasks/distance'
require 'tasks/shortest_distance'

class Test::Unit::TestCase

  MainGraph = 'AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7' # The provided graph for tests
  CircleGraph = 'AB10, BC10, CD10, DA10' # 4 towns connected in a roundabout-like way
  
  def trips_number(start, finish, opts, graph = MainGraph)
    RoutePlanner::RoutePlanner.new(graph).trips_number(start, finish, opts)
  end
  
  def distance(route, graph = MainGraph)
    RoutePlanner::Tasks::DistanceTask.new(RoutePlanner::Graph.parse(graph), route).calculate
  end
  
  def distance_format(route, graph = MainGraph)
    RoutePlanner::Tasks::DistanceTask.new(RoutePlanner::Graph.parse(graph), route).format_result
  end

  
  def shortest(start, finish, graph = MainGraph)
    RoutePlanner::Tasks::ShortestDistanceTask.new(RoutePlanner::Graph.parse(graph), start, finish).calculate
  end

end
