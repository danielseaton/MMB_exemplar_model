function output = objective_function(P,data)

P0 = P;

%Initialise output
output = 0;


%Compare to experimental data

%Wild type
[T,Y] = simulate_experiment(P);

Tsample = data.WT.T;
Ysample = interp1q(T,Y,Tsample);

PUL1_diff = mean((Ysample(:,1) - data.WT.PUL1).^2)^0.5;
PUL2_diff = mean((Ysample(:,2) - data.WT.PUL2).^2)^0.5;
PUL3_diff = mean((Ysample(:,3) - data.WT.PUL3).^2)^0.5;
PUL4_diff = mean((Ysample(:,4) - data.WT.PUL4).^2)^0.5;

output = output+PUL1_diff+PUL2_diff+PUL3_diff+PUL4_diff;
% output = output+PUL1_diff+PUL2_diff;

%pul2 mutant
P = P0;
P([4,5]) = 0;
[T,Y] = simulate_experiment(P);

Tsample = data.WT.T;
Ysample = interp1q(T,Y,Tsample);

PUL1_diff = mean((Ysample(:,1) - data.pul2.PUL1).^2)^0.5;
PUL2_diff = mean((Ysample(:,2) - data.pul2.PUL2).^2)^0.5;
PUL3_diff = mean((Ysample(:,3) - data.pul2.PUL3).^2)^0.5;
PUL4_diff = mean((Ysample(:,4) - data.pul2.PUL4).^2)^0.5;

%Add to output
output = output+PUL1_diff+PUL2_diff+PUL3_diff+PUL4_diff;
% output = output+PUL1_diff+PUL2_diff;
output = real(output);