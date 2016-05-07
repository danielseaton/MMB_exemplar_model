
opt_results = load('optimisation_run_fmincon_2');
P0 = opt_results.Popt;


[T,Y] = simulate_experiment(P0);

peak_PUL1_basal = max(Y(:,1));


nP = length(P0);
deltaP = 0.01;
sens = zeros(nP,1);


for i = 1:nP

    P = P0;
    P(i) = P(i)*(1+deltaP);
    
    [T,Y] = simulate_experiment(P);
    
    peak_PUL1 = max(Y(:,1));
    sens(i) = (peak_PUL1-peak_PUL1_basal)/deltaP;
end
 
save('sensitivity_analysis_results','sens','deltaP','peak_PUL1_basal')
