% Problem Definition and Parameters Setting
p = [10,10,13,4,9,4,8,15,7,1,9,3,15,9,11,6,5,14,18,3];
d = [50,38,49,12,20,105,73,45,6,64,15,6,92,43,78,21,15,50,150,99];  
w = [10,5,1,5,10,1,5,10,5,1,5,10,10,5,1,10,5,5,1,5];
%get the size of p array( the length of the first dimension of p)
Num_Jobs = size(p,2);
% Num_Jobs=20;

% display all problem definition and the parameters setting
% using the fprintf to directly display the text without creating a
% variable
fprintf('Number of jobs:% i',Num_Jobs);
fprintf('\nThe processing time pj are :');
fprintf('% d',p);
fprintf('\nThe due date dj are');
fprintf('% d',d);
fprintf('\nThe weights wj are');
fprintf('% d',w);

% tabusize = input('Please input the tabusize: ');
% default setting of the tabusize is equal to 2
tabusize = 2;
fprintf('\nThe tabusize is %d',tabusize);

%if isempty (tabusize)  
%   tabusize = 2;
%   fprintf('\nThe tabusize is %d',tabusize);
%end
%Num_Iteration = input('\nPlease input the times of iteration: '); 
% default setting of iteration is equal to 100
Num_Iteration = 100;
fprintf('\nThe iteration is %d',Num_Iteration);
if isempty (Num_Iteration)
    Num_Iteration = 100;
end

% create an tabusize by 2 array of zeros as tabulist,
% it will be used to store the fixed pair(tabu in the )
tabulist = zeros(tabusize, 2);
% disp(tabulist);
Tbest = 9999999999;

tic  % Start stopwatch timer

for Iteration = 1:Num_Iteration
    if (Iteration == 1) % Initialize the Solution
        %x_now is the row vector containing a random permutation of the
        %integers from 1 to Num_Jobs
        x_now = randperm(Num_Jobs);
        Ptime = 0;  
        Tardiness = 0;
        
        %According to the job sequence x_now, we accumulate the process to Ptime
        %And then calculate the tardiness
        for j = 1:Num_Jobs  
            Ptime = Ptime + p(x_now(j));
            Tardiness = Tardiness + w(x_now(j))*max(Ptime-d(x_now(j)),0);
        end
        % After for-loop calculation, we get the initial solution(x_now=x_best=x0)
        T_now_best = Tardiness; 
        
    % Starting the intensification step, we regenerate a new job sequence
    % based on previous situation(tabulist) and try to find the new solution
    else % Neighborhood Search
        T_now_best = 9999999999;  

        for k = 1:(Num_Jobs-1) 
            istabu = 0;  
            x_next = x_now;  
            x_next(k) = x_now(k+1);
            x_next(k+1) = x_now(k);
            for n = 1:tabusize 
                if (x_next(k) == tabulist(n,1) && x_next(k+1) == tabulist(n,2))
                    istabu = 1;
                end 
                if (x_next(k) == tabulist(n,2) && x_next(k+1) == tabulist(n,1))
                    istabu = 1;
                end
            end
            if (istabu == 0)
                Ptime = 0;
                Tardiness = 0;
                for j = 1:Num_Jobs
                    Ptime = Ptime + p(x_next(j));
                    Tardiness = Tardiness + w(x_next(j))*max(Ptime-d(x_next(j)),0);
                end
                if (Tardiness < T_now_best) 
                    T_now_best = Tardiness;  
                    jobsequence = x_next;  
                    t1 = x_next(k); 
                    t2 = x_next(k+1); 
                end
            end
        end
        x_now = jobsequence;
        
        % Update the Tabu List
        for n = tabusize : -1 : 2  
            tabulist(n,1) = tabulist ((n-1),1);
            tabulist(n,2) = tabulist ((n-1),2);
        end
        tabulist(1,1) = t1; 
        tabulist(1,2) = t2; 
        
        % Update the Best Result of All Iterations
        if (T_now_best <= Tbest) 
            Tbest = T_now_best;
            x_best = x_now;
        end
    end
end

% Calculate the Tardy Job Counts
jobsequence_ptime = 0;  
num_tardy = 0;  
for l = 1:Num_Jobs 
    jobsequence_ptime = jobsequence_ptime + p(x_best(l));  
    if (jobsequence_ptime > d(x_best(l)))  
        num_tardy = num_tardy + 1;
    end
end

% Report the Results
disp('\n--- Final Report ---');
disp('Optimal Solution = '); 
    disp(x_best);
fprintf('Optimal_Value : %d\n',Tbest);
fprintf('Number of Tardy : %d\n',num_tardy);

toc  % Read elapsed time from stopwatch