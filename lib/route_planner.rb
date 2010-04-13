# Author:: Dmitriy Nagirnyak (Dmytrii Nagirniak), dnagir@gmail.com, http://dnagir.blogspot.com

module RoutePlanner
  # The class provides information about the routes.
  class RoutePlanner
    Infinity = 1.0 / 0

    # The input is a graph represented as a string
    # * route between 2 towns is defined as 2 letters ending with a number representing the distance
    # * all routes are separated by comma and optional space
    # Example: AB5, BC1,CA3
    def initialize(graph_info)
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
    # Returns 0 if no routes found.
    # Available hash options are: min_stops, max_stops, max_distance
    # IMPORTANT: At least one of max_stops, max_distance MUST be provided
    #   with values in a valid range of a graph.
    def trips_number(start, finish, opts = { })
      # TODO: Abuse protection
      #   make sure max limits are not bigger than they possibly can be,
      #   otherwise the recursion will never stop
      opts = { :min_stops => 1, :max_stops => Infinity, :max_distance => Infinity }.merge(opts)
      total = 0
      explore_paths(start, finish, opts) { total += 1}
      total
    end
    
    # Determines the shortest distance between two points (towns).
    # Returns nil if no route available.
    def shortest_distance(start, finish)
      all_nodes = @graph.each.map { |k,v| [k, v.keys] }.flatten.uniq
      dist = { }
      all_nodes.each { |x| dist[x] = Infinity }
      dist[start] = 0
      if start == finish then
        # The trick for the 'funny' requirement #9: travelling to the same town you should leave it.
        all_nodes.delete(start)
        dist[start] = Infinity
        @graph[start].each { |nxt, how_far| dist[nxt] = how_far }
      end
          
      while not all_nodes.empty? do
        min_node = all_nodes.min { |a,b| dist[a] <=> dist[b] }
        if !min_node || min_node == Infinity
          return nil # remaining vertices are inaccessible from source
        end
        all_nodes.delete(min_node)
        
        @graph[min_node].each_key do |v|
          alt = dist[min_node] + (@graph[min_node][v] || Infinity)
          dist[v] = alt if dist[v] && alt < dist[v]
        end
      end
      return nil if dist[finish] == Infinity
      dist[finish]
    end
    
    private

    # Traverses the whole graph unitl restriction for maximum stops or distance is reached.
    # Provides feedback via block when the passing through 'finish' point.
    def explore_paths(start, finish, opts, stats = {:distance => 0, :stops => 0}, &callback)
      lower_bound_ok = stats[:stops] >= opts[:min_stops]
      upper_bound_ok = stats[:distance] <= opts[:max_distance] && stats[:stops] <= opts[:max_stops]
      
      callback.call(stats[:path]) if start == finish && lower_bound_ok && upper_bound_ok
      # Recursion basis: stop exploration when reached upper-bound restrictions
      if upper_bound_ok    
        @graph[start].each do |nxt, dist|
          inner_stats = {:distance => stats[:distance] + dist, :stops => stats[:stops] + 1}
          explore_paths(nxt, finish, opts, inner_stats, &callback)
        end
      end
    end

  end
  
  
end
