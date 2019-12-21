Here are three different ways to solve the classical TSP, i.e. [Traveling Salesman Problem](https://en.wikipedia.org/wiki/Travelling_salesman_problem). All code is tested on MATLAB 2019b.

## The algorithms are

1. Genetic Algorithm (Edge Representation and 2-opt)
2. Dynamic Programming
3. Swarm Algorithm (Ant System algorithm)

## How to run

In genetic and swarm algorithms, you are going to input the number of the total cities, the program will randomly scatter those cities on the map and print the evolving process through a animated plot (You need to have your MATLAB version higher than 2019 to see the animation effect).

If you are going to run dynamic programming method, you are supposed to input the location of the cities one by one, in array format (like [20,20]). The result of DP will only be shown on the command line.

## Requirements

* MATLAB version higher than 2019
* Suggested the city numbers for each method:
    - GA: < 50 
    - DP: < 10 (the time cost increases exponentially as cities increase)
    - Swarm: < 30

## Performance
Dynamic programming can give us the optimal result every time, but it has exponentially time complexity. The other 2 methods are heuristic, which can give us an approximate optimal solution in much shorter time.

The swarm algorithm works great for small problem (less than 30 cities) in such case it outruns both 2 other methods.