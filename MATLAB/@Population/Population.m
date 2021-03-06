classdef Population < handle
    properties
        size_;
        agent_grid_ = Agent;
    end
    
    methods
        function obj = Population(init_behaviors, init_attitudes)
            obj.size_ = size(init_behaviors, 1);
            
            % Initialize agent grid.
            for i = 1 : obj.size_
                for j = 1 : obj.size_
                    obj.agent_grid_(i, j) = Agent(init_behaviors(i, j), ...
                        init_attitudes(i, j));
                end
            end
            
            % Add neighbors to agents.
            for i = 1 : obj.size_
                for j = 1 : obj.size_
                    
                    for m = i - 3 : i + 3
                        for n = j - 3 : j + 3
                            
                            if (~(m == i && n == j) && (0 < m) && ...
                                    (m <= obj.size_) && (0 < n) && ...
                                    (n <= obj.size_))
                                
                                dist = max(abs(m - i), abs(n - j));
                                
                                obj.agent_grid_(i, j).AddNeighbor( ...
                                    obj.agent_grid_(m, n), dist);
                                
                            end % if statement.
                            
                        end % n for loop.
                    end % m for loop.
                    
                end % j for loop.
            end % i for loop.
            
            fprintf('POPULATION INITIALIZED \n');
            
        end % Population function (constructor).
        
        function [] = Update(obj)
            
            for i = 1 : obj.size_
                for j = 1 : obj.size_
                    obj.agent_grid_(i, j).ApplyNeighborInfluence();
                end
            end
            
            for i = 1 : obj.size_
                for j = 1 : obj.size_
                    obj.agent_grid_(i, j).Update(1);
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
        
        function [incident_map] = IncidentMap(obj)
            incident_map = zeros(obj.size_, obj.size_);
            for i = 1 : obj.size_
                for j = 1 : obj.size_
                    incident_map(i, j) = obj.agent_grid_(i, j).incident_;
                end
            end
        end
    end
    
end

