%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
%data = load('D/Aurobindo_x.txt');
%data = load('D/Britiannia_x.txt');
%data = load('D/Intrasoft_x.txt');
%data = load('D/Jet_x.txt');
data = load('D/Nilkamal_x.txt');
%data = load('D/sbi_x.txt');
%data = load('D/Sh_x.txt');
%data = load('D/TCS_x.txt');
%data = load('D/vedanta_x.txt');
%data = load('D/Yes_x.txt');

%number of training sets : rows
count_data_rows = size(data,1) ;
count_features = size(data,2)-1 %-1 because last col is Y
start_row = 11;
X = data(1:count_data_rows,1:count_features);
y = data(1:count_data_rows,7:7);
Y_result = zeros(count_data_rows,1);
m = length(y);

%just for verification
x_row = size(X,1);
x_col = size(X,2);

fprintf('Normalizing Features ...\n');
%[X mu sigma] = featureNormalize(X);



%% ================ Grad Descent ================

fprintf('Into Gradient descent ...\n');

% Choose some alpha value
alpha = 0.01;
num_iters = 400;

d = 10;       % Depth- 10 days
alpha = 1.1;  %    approx doubles after 10 days
beta = 1;      

curr=1;
Z=0;
theta = zeros(6,1);%, x_col);

[X mu sigma] = featureNormalize(X);

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.01;
num_iters = 400;

% Init Theta and Run Gradient Descent 

front_point = 11;
rear_point  = 1;
for front_point=11:count_data_rows
      if( X(front_point,1) - 1.0 ==0 )
       front_point
       break;
      endif;
      [theta, J_history] = gradientDescentMulti(X(front_point-10:front_point,1:6), y(front_point-10:front_point,1:1), theta, alpha, num_iters);   
      pk = (theta'*(X(front_point,:))');
      Y_result(front_point,1) = pk;
end;
% calculate the next value new_y() = theta' * x(i)

pause;

