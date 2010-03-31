require 'helper'

class TestDistance < Test::Unit::TestCase

  def test_distance_a_b_c
    assert_equal 9, distance('ABC')
  end
  
  def test_distance_a_d
    assert_equal 5, distance('AD')
  end

  def test_distance_a_d_c
    assert_equal 13, distance('ADC')
  end
  
  def test_distance_a_e_b_c_d
    assert_equal 22, distance('AEBCD')
  end
  
  def test_distance_a_e_d
    assert_nil distance('AED')
  end
  
  def test_circle_abcda
    assert_equal 40, distance('ABCDA', CircleGraph)
  end
  
  def test_circle_dcbad
    assert_nil nil, distance('DCBAD', CircleGraph)
  end
  
end
