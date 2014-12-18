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
            obj.behavior_ = obj.behavior_ + (obj.attitude_ * 0.001);
            
            obj.incident_ = 0;
            if (rand < (size * obj.behavior_ / 365.2425))
                obj.incident_ = 1;
                
                obj.attitude_ = (1 - 0.5) * obj.attitude_;
                obj.behavior_ = (1 - ((1 - obj.attitude_) * 0.5)) * obj.behavior_;
            end           
        end
        
        function [] = ApplyNeighborInfluence(obj)
            factor = 1.0;
            
            for i = 1 : length(obj.neighbor_list_)
                if (obj.neighbor_list_(i).agent_.incident_ == 1)
                    
                    dist = obj.neighbor_list_(i).dist_;
                    
                    factor = factor * (1 - 0.25 / dist);
                    
                end
            end
            
            obj.behavior_ = obj.behavior_ * (1 - ((1 - obj.attitude_) * (1 - factor)));
        end
    end
    
end % Agent class.