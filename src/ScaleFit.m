%*************************************************************************%
% The SCALEFIT function converts objective function values into fitness using          %
%              the scaling window scheme(window size= 1)                                            %
%                                                                                                                                %
% function fitness= ScaleFit(objfunc,popsize,gam,maxmin)                                        %
% Input:                                                                                                                      %
%    objfunc- objective function value, vector                                                              %
%    popsize- population size                                                                                     %
%    gam- minimun of objfunc or -objfunc in the previous population                         %
%    maxmin= -1 for minimization, 1 for maximization                                                   %
% Output:                                                                                                                    %
%    fitness- scaled fitness, vector                                                                             %
%                                                                                                                                %
% Copyright (c) 2002 by Prof. Gang-Gyoo Jin, Korea Maritime University                    % 
%*************************************************************************%
function fitness= ScaleFit(objfunc,popsize,gam,maxmin)

if(maxmin == 1)
  fitness= objfunc-gam;
else
  fitness= -objfunc-gam;
end
for i=1:popsize
  if(fitness(i) < 0)
    fitness(i)= 0;
  end
end
