clc;
clear;
close all;


%% Problem Definition

model = LoadData(); %Create Problem Model
CostFunction = @(tour) TourLenth(tour,model);



%% SA Parameter

MaxIt = 900;      %Maximum Iteration
MaxSubIt = 10;      %Maximum Iteration For Each Temperature
T0 = 10;             %Initial Temperature
alpha = 0.7;       %Temperature Reduction Rate
nPop = 4;           %Population Size
nMove = 6;          %Number of Neighbors per Individual

%% Initialation

%Create Empty Structure for Individual
empty_individual.Position = [];
empty_individual.Cost = [];

%Create Population Array
pop=repmat(empty_individual,nPop,1);

% Initialize Best Solution
BestSolotion.Cost=inf;

% Initialize Population
for i =1 : nPop
    %initial Solution
    pop(i).Position = CreateRandomSolotion(model);
    pop(i).Cost = CostFunction(pop(i).Position);
    
    if pop(i).Cost <= BestSolotion.Cost
        BestSolotion = pop(i);
    end
end


BestCost=zeros(MaxIt,1);    %Initialize Array To Hold Best Cost

T = T0;     %Initialize Temperature



tic
%% SA Main Loop

for it=1 : MaxIt
    
    
    for subIt=1 : MaxSubIt
        %Create New Solutions
        newpop = repmat(empty_individual,nPop,nMove);
        for i=1 : nPop
            for j=1 : nMove
                %Create Neighbor
                newpop(i,j).Position = CreateNeighbor(pop(i).Position);
                newpop(i,j).Cost = CostFunction(newpop(i,j).Position );
            end
        end
        
        newpop = newpop(:);
        
        %Sort Neighbors
        [~,SortOrder] = sort([newpop.Cost]);
        newpop = newpop(SortOrder);
        
        for i=1 : nPop
            if newpop(i).Cost <= pop(i).Cost %if newsol best than sol
                pop(i) = newpop(i);
                
            else
                % DELTA = newSol.Cost - sol.Cost
                DELTA = (newpop(i).Cost - pop(i).Cost)/pop(i).Cost;
                P = exp(-DELTA/T);
                if rand <= P
                    pop(i).Cost = newpop(i).Cost;
                end
            end
            if pop(i).Cost <= BestSolotion.Cost  %Update Best Solotion
                BestSolotion = pop(i);
            end
        end
        
        
        
    end
    
    BestCost(it) = BestSolotion.Cost; %Update Best Cost
    
    T = alpha*T;    %Update Temperature
    disp(['Iteration ' num2str(it) ' Temperature = ' num2str(T) ' And Best Cost Found = ' num2str(BestCost(it))]);
end




%% Result

figure;
plot(BestCost,'LineWidth',2);
xlabel('Iteration');
ylabel('Best Cost');


figure;
PlotSolution( BestSolotion.Position,model )
toc





