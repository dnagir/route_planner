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
  
  def test_shortest_a2a
    assert_equal nil, shortest('A', 'A')
  end
  
  def test_circle_a2a
    assert_equal 40, shortest('A', 'A', CircleGraph)
  end
  
  def test_circle_b2a
    assert_equal 30, shortest('B', 'A', CircleGraph)
  end

end
