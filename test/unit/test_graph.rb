require 'unit/helper'

class TestGraph < Test::Unit::TestCase
  
  def test_parse_valid_definition_creates_grapth
    assert_not_nil Graph.parse('AB1, BC2')
    assert_not_nil Graph.parse('AB3 BA2')
    assert_not_nil Graph.parse('AB3  ,  BA2')
  end
  
  def test_parse_partially_invalid_definition_ignores_invalid_entries
    assert_equal 3, Graph.parse('AB1, BC2, DE').nodes.length
  end
  
  def test_number_of_nodes
    assert_equal 2, Graph.parse('AB1, BA2').nodes.length
    assert_equal 3, Graph.parse('AB1, BC2').nodes.length
    assert_equal 4, Graph.parse('AB1, BC2 CD3').nodes.length
  end
  
  def test_asking_for_existing_node_should_return_it
    assert_equal 'A', Graph.parse('AB1, BA2').node('A').name
  end
  
  def test_asking_non_existing_node_should_returns_nil
    assert_nil Graph.parse('AB1, BA2').node('Z')
  end
      
end
