function [params headers] = fitLED(time, LF)

    if LF(end) <= (min(LF)*2) %0.16 (min(y_norm)*2)
        params = fitflat(time,LF);
        headers = {'scatter_LF','plot_LED','y0','D0','Dr','plateau','max_LF','AUC','fit_type'};
        return
    end
    
        time_array = linspace(0,max(time),100);  %100 pt xarray for time values between 0 and 48 hrs
        init = [0.01 max(LF) 5 0];
        bounds = [0 0 0 0; 2 1 max(time) 0.5];
        
        fitopt = fitoptions('Method','NonlinearLeastSquares');
        fitopt.Lower = bounds(1,:);
        fitopt.Upper = bounds(2,:);
        fitopt.StartPoint = init;
        
        fitfun = fittype('y0 * (x <= x0) + [y0 + (plat - y0) * (1 - exp(-k * (x-x0)))] .* (x > x0)','options',fitopt);
             
        [fitresult, gof] = fit(time,LF,fitfun);          
        
        y_array = fitresult(time_array);
        
        AUC = trapz(time_array,fitresult(time_array));
        params = {[time,LF],[time_array',y_array],fitresult.y0,fitresult.x0,fitresult.k,fitresult.plat,max(LF),AUC,'LED'};
        headers = {'scatter_LF','plot_LED','y0','D0','Dr','plateau','max_LF','AUC','fit_type'};
end