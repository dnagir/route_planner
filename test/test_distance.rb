require 'test_helper'

class TestDistance < Test::Unit::TestCase

  def test_distance_a_b_c
    assert_equal 9, @planner.distance('ABC')
  end
  
  def test_distance_a_d
    assert_equal 5, @planner.distance('AD')
  end

  def test_distance_a_d_c
    assert_equal 13, @planner.distance('ADC')
  end
  
  def test_distance_a_e_b_c_d
    assert_equal 22, @planner.distance('AEBCD')
  end
  
  def test_distance_a_e_d
    assert_nil @planner.distance('AED')
  end
end
