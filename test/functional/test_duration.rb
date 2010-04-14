require 'functional/helper'

class TestDuration < Test::Unit::TestCase
  def test_duration_of_abc_should_be_equal_to_11
    assert_equal 11, duration('ABC')
  end
  
  def test_duration_of_ad_should_be_equal_to_5
    assert_equal 5, duration('AD')
  end
  
  def test_duration_of_aebcd_should_be_equal_to_28
    assert_equal 28, duration('AEBCD')
  end

end
