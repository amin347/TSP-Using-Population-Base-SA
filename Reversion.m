% % % % % % % % % % % % % % % % % % % % % % % %
%------- by Amin Ebrahimi              -------%
%------- website : http://amin347.ir   -------%
%------- github : https://git.io/f4SW5 -------%
%------- Date : 2018-06-12             -------%
% % % % % % % % % % % % % % % % % % % % % % % %


function y = Reversion(x)

n = numel(x);

i=randsample(n,2);
i1=min(i);
i2=max(i);

y=x;
y(i1:i2)=x(i2:-1:i1);


end

