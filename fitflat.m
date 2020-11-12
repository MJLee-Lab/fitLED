function params = fitflat(time,LF)

time_array = linspace(0,max(time),100);  %100 pt xarray for time values between 0 and 48 hrs
% Fit options for linear fit
fitopt = fitoptions('Method','NonlinearLeastSquares',...
    'Lower',0,...   % min Emax
    'Upper',1,...   % max Emax
    'Startpoint',0.5);
flin = fittype('a+0*x','options',fitopt);

[fit_flat, gof_flat] = fit(time, LF, flin);

% As long as no error in fitting occured, run F-Test

%     Nparam = 4;
%     Nparam_flat = 1;
%     RSS2 = gof.sse;
%     RSS1 = gof_flat.sse;
%     df1 = (Nparam -Nparam_flat);
%     df2 = (length(y_norm) -Nparam +1);
%     F = ( (RSS1-RSS2)/df1 )/( RSS2/df2 );
%     pval = 1-fcdf(F, df1, df2);

time_array = linspace(0,max(time),100)';  %100 pt xarray for time values between 0 and 48 hrs
y_array = fit_flat(time_array);
AUC = trapz(time_array,fit_flat(time_array));
params = {[time,LF],[time_array,y_array],fit_flat.a,max(time),0,0,max(LF),AUC,'Linear'}; 
        
end 