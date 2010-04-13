require 'unit/helper'

class TestEdge < Test::Unit::TestCase

  def test_edge_has_valid_attributes
    e = Edge.link_nodes(@a, @b, 15)
    assert_equal 15, e.weight
    assert_same @a, e.source
    assert_same @b, e.destination
  end

end
