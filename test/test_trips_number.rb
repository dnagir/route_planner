require 'helper'

class TestTripsNumber < Test::Unit::TestCase

  def test_c2c_with_3_stops_max
    assert_equal 2, trips_number('C', 'C', :max_stops => 3)
  end
  
  def test_a2c_with_exactly_4_stops
    assert_equal 3, trips_number('A', 'C', :min_stops => 4, :max_stops => 4)
  end

  def test_c2c_with_distance_less_than_30
    assert_equal 7, trips_number('C', 'C', :max_distance => 29)
  end
  
  def test_c2d_with_distance_less_than_3
    assert_equal 0, trips_number('A', 'D', :max_distance => 2)
  end
  
  def test_e2a_with_long_enough_max_distance
    assert_equal 0, trips_number('E', 'A', :max_distance => 40)
  end
  
  def test_a2b_with_1_stop
    assert_equal 1, trips_number('A', 'B', :max_stops => 1, :min_stops => 1)
  end
  
  def test_a2b_with_2_stop_and_not_long_enough_disatance_limit
    assert_equal 0, trips_number('A', 'B', :max_stops => 2, :min_stops => 2, :max_distance => 9)
  end
  
  def test_circle_a2a_2_times_around
    assert_equal 2, trips_number('A', 'A', { :max_stops => 8 }, CircleGraph)
  end
  
  def test_circle_a2d_around
    assert_equal 2, trips_number('A', 'D', { :max_distance => 70 }, CircleGraph)
  end
  
  def test_circle_a2d_non_reachable
    assert_equal 0, trips_number('A', 'D', {:max_stops => 2, :max_distance => 999 }, CircleGraph)
  end

end
