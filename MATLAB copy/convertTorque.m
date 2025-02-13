% SID: 862480118
% Kincade-Bennett, Elijah

% ME18A Assignment 3
% Jan 30, 2025

function [success, convertedTorque] = convertTorque(torqueValue, currentForceUnit, currentLengthUnit, desiredForceUnit, desiredLengthUnit)
    % This function converts a torque from one set of units to another.
    % It takes the torque value, current force unit, current length unit, desired
    % force unit, and desired length unit as input.
    % It returns a success value (1 for success, 0 for failure) and the converted torque.

    success = 1; % Initialize success to 1 (assume success)
    convertedTorque = 0; % Initialize convertedTorque to 0

    % Conversion factors
    lb_to_N = 4.44822;
    oz_to_N = 0.2780139;
    kN_to_N = 1000;
    ft_to_m = 0.3048;
    in_to_m = 0.0254;
    mm_to_m = 0.001;

    % Convert to base units (N-m)
    
    % Force Conversion
    switch currentForceUnit
        case "N"
            force_N = torqueValue;
        case "lb"
            force_N = torqueValue * lb_to_N;
        case "oz"
            force_N = torqueValue * oz_to_N;
        case "kN"
            force_N = torqueValue * kN_to_N;
        otherwise
            success = 0; %Invalid force unit
            return;
    end

    %Length Conversion
     switch currentLengthUnit
        case "m"
            length_m = 1;
        case "ft"
            length_m = ft_to_m;
        case "in"
            length_m = in_to_m;
        case "mm"
            length_m = mm_to_m;
        otherwise
            success = 0; % Invalid length unit
            return;
     end
    
    torque_N_m = force_N * length_m;


    % Convert from base units to desired units

    % Force Conversion
    switch desiredForceUnit
        case "N"
            convertedForce = torque_N_m;
        case "lb"
            convertedForce = torque_N_m / lb_to_N;
        case "oz"
            convertedForce = torque_N_m / oz_to_N;
         case "kN"
             convertedForce = torque_N_m / kN_to_N;
        otherwise
             success = 0; %Invalid desired force unit
             return;
    end
    
    % Length Conversion
    switch desiredLengthUnit
        case "m"
           convertedLength = 1;
        case "ft"
            convertedLength = 1/ft_to_m;
        case "in"
            convertedLength = 1/in_to_m;
        case "mm"
             convertedLength = 1/mm_to_m;
        otherwise
            success = 0; % Invalid desired length unit
            return;
    end

    convertedTorque = convertedForce * convertedLength;

end