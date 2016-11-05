% INFO
% Function that calculates the average distance between
% all the points in the snake.
%
% Arguments: points - A matrix of vectors, where the first row of each
% column contains the x coordinate of the point and the
% second row of each column contains the y coordinate of the
% point.
% n - Total number of points in the snake.
%
% Output: avgDist - The average distance.
%
% Author: Nikolas Petteri Tiilikainen
% Department of Computer Science
% University of Copenhagen (DIKU)
% 2007
%%
function [avgDist] = getAvgDist(points, n)
sum = 0;
for i = 1:n
sum = sum + norm(points(1:2, i) - points(1:2, mod(i,n)+1));
end
avgDist = sum/n;
end