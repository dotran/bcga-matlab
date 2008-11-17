%*************************************************************************%
% The BELITISM function performs elitism                                                                  %
%                                                                                                                                %
% function [pop,x,objfunc]=bElitism(pop,x,objfunc,chrombest,xbest,objbest,maxmin)%
% Input:                                                                                                                      %
%    pop- population of chromosomes, matrix                                                            %
%    x- variables, matrix                                                                                              %
%    objfunc- objective function value                                                                         %
%    chrombest- best chromosome, vector                                                                %
%    xbest- variables, vector                                                                                       %
%    objbest- best objective function value                                                                  %
%    maxmin= -1 for minimization, 1 for maximization                                                   %
% Output:                                                                                                                    %
%    pop- modified population of chromosomes, matrix                                              %
%    x- modified variables, matrix                                                                                %
%    objfunc- modified objective function value                                                           %
%                                                                                                                                %
% Copyright (c) 2002 by Prof. Gang-Gyoo Jin, Korea Maritime University                    % 
%*************************************************************************%
function [pop,x,objfunc]= bElitism(pop,x,objfunc,chrombest,xbest,objbest,maxmin)

if(maxmin==1)
   cobjbest= max(objfunc);
   if(cobjbest < objbest)
      [objworst, index]= min(objfunc);
      pop(index,:)= chrombest;
      x(index,:)= xbest;
      objfunc(index)= objbest;
   end
else
   cobjbest= min(objfunc);
   if(cobjbest > objbest)
     [objworst, index]= max(objfunc);
      pop(index,:)= chrombest;
      x(index,:)= xbest;
      objfunc(index)= objbest;
   end
end
