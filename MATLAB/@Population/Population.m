classdef Population < handle
    properties
        size_;
        agent_grid_ = Agent;
    end
    
    methods
        function obj = Population(size)
            obj.size_ = size;
            
            init_behaviors = 0.5*rand(obj.size_, obj.size_);
            init_attitudes = rand(obj.size_, obj.size_);
            
            % Initialize agent grid.
            for i = 1 : obj.size_
                for j = 1 : obj.size_
                    obj.agent_grid_(i, j) = Agent(init_behaviors(i, j), ...
                        init_attitudes(i, j));
                end
            end
            
%             % Add neighbors to agents.
%             for i = 1 : obj.size_
%                 for j = 1 : obj.size_
%                     
%                     for m = i - 5 : i + 5
%                         for n = j - 5 : j + 5
%                             
%                             if (~(m == i && n == j) && (0 < m) && ...
%                                     (m <= obj.size_) && (0 < n) && ...
%                                     (n <= obj.size_))
%                                 
%                                 dist = max(abs(m - i), abs(n - j));
%                                 
%                                 obj.agent_grid_(i, j).AddNeighbor( ...
%                                     obj.agent_grid_(m, n), dist);
%                                 
%                             end % if statement.
%                             
%                         end % n for loop.
%                     end % m for loop.
%                     
%                 end % j for loop.
%             end % i for loop.
            
        end % Population function (constructor).
        
        function [] = Step(obj)
            
            for i = 1 : obj.size_
                for j = 1 : obj.size_
                    obj.agent_grid_(i, j).Step(0.1);
                end
            end
            
        end
        
        function [behavior_map] = BehaviorMap(obj)
            behavior_map = zeros(obj.size_, obj.size_);
            for i = 1 : obj.size_
                for j = 1 : obj.size_
                    behavior_map(i, j) = obj.agent_grid_(i, j).behavior_;
                end
            end
        end
    end
    
end

