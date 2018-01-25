clc;
close all;
clear all;
%% Optimizer for use with Stat Array v1.1 <https://drive.google.com/open?id=1zXDdAmKhxDGl3x-zHvycHX9udPv2UxOi9bHPxXUs5tY Stat Array v1.1>
%pause on
%pause
%%

fprintf('This program will optimize your 6 2d6 rolls by \n the highest total stat sum.\n It will ask you to input your 6 2d6 rolls one at a \n time and if any of them are "2" it will \n ask for the d20 roll corrisponding to \n that "2" after inputting that "2." \n')
fprintf('The current code only supports optimizing for one or fewer "2" roll \n'
Stats_table=[NaN,NaN,NaN,NaN,NaN,NaN;0,0,0,0,0,0;6,9,10,12,13,14;
    7,9,10,12,13,15;7,9,11,12,14,15;7,10,11,13,14,15;8,10,12,13,14,15;
    8,11,12,13,14,16;9,11,12,13,15,16;9,11,12,14,15,17;9,11,13,14,16,17;
    9,12,13,14,16,18];
Two_table=[6,8,10,12,13,14;6,8,10,12,13,14;7,9,11,12,13,14;7,9,11,12,13,14;
    8,9,12,12,13,14;8,10,12,13,13,15;8,10,12,13,14,15;8,10,12,13,14,15;
    8,10,12,13,14,15;8,10,12,13,14,15;8,10,12,13,14,15;8,10,12,13,14,15;
    8,10,12,13,14,15;8,10,12,13,14,15;9,10,13,13,14,15;9,11,13,14,14,15;
    9,11,13,14,15,16;9,11,13,14,15,16;9,12,13,14,16,16;9,12,13,14,16,17];
dierolls = zeros(1,6);
d20roll=zeros(1,6);
%% Uncomment this section and comment out the next to hard code dicerolls
% dierolls = [3 5 7 8 9 10];
% d20roll= [0 0 0 0 0 0];

%%
for i=1:6
    fprintf('input 2d6 roll %d', i);
    dierolls(i) = input('\n');
    %stats(1,i)=Stats_table(dierolls(i),i)
    if dierolls(i) == 2
        fprintf('input d20 roll for this 2');
        d20roll(i)= input('\n'); %todo check for out of bounds input
    end
end

if size(nonzeros(d20roll)) == 1

Stats_table(2,:)=Two_table(nonzeros(d20roll),:);
elseif size(nonzeros(d20roll)) >1 %I've only coded this program to support 1 two at the moment
    fprintf('This code currently can only support optimizing with up to one 2 in the dice rolls')
    error('too many 2s')
end

%%
%rows by columns; there are 6 columns for stats 1 for stats sum and 6 for
%corrisponding die rolls
for i=1:6
    statsmin(1,i)=Stats_table(min(dierolls),i); %not currently used because 2 in the dice rolls return stats that aren't necessarily the lowest
end                                             %version 1 had 2 more punishing (but still used a table- the update goal was to make 2 not feel like a punishment)
%rowsum=sum(statsmin);
dieopt= sortrows(perms(dierolls), [1 2 3 4 5 6]); %all permutations of six rolls putting the lowest die roll first to the highest last
   b=1;
 
statsmax=zeros(720,13);
statsum=0;
maxstatsum=0;
for i=1:720
    %rowsum=0;
    
    for j=1:6 
        statsmax(i,j)=Stats_table(sub2ind(size(Stats_table), dieopt(i,j), j));
      
        %previous version that was reworked into the line above  
        %rowsum=rowsum+Stats_table(sub2ind(size(Stats_table), dieopt(i,j), j));
       % pause
%     if rowsum > statsum
%         %sum(Stats_table(dieopt(i),:)) > sum(statsmax(i,:))
%         statsmax(i,j)=Stats_table(sub2ind(size(Stats_table), dieopt(i,j), j));
%         diemax(i,j)=dieopt(i,j);
%        %statsum=rowsum;
%     elseif rowsum == statsum
%         %sum(Stats_table(dieopt(i)))==sum(statsmax(i,:))
%         statsmax(i,j)=Stats_table(sub2ind(size(Stats_table), dieopt(i,j), j));
%         diemax(i,j)=dieopt(i,j);
%        % statsum=rowsum;
%         end
    
    end
    statsmax(i,7)=sum(statsmax(i, 1:6));
    statsmax(i,8:13)= dieopt(i,:);
    statsum(i)=max(cumsum(statsmax(i,1:6)'));
    if statsum(i) >= max(maxstatsum) %the intent of this is to add in every stat option that increases over the previous best
       maxstatsum(b)= statsum(i);
       choices(b,:)=statsmax(i,:); 
       b=b+1;
    end
end

statssorted=sortrows(statsmax, [7 6 5 4 3 2 1]); %all permutations sorted by total sum and then by highest high stat etc.
sortedchoices=sortrows(choices, [7 6]); %just currated stat choice sorted by sum then highest high stat
%could program to ask for user desired sorting preferences

