require 'test/unit'
require 'graph'
require 'tasks/distance'
require 'tasks/shortest'
require 'tasks/count_routes'

class Test::Unit::TestCase

  MainGraph = 'AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7' # The provided graph for tests
  CircleGraph = 'AB10, BC10, CD10, DA10' # 4 towns connected in a roundabout-like way
  
  Tasks = RoutePlanner::Tasks
  Graph = RoutePlanner::Graph
  
  def trips_number(start, finish, opts = { }, graph = MainGraph)  
    create_count_routes_task(start, finish, opts, graph).calculate
  end
  
  def trips_number_format(start, finish, opts = { }, graph = MainGraph)  
    create_count_routes_task(start, finish, opts, graph).format_result
  end


  
  def distance(route, graph = MainGraph)
    Tasks::DistanceTask.new(Graph.parse(graph), route).calculate
  end
  
  def distance_format(route, graph = MainGraph)
    Tasks::DistanceTask.new(Graph.parse(graph), route).format_result
  end


  
  def shortest(start, finish, graph = MainGraph)
    Tasks::ShortestTask.new(Graph.parse(graph), start, finish).calculate
  end
  
  def shortest_format(start, finish, graph = MainGraph)
    Tasks::ShortestTask.new(Graph.parse(graph), start, finish).format_result
  end

  
  private
  
  def create_count_routes_task(start, finish, opts, graph)
    min_stops = opts[:min_stops] || 1
    max_stops = opts[:max_stops] || 999999
    max_distance = opts[:max_distance] || 99999
    Tasks::CountRoutesTask.new(Graph.parse(graph), start, finish, min_stops, max_stops, max_distance)
  end

end
