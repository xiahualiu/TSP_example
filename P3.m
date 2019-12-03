% Author: Xiahua Liu and Tyler Watson

clear
clc

MAX_CITY_SIZE = 9; % This is the maximum city numbers.

% Set up distance table and input
map=node_map();

% Input a city sequence, Comment this section for debug
for i=1:MAX_CITY_SIZE
    if i==1
        x=input(['Please input start and end city (city #1) coordinate, like: [20,20]\n']);
    else
        x=input(['Please input city #',num2str(i), ' like: [20,40], Return EMPTY to start solving!\n']);
    end
    if isempty(x)
        break
    end
    assert(length(x)==2,'Error: Invalid Input');
    map.insert_city(i,x);
end

% Input city numbers and locations here. This section is designed for debugging.
% map.insert_city(1,[0,0]);
% map.insert_city(2,[0,1]);
% map.insert_city(3,[0,2]);
% map.insert_city(4,[0,3]);
% map.insert_city(5,[0,4]);
% map.insert_city(6,[1,4]);
% map.insert_city(7,[2,4]);
% map.insert_city(8,[3,4]);
% map.insert_city(9,[4,4]);
% map.insert_city(10,[4,3]);
% map.insert_city(11,[4,2]);

N=length(map.map.values);

% Set up DP table
DP=DP_table();

% Create the initial g(1,empty)
node0=node(N);

% Insert the first node into DP table
DP.insert(node0);

% Step N-1 times in the DP table (Update DP table)
for i=1:N-1
    DP.step(map)
end

% Do the final step (return to 1)
DP.final_step(map);
% After final step (return to 1), DP table should only has one optimal path.
% Print result
DP.get_shortest_path();