require 'test_helper'

class TestShortestRoute < Test::Unit::TestCase

  def test_shortest_a2c
    assert_equal 9, @planner.shortest_distance('A', 'C')
  end
  
  def test_shortest_b2b
    assert_equal 9, @planner.shortest_distance('B', 'B')
  end

end
