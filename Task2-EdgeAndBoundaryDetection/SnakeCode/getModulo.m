%% INFO
% Function that calculates the index arithmetic using
% modulo, this is necessary when the snake forms a closed
% curve.
%
% Arguments: i - The current index.
% n - The number of iterations in the loop.
%
% Output: modI - The current index i modulo n, if i = n we return n
% insteaad of 0.
% modIminus - This equals modI - 1, if modI - 1 = 0 we
% return n instead of 0.
% modIplus - This equals modI + 1, if modI + 1 > n we return
% 1 instead of n+1.
%
% Author: Nikolas Petteri Tiilikainen
% Department of Computer Science
% University of Copenhagen (DIKU)
% 2007
%%
function [modI, modIminus, modIplus] = getModulo(i, n)
modI = mod(i,n);
if modI == 0
modI = n;
end
modIminus = modI - 1;
modIplus = modI + 1;
if modIminus == 0
modIminus = n;
end
if modIplus > n
modIplus = 1;

end
end