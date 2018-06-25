% % % % % % % % % % % % % % % % % % % % % % % %
%------- by Amin Ebrahimi              -------%
%------- website : http://amin347.ir   -------%
%------- github : https://git.io/f4SW5 -------%
%------- Date : 2018-06-12             -------%
% % % % % % % % % % % % % % % % % % % % % % % %


function y = Swap(x)

n = numel(x);

i=randsample(n,2);
i1=i(1);
i2=i(2);

y=x;

y(i1)=x(i2);
y(i2)=x(i1);

end

