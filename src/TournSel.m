%*************************************************************************%
% The TOURNSel function performs tournament selection                                          %
%                                                                                                                                %
% function newpop= TournSel(pop,popsize,fitness,tsize)                                           %
% Input:                                                                                                                      %
%    pop- population of chromosomes, matrix                                                            %
%    popsize- population size                                                                                     %
%    fitness- fitness, vector                                                                                         %
%    tsize- tournament size                                                                                         %
% Output:                                                                                                                    %
%    newpop- mating pool, matrix                                                                               %
%                                                                                                                                %
% Copyright (c) 2000 by Prof. Gang-Gyoo Jin, Korea Maritime University                    % 
%*************************************************************************%
function newpop= TournSel(pop,popsize,fitness,tsize)

if(tsize < 2)
  tsize= 2;
elseif(tsize > popsize)
  tsize= popsize;
end
for i= 1:popsize
  mate= Pickup(popsize*ones(1,tsize));
  [fitwin,jwin]= max(fitness(mate));
  newpop(i,:)= pop(mate(jwin),:);
end
