% SID: 862480118
% Kincade-Bennett, Elijah

% ME18A Assignment 3
% Jan 30, 2025

function [success, cost] = shippingCost(weight, serviceType)
    % This function calculates the cost of shipping a package based on the
    % package weight and type of service. It takes the package weight and
    % desired shipping service (1 = ground, 2 = second day, 3 = overnight) as input.
    % It returns a success value (1 for success, 0 for failure) and the shipping cost.

    success = 1; % Initialize success to 1 (assume success)
    cost = 0;    % Initialize cost to 0

    % Check for invalid inputs (serviceType)
     if serviceType < 1 || serviceType > 3
        success = 0;
        return;
    end

    % Calculate shipping cost based on service type
    switch serviceType
        case 1 % Ground service
            if weight > 70
                success = 0; % No ground service for packages over 70 lb [2]
                return;
            elseif weight <= 2
                 cost = 5.50; % Ground service cost for 0-2 lb packages [3]
            elseif weight <= 10
                 cost = 5.50 + 0.85 * ceil(weight - 2); % Ground service cost for 2-10 lb packages [3]
            else
                cost = 13.00 + 0.90 * ceil(weight - 10);% Ground service cost for >10 lb packages [3]
            end

        case 2 % Second day service
            if weight > 40
                success = 0; % No 2nd day service for packages over 40 lb [2]
                return;
            elseif weight <= 2
                cost = 14.75; % 2nd day service cost for 0-2 lb packages [3]
            elseif weight <= 10
                cost = 14.75 + 1.25 * ceil(weight - 2); % 2nd day service cost for 2-10 lb packages [3]
            else
                 cost = 27.25 + 1.50 * ceil(weight - 10);% 2nd day service cost for >10 lb packages [3]
            end

        case 3 % Overnight service
            if weight > 10
                success = 0; % No overnight service for packages over 10 lb [2]
                return;
            elseif weight <= 2
                cost = 22.00; % Overnight service cost for 0-2 lb packages [4]
            else
               cost = 22.00 + 5.85 * ceil(weight - 2);  % Overnight service cost for >2 lb packages [4]
            end
    end 