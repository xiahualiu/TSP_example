% Xiahua Liu

close all
clear
clc
disp('This program is written by Xiahua Liu and Tyler Watson.')

map=[];
%% Input and generate map
x=input(['Please input the number of cities on the map: \n']);
distance_table=zeros(x,x);

for i=1:x
    node=rand(2,1)*100;
    map=[map node];
    % Add the distances between new node and 
    % current all map nodes to distance table
    for j=1:size(map,2)
        distance_table(i,j)=norm(map(:,i)-map(:,j));
        distance_table(j,i)=distance_table(i,j);
    end
end

%% Parameters
ALPHA=1;
BETA=5;
RHO=0.5;
ANT_NUM=200;
Q=100;
TAU=10^(-6);
ELITES=5;
ITERATIONS=x*2;

% Initialize pheromone table
pheromone_table=ones(x,x)*TAU;

%% Animated plot
global_best_tour=[1:x,1];
global_best_distance=inf;
global_best_iter=0;
[x_fig, y_fig]=update(global_best_tour,map);

fh=figure;
% Draw cities on map
scatter(map(1,:),map(2,:),'filled');
hold on
ph=plot(x_fig,y_fig);

%% Main Loop

for epoch=1:ITERATIONS
    % Place ant randomly
    team=[];
    for k=1:ANT_NUM
        team=[team, ant(x,randi([1,x]))];
    end
    % Repeat x-1 steps, for each ant, moving to next city based on the transition equation
    for steps=1:(x-1)
        for k=1:ANT_NUM
            ant_temp=team(k);
            current_loc=ant_temp.visited_list(1);
            next_loc=ant_temp.waiting_list;
            % Calculate transition equation for ant
            distance_list=zeros(1,length(next_loc));
            pheromone_list=distance_list;
            numerator=distance_list;
            prob_list=distance_list;
            accumulate_prob=0;
            denominator=0;

            for i=1:length(next_loc)
                distance_list(i)=distance_table(current_loc,next_loc(i));
                pheromone_list(i)=pheromone_table(current_loc,next_loc(i));
                denominator=denominator+(1/distance_list(i))^BETA*(pheromone_list(i)^ALPHA);
                numerator(i)=(1/distance_list(i))^BETA*(pheromone_list(i)^ALPHA);
            end
            
            % Make discrete cumulative probability distribution list for next move. 
            for i=1:length(next_loc)
                accumulate_prob=accumulate_prob+numerator(i)/denominator;
                prob_list(i)=accumulate_prob;
            end
            
            % Choose next city
            rand_value=rand();
            next_city=next_loc(find(rand_value<prob_list,1));
            
            % Update ant in team
            team(k)=ant_temp.goto(next_city,distance_table(current_loc,next_city));
        end
    end
 
    % Every ant in team here has visited every city, and they need to go
    % back
    
    for k=1:ANT_NUM
        ant_temp=team(k);
        first=ant_temp.visited_list(end);
        last=ant_temp.visited_list(1);
        team(k)=ant_temp.goback(first, distance_table(first,last));
    end
    
    % Do pheromone update, elitests weight more 
    total_distance=[team.distance];
    [~, I]=sort(total_distance);
    % Pheromone deday
    pheromone_table=pheromone_table*0.5;
    % Elites first
    for i=1:ELITES
        ant_temp=team(I(i));
        for j=1:x
            former=ant_temp.visited_list(j);
            latter=ant_temp.visited_list(j+1);
            % Deposit pheromone
            add_pheromone=ELITES*Q/ant_temp.distance;
            pheromone_table(former,latter)=pheromone_table(former,latter)+add_pheromone;
            pheromone_table(latter,former)=pheromone_table(latter,former)+add_pheromone;
        end
    end
    % Non elite ants
    for i=(ELITES+1):length(I)
        ant_temp=team(I(i));
        for j=1:x
            former=ant_temp.visited_list(j);
            latter=ant_temp.visited_list(j+1);
            % Deposit pheromone
            add_pheromone=Q/ant_temp.distance;
            pheromone_table(former,latter)=pheromone_table(former,latter)+add_pheromone;
            pheromone_table(latter,former)=pheromone_table(latter,former)+add_pheromone;
        end
    end
    % Update best_tour and figure
    best_ant=team(I(1));
    if best_ant.distance<global_best_distance
        global_best_tour=best_ant.visited_list;
        global_best_distance=best_ant.distance;
        global_best_iter=epoch;
        [x_fig, y_fig]=update(global_best_tour,map);
        set(ph,'XData',x_fig,'YData',y_fig);
        set(fh,'Name', ['The shortest distance is  ', num2str(best_ant.distance)]);
        drawnow
    end
end

disp(['The optimal tour was found at iteration: #',num2str(global_best_iter)]);
disp(['Total iterations: ',num2str(ITERATIONS)]);
