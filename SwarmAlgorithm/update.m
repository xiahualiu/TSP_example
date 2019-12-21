function [fig_tour_x, fig_tour_y]=update(tour, map)
    fig_tour_x=zeros(1,length(tour));
    fig_tour_y=zeros(1,length(tour));
    
    for i=1:length(tour)
        fig_tour_x(i)=map(1,tour(i));
        fig_tour_y(i)=map(2,tour(i));
    end
end