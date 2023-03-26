%% DOF Robot Calculator 
% This program takes in user inputs regarding the type of robot, the dof
% for each joint based on whether or not it is planar or spatial, and then
% returns the total degree of freedom for the given robot


%% Clearing all previous inputs 
clc 
clear

%% Type of robot 

result = input('Type in P for a planar robot or S for a spatial robot: ', 's'); % Getting the robot type 

while 1                                                                     % Error handling to make sure user only selects P or S 
    if strcmp(result, 'P') || strcmp(result, 'S')
        if strcmp(result, 'P')                                              % If the correct selection is made, we can assign "m"
            m = 3;
        end
        if strcmp(result, 'S')
            m = 6;
        end 
        break
    end 
    disp('Please enter either P or S!')                                     % Making the user input either "P" or "S" 
    result = input('Type in P for a planar robot or S for a spatial robot: ', 's');
end 
%% Calculating joint dof 

while 1
    J = input('Type in the amount of joints the robot has: ');
    if J > 0
        break
    end 
    
    fprintf('ERROR: Cannot have 0 or less joints! Try again')
    fprintf('\n')

end 
% Getting amt of joints 
i = 1;                                                                      % Initializing count variable 
arr = [];                                                                   % Initializing array for joint dof's 
while i <= J
    if m == 3                                                               % If we have a planar robot, the only dof the two planar joints have is 1
        arr = ones(1,J);                                                    % Set the array to all ones with the joint size 
        break 
    end 

    if m == 6
        fprintf('Write how many degrees of freedom joint %d has: ', i)
        j_df = input('');      % User gives the dof of each joint type 
        while (j_df > 3) || (j_df <= 0)
            j_df = input ('ERROR: Too high or too low of joint dof. Please try again: ');   % The joint dof cannot be 0 or less, and cannot be greater than 3
                                                                                            % so we error handle it until they give a proper joint type 
        end
        arr = [arr j_df];                                                                   % Adding the dof joint 
    end 
    i = i + 1; 
end 


s_f = sum(arr);
%% Calculating amount of links                

while 1
    N = input('Type in the amount of links the robot has (including ground): '); % Getting the amount of links 
    if N > 0
        break
    end 
    fprintf('ERROR: Cannot have 0 or less links. Try again!')
    fprintf('\n')
end 

%%  Calculating DOF 
dof = m*(N - 1 - J) + s_f;                                                   % Grublers Formula 

fprintf('Your robot has %d degree(s) of freedom', dof)                         % Printing the degrees of freedom 
fprintf('\n')



