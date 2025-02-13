function numCoins = makeChange(amount,coins)
%makeChange determines the minimum number of coins to make a given amount
%of change using loops
%   numCoins = the minimum number of coins needed, or -1 if invalid inputs
%   or exact change cannot be made

% Check for invalid inputs
if amount < 0 ||isempty(coins)
    numCoins = -1;
    return;
end

%Sort coins in descending order
coins = sort(coins, 'descend');

%Initialize coin count
numCoins = 0;

%Loop over the array of coins
for c = coins
    %Loop while it is possible to deduct c from amount
    while amount >= c
        amount = amount - c;
        numCoins = numCoins+1;
    end
end

%Check if exact change was made
if amount ~= 0
    numCoins = -1;
end
end