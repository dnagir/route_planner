require 'test/unit'
require 'route_planner'

class Test::Unit::TestCase
  def setup
    @planner = RoutePlanner.new('AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7')
  end
end
