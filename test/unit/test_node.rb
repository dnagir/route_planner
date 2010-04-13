require 'unit/helper'

class TestNode < Test::Unit::TestCase

  def test_node_has_valid_attributes
    assert_equal 'A', @a.name
  end
  
  def test_node_has_edges
    e = Edge.link_nodes(@a, @b, 15)
    assert_equal 1, @a.edges.length
    assert_equal 0, @b.edges.length
  end
  
  def test_comparing_same_nodes_should_return_true
    a = Node.new('A')
    assert @a.equal?(a)
    assert @a.equal?('A')
    assert Node.equal?('A', 'A')
  end
  
  def test_comparing_different_nodes_should_return_false
    assert !@a.equal?(@b)
    assert !@a.equal?('B')
    assert !Node.equal?('A', 'B')
  end
  
  def test_get_linked_edge
    e = Edge.link_nodes(@a, @b, 11)
    assert_same e, @a.edge_to('B')
  end
  
  def test_get_linked_node
    e = Edge.link_nodes(@a, @b, 11)
    assert_same e.destination, @a.node_to('B')
  end
        
end
