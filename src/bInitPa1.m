function [rseed,maxmin,maxgen,popsize,npara,pcross,pmutat,lsubstr,xlb,...
							 xub,dmax,lchrom]= bInitPa1
rseed=       3223; 
maxmin=        -1;           % -1 for minimization
maxgen=       300;
popsize=       60;           % popsize should be even
npara=          3;
pcross=       0.8;
pmutat=       0.01;
lsubstr= 10*ones(1,npara);
xlb= -5.12*ones(1,npara);
xub= 5.11*ones(1,npara);

dmax= 2.^lsubstr-1;       % do not move 
lchrom= sum(lsubstr);   % do not move
if(rem(popsize, 2) ~= 0) % do not move
	popsize= popsize + 1;
end
