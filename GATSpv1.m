clear all;

clc;

chk1='Please enter the number of cities (N) :';
N=input(chk1);

%% Function to evaluate the distance between two points

Rd=@(x1,y1,x2,y2)(sqrt(((x2-x1)^2)+((y2-y1)^2)));

%% generation of the N coordinates

XY=100*rand(N,2);
XY1=[];
for i=1:N
    XY1=[XY1;i XY(i,:)];
end

%% creating random set of 0.2*N parents to choose for mutation

Np=transpose(XY1(2:end,1));  % Numbering the nodes for creating a permutation
Npar=[];
for i=1:int16(2*N)
    Np_rand=Np(randperm(length(Np)));
    Npar=[Npar; 1 Np_rand 1];
end

Npar1=unique(Npar,'rows');

%% Calculate the fitness function
Ft=[];
for j=1:length(Npar(:,1))
    R=0;
    for i=1:N
        t=Rd(XY(Npar(j,i),1),XY(Npar(j,i+1),1),XY(Npar(j,i),2),XY(Npar(j,i+1),2));
        R=R+t;
    end
    Ft=[Ft; R];
end
Pft=Ft/sum(Ft);
[Pft,r]=sort(Pft,'ascend');  % Pft is the sorted in ascending order of fitness probability values and r is the index of the parent route 
%k=randperm(length(a));

%%Selecting the parents based on fitness function values
t=int16(0.5*length(Pft));

Par=[];  % Matrix selected for parents
for i=1:t
    Par=[Par;i Npar(r(i,1),:)];
end

%% Cross over algorithms being implemented
%PMX
CrossPMX=transpose(Par(:,1));
CrossPMX=CrossPMX(randperm(length(CrossPMX)));
for i=1:(length(CrossPMX)-1)
    Bp=[(int16(0.2*(length(Npar)-1))) (int16(0.3*(length(Npar)-1)))];
end


K=[2 3 4 5 6 8];
B=K==3;
sum(B)










