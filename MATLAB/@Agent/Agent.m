classdef Agent < handle
    properties (SetAccess = private)
        behavior_;
        attitude_;
        
        incident_ = 0;
    end
    
    properties (GetAccess = private)
        neighbor_list_;
    end
    
    methods
        function obj = Agent(behavior, attitude)
            if nargin > 0
                obj.behavior_ = behavior;
                obj.attitude_ = attitude;
            end
        end
        
        function [] = AddNeighbor(obj, agent, dist)
            new_neighbor.agent_ = agent;
            new_neighbor.dist_ = dist;
            
            obj.neighbor_list_ = [obj.neighbor_list_, new_neighbor];
        end
        
        % Step the agent by a specified step size (in days).
        function [] = Update(obj, size)
%             obj.behavior_ = obj.behavior_ + 0.01;
            
            obj.incident_ = 0;
            if (rand < (size * obj.behavior_ / 365))
                obj.incident_ = 1;
            end
        end
    end
    
end % Agent class.