% % % % % % % % % % % % % % % % % % % % % % % %
%------- by Amin Ebrahimi              -------%
%------- website : http://amin347.ir   -------%
%------- github : https://git.io/f4SW5 -------%
%------- Date : 2018-06-12             -------%
% % % % % % % % % % % % % % % % % % % % % % % %



function tour2 = CreateNeighbor( tour1 )

%  Case 1 :
%  Equal Possibility
%M = randi([1 3]);


%  Case 1 :
%  Inequal Possibility
pSwap=0.4;
pReversion=0.4;
pInsertion = 1-pSwap-pReversion;
M = RouletteWheelSelection([pSwap pReversion pInsertion]);




switch M
    case 1
        tour2=Swap(tour1);       
    case 2
        tour2 = Reversion(tour1);     
    case 3
        tour2 = Insertion(tour1);      
end


end

