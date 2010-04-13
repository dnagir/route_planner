# Author:: Dmitriy Nagirnyak (Dmytrii Nagirniak), dnagir@gmail.com, http://dnagir.blogspot.com

module RoutePlanner::Tasks

  # The task class provides ability to automatically format the result of calculation
  # and acts as a factory for all the tasks
  # Requirements:
  # - implement 'calculate';
  # - initialize MUST accept graph object as the first parameter;
  # - initialize MUST properly parse all other parameters from strings.
  class Task
      
    def format_result
      result = self.calculate
      result ? result.to_s : 'NO SUCH ROUTE'
    end
    
  
    # Creates a task by its name or returns nil if no such task exists.
    # The name of the task corresponds to Ruby class after following changes:
    #  1. Capitalize the name removing underscores prior to that.
    #  2. Append 'Task' to the result of step 1.
    # For example: 'Distance' -> DistanceTask; 'COUNT_ROUTES' -> CountRoutesTask
    def self.create(name, params = [])
      # Normalise the name
      name = name.downcase.split('_').map { |s| s.capitalize }.join + 'Task'
      return nil unless RoutePlanner::Tasks.constants.include?(name)
      
      klass = RoutePlanner::Tasks.const_get(name)
      arguments = params.each_with_index.map { |p, i| "params[#{i}]"}.join(',')
      klass.instance_eval("new(#{arguments})")
    end
    
  end
  
end
