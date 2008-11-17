function objfunc= EvalObj1(x,npara,popsize);

for i= 1:popsize
  objfunc(i)= x(i,1)^2+x(i,2)^2+x(i,3)^2;
end
