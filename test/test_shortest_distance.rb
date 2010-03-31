require 'helper'

class TestShortestDistance < Test::Unit::TestCase

  def test_shortest_a2c
    assert_equal 9, shortest('A', 'C')
  end
  
  def test_shortest_b2b
    assert_equal 9, shortest('B', 'B')
  end



  def test_shortest_a2b
    assert_equal 5, shortest('A', 'B')
  end
  
  def test_shortest_a2a
    assert_nil shortest('A', 'A')
  end
  
  def test_shortest_b2a
    assert_nil shortest('B', 'A')
  end


  def test_shortest_c2c
    assert_equal 9, shortest('C', 'C')
  end
  
    
  private
  
  def shortest(start, finish)
    @planner.shortest_distance(start, finish)
  end
end
