%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = load('sbi_f.txt');
%number of training sets : rows
count_data_rows = size(data,1) ;
count_features = size(data,2)-1 %-1 because last col is Y
start_row = 11;
X = data(1:count_data_rows,1:count_features);
y = data(1:count_data_rows,8:8);
Y_result = zeros(count_data_rows,1);
m = length(y);

%just for verification
x_row = size(X,1);
x_col = size(X,2);

% Print out some data points
%fprintf('First 10 examples from the dataset: \n');
%fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');
% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');
%[X mu sigma] = featureNormalize(X);



%% ================ Part 2: Co-ordinate Descent ================

fprintf('Running co-ordinate descent ...\n');

% Choose some alpha value
alpha = 0.01;
num_iters = 400;

d = 10;       % Depth- 10 days
alpha = 1.1;  %    approx doubles after 10 days
beta = 1;      

curr=1;
Z=0;
theta = zeros(1, x_col);
lamda = (beta/alpha) + beta;

k = x_col; %no of features 
xi = X(1,:);
M = xi'*xi + lamda*eye(x_col);



front_point = 11;
rear_point  = 1;
for front_point=11:count_data_rows-2
      rear_point = front_point-10;

      for i=1:10
        xi = X(rear_point+i,:);
        Z = (beta/alpha)*X(rear_point+i+1,:) + beta*X(rear_point+i-1,:)  + X(i,:)*y(i);
        theta =  Z*((pinv(M))');
        M = xi'*xi + lamda*eye(x_col);
        
      end;
      Y_result(front_point,1) = (theta*X(front_point,:)');
end;
% calculate the next value new_y() = theta' * x(i)


pause;
price = 0; % You should change this

