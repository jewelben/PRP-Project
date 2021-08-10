%% Objective 
% To show that we can guess the input to the bsc by observing the outputs
% from the BSC with less memory and length.

N = 2000;   % no of interations
E = 0;      % init the error = 0
%% Code  

for i =1:N

    randomCodeWord = rand;            % input with probability 0 -> 0.1 and 1 -> 0.9  
    prob = [0.1, 0.9];
    randomCodeWord = sum(randomCodeWord >= cumsum([0, prob])) - 1;
    
    % Simulating a bsc
    
    p = 0.2;                          % assumed in the report
    errorbits = rand(size(randomCodeWord)) < p;
    y = randomCodeWord;
    y(errorbits) = 1 - y(errorbits);  % y is nothing but the output from the BSC.
    
    % Assuming we know the output y as 1 then,
    if(y == 1)
        y1 = 1;
        % from the bayes theorm we had that the new p = 8/26.
        postprob = 18/26;
        errorbits = rand(size(randomCodeWord)) < p;
        input = randomCodeWord;
        input(errorbits) = 1 - input(errorbits);
        if(randomCodeWord ~= input)
            E = E + 1;
        end
    else 
        y1 = 0;
        postprob = 18/26;
        errorbits = rand(size(randomCodeWord)) < p;
        input = randomCodeWord;
        input(errorbits) = 1 - input(errorbits);
         if(randomCodeWord ~= input)
            E = E + 1;
        end
    end

end

final_prob_error  = abs(E/N - 0.2); 
%% Obervation 
% The value of probaility of error comes out to be very less hence we are 
% able to use the bayes theorem to predict the output from the given input 
% with low probabily of error.