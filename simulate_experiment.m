function [T,Y] = simulate_experiment(P)
%Simulate an experiment
P0 = P;

y0 = [1,1,1,1];
options = odeset('AbsTol',1e-9,'RelTol',1e-9);

%Obtain initial conditions, with no synthesis of PUL1 (i.e. no stimulus)
P = P0;
P([1,2,3]) = 0;
[T,Y] = ode15s(@(t,y) model_dynamics(t,y,P),[0,60],y0,options);
y0 = Y(end,:)';

%Simulate stimulus
P = P0;
[T,Y] = ode15s(@(t,y) model_dynamics(t,y,P),[0,14],y0,options);