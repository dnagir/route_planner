# Author:: Dmitriy Nagirnyak (Dmytrii Nagirniak), dnagir@gmail.com, http://dnagir.blogspot.com
# Copyright:: Copyright (c) 2010 by dnagir@gmail.com
# License:: MIT, GPL, LGPL


# The class provides information about the routes.
class RoutePlanner

  # The input is a graph represented as a string
  # * route between 2 towns is defined as 2 letters with a number representing the distance
  # * all routes are separated by comma and optional space
  # Example: AB5, BC1,CA3
  def initialize(graph_info)
    
  end
  
  # Determines the distance between two points (towns).
  # Returns nil if no route is available.
  def distance(path)
    
  end
  
  # Determines the number of possible trips between two points (towns)
  # Returns nil of no route is available.
  # Available hash options are: min_stops, max_stops, max_distance
  def trips_number(start, finish, opts = {:min_stops => 1})
    
  end
  
  # Determines the shortest distance between two points (towns).
  # Returns nil if no route is available.
  def shortest_distance(start, finish)
    
  end
end
