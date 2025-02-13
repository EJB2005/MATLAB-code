function [status, result] = MatrixOps(op, a1, a2)
    status = 0; % Initialize status to unsuccessful
    result = 0; % Initialize result to 0

    % Error handling for invalid inputs
    if op < 1 || op > 6
        return;
    end

    [rows1, cols1] = size(a1);

    if op <= 3
        [rows2, cols2] = size(a2);
        if rows1 ~= rows2 || cols1 ~= cols2
            return;
        end
    end

    % Perform calculations based on the value of op
    if op == 1 % Matrix addition
        result = zeros(rows1, cols1);
        for i = 1:rows1
            for j = 1:cols1
                result(i, j) = a1(i, j) + a2(i, j);
            end
        end
        status = 1;

    elseif op == 2 % Matrix subtraction
        % The previous code had issues with subtraction.
        result = zeros(rows1, cols1);
        for i = 1:rows1
            for j = 1:cols1
                result(i, j) = a1(i, j) - a2(i, j);
            end
        end
        status = 1;

    elseif op == 3 % Matrix multiplication
        [rows2, cols2] = size(a2);
        if cols1 ~= rows2
            return;
        end
        result = zeros(rows1, cols2);
        for i = 1:rows1
            for j = 1:cols2
                for k = 1:cols1
                    result(i, j) = result(i, j) + a1(i, k) * a2(k, j);
                end
            end
        end
        status = 1;

    elseif op == 4 % Determinant of a1
        if rows1 ~= cols1 || rows1 > 3
            return;
        end

        if rows1 == 1
            result = a1(1, 1);
        elseif rows1 == 2
            result = a1(1, 1) * a1(2, 2) - a1(1, 2) * a1(2, 1);
        elseif rows1 == 3
            % Previous calculation might have rounding errors. Recalculating.
            result = a1(1, 1) * (a1(2, 2) * a1(3, 3) - a1(2, 3) * a1(3, 2)) - ...
                     a1(1, 2) * (a1(2, 1) * a1(3, 3) - a1(2, 3) * a1(3, 1)) + ...
                     a1(1, 3) * (a1(2, 1) * a1(3, 2) - a1(2, 2) * a1(3, 1));
        end
        status = 1;

    elseif op == 5 % Transpose of a1
        result = zeros(cols1, rows1);
        for i = 1:rows1
            for j = 1:cols1
                result(j, i) = a1(i, j);
            end
        end
        status = 1;

    elseif op == 6 % Inverse of a1
        if rows1 ~= cols1 || rows1 > 2
            return;
        end

        if rows1 == 1
            result = 1 / a1(1,1);
        elseif rows1 == 2
            det_a1 = a1(1, 1) * a1(2, 2) - a1(1, 2) * a1(2, 1);
            if det_a1 == 0
                return;
            end
            % The inverse calculation was correct, but the status wasn't updated when the calculation was successful
            result = [a1(2, 2), -a1(1, 2); -a1(2, 1), a1(1, 1)] / det_a1;
        end
        status = 1; % set status to 1 if the inverse was calculated
    end
end