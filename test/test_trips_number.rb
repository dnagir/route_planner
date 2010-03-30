require 'test_helper'

class TestTripsNumber < Test::Unit::TestCase

  def test_trips_c2c_with_3_stops_max
    assert_equal 2, @planner.trips_number('C', 'C', :max_stops => 3)
  end
  
  def test_trips_a2c_with_4_exactly_stops
    assert_equal 3, @planner.trips_number('C', 'C', :min_stops => 4, :max_stops => 4)
  end

  def test_trips_c2c_with_4_exactly_stops
    assert_equal 7, @planner.trips_number('C', 'C', :max_distance => 30)
  end

end
