function fit_data(x_train, y_train, x_test, y_test)
    for n=1:9
        disp("For n = ");disp(n);
        % model
        p_train = polyfit(x_train,y_train,n);
        % fitting data
        yfit_train = polyval(p_train,x_train);
        % error evaluation
        mse_train = mse(yfit_train,y_train);disp("mse_train=");disp(mse_train);
        r2_train = get_r2(yfit_train,y_train);disp("r2_train=");disp(r2_train);
        
        % fitting data
        yfit_test = polyval(p_train,x_test);
        % error evaluation
        mse_test = mse(yfit_test,y_test);disp("mse_test=");disp(mse_test);
        r2_test = get_r2(yfit_test,y_test); disp("r2_test=");disp(r2_test);
        
        disp("---------------")
        
    end
    
    % plot the best model
    x = [0:0.01:24];
    y = polyval(p_train,x,9);
    figure
    model = plot(x,y);
    legend('n = 9');
    xlabel('Time(hour)');
    ylabel('Traffic flow');
    title('Best Model');
    saveas(model, 'model.jpg');
    p = polyfit(x_train,y_train,9);
    disp("model coefficient:");disp(p);

end