# Author:: Dmitriy Nagirnyak (Dmytrii Nagirniak), dnagir@gmail.com, http://dnagir.blogspot.com
# Copyright:: Copyright (c) 2010 by dnagir@gmail.com
# License:: MIT, GPL, LGPL


# The class provides information about the routes.
class RoutePlanner
  MaxDistance = 999999999 # Or maybe just use Infinity

  # The input is a graph represented as a string
  # * route between 2 towns is defined as 2 letters with a number representing the distance
  # * all routes are separated by comma and optional space
  # Example: AB5, BC1,CA3
  def initialize(graph_info)
    # Build the graph as a matrix
    @graph = { }
    graph_info.scan(/\w\w\d+/).each do |x|
      start = x[0,1]
      finish = x[1,1]
      @graph[start] ||= { }
      @graph[start][finish] = x[2..-1].to_i
    end    
  end
  
  # Determines the distance between two points (towns).
  # Returns nil if no route is available.
  def distance(path)
    dist = 0
    path.each_char.map.inject do |prev, cur|
      return nil unless @graph[prev][cur]
      dist += @graph[prev][cur]
      cur
    end
    dist
  end
  
  # Determines the number of possible trips between two points (towns)
  # Returns nil of no route is available.
  # Available hash options are: min_stops, max_stops, max_distance
  def trips_number(start, finish, opts = {:min_stops => 1, :max_stops => 9999999, :max_distance => MaxDistance})
  end
  
  # Determines the shortest distance between two points (towns).
  # Returns nil if no route is available.
  def shortest_distance(start, finish)
    # Using Dijkstra's algorithm
    all_nodes = @graph.each.map { |k,v| [k, v.keys] }.flatten.uniq
    dist = { }
    all_nodes.each { |x| dist[x] = MaxDistance }
    dist[start] = 0
    if start == finish then
      # The trick for the 'funny' requirement #9: travelling to the same town you should leave it.
      all_nodes.delete(start)
      dist[start] = MaxDistance
      @graph[start].each { |nxt, how_far| dist[nxt] = how_far }
    end
        
    while not all_nodes.empty? do
      min_node = all_nodes.min { |a,b| dist[a] <=> dist[b] }
      if !min_node || min_node == MaxDistance
        return nil # remaining vertices are inaccessible from source
      end
      all_nodes.delete(min_node)
      
      @graph[min_node].each_key do |v|
        alt = dist[min_node] + edge(min_node, v)
        dist[v] = alt if dist[v] && alt < dist[v]
      end
    end
    return nil if dist[finish] == MaxDistance
    dist[finish]
  end
  
  private
  
  # Returns the distance between src and dst.
  # Zero if none exists in the graph
  def edge(src, dst)    
    @graph[src][dst] || MaxDistance
  end
  
end
