require 'unit/helper'
require 'tasks/count_routes.rb'
require 'tasks/distance.rb'
require 'tasks/shortest.rb'


class TestTask < Test::Unit::TestCase
  def setup
    @graph = Graph.parse('AB1 BC2')
  end

  def test_create_distance_task_by_name
    assert_same RoutePlanner::Tasks::DistanceTask, create('Distance', [@graph, 'ABC']).class
  end
  
  def test_create_shortest_distance_task_by_name
    assert_same RoutePlanner::Tasks::ShortestTask, create('ShoRteSt', [@graph, 'A', 'C']).class
  end
  
  def test_create_count_routes_task_by_name
    assert_same RoutePlanner::Tasks::CountRoutesTask, create('CouNt_RouTes', [@graph, 'A', 'C', '1', '5', '22']).class
  end
  
  def test_create_invalid_task_should_return_nil
    assert_nil create('Wrong_Task_Here', [])
  end
  
  
  private
  
  def create(name, params)
    RoutePlanner::Tasks::Task.create(name, params)
  end
end
