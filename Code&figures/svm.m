function svm(x_train,y_train,x_test,y_test)
    % SVM + kernel 1
    disp("-------Gaussian-------");
    disp("CASE1 - default:"); %default
    model1_1 = fitrsvm(x_train,y_train,'KernelFunction','gaussian'); 
    yfit1_1 = predict(model1_1,x_test); 
    mse1_1 = mse(yfit1_1,y_test); disp("mse =");disp(mse1_1);
    r21_1= get_r2(yfit1_1,y_test);disp("r2 ="); disp(r21_1);
    
    disp("CASE2:"); %case2
    model1_2 = fitrsvm(x_train,y_train,'KernelFunction','gaussian','BoxConstraint',50);
    yfit1_2 = predict(model1_2,x_test); 
    mse1_2 = mse(yfit1_2,y_test); disp("mse ="); disp(mse1_2);
    r21_2= get_r2(yfit1_2,y_test);disp("r2 ="); disp(r21_2);
    
    disp("CASE3:"); %case3
    model1_3 = fitrsvm(x_train,y_train,'KernelFunction','gaussian','BoxConstraint',100);
    yfit1_3 = predict(model1_3,x_test); 
    mse1_3 = mse(yfit1_3,y_test); disp("mse =");disp(mse1_3);
    r21_3= get_r2(yfit1_3,y_test);disp("r2 ="); disp(r21_3);
    
    disp("OPTIMIZED:"); %optimized case
    mdl1= fitrsvm(x_train,y_train, 'KernelFunction','gaussian', 'OptimizeHyperparameters', 'auto', 'HyperparameterOptimizationOptions', struct('AcquisitionFunctionName', 'expected-improvement-plus'));
    yfit1 = predict(mdl1,x_test);
    mse1 = mse(yfit1,y_test); disp("mse ="); disp(mse1);
    r21= get_r2(yfit1,y_test);disp("r2 ="); disp(r21);
    
    figure
    FigH = figure;
    plot(x_test,y_test,x_test,yfit1_1,x_test,yfit1_2,x_test,yfit1_3,x_test,yfit1);
    legend('actual data','case 1','case 2','case 3','optimized');
    xlabel('June 30, 2016 (Thursday)');
    ylabel('Traffic flow');
    title('SVM + Gaussian');
    saveas(FigH, 'gaussian.jpg');
    
    
    % SVM + kernel 2
    disp("-------RBF-------");
    disp("CASE1 - default:"); %default
    model2_1 = fitrsvm(x_train,y_train,'KernelFunction','rbf'); 
    yfit2_1 = predict(model2_1,x_test); 
    mse2_1 = mse(yfit2_1,y_test); disp("mse =");disp(mse2_1);
    r22_1= get_r2(yfit2_1,y_test);disp("r2 ="); disp(r22_1);
    
    disp("CASE2:"); %case2
    model2_2 = fitrsvm(x_train,y_train,'KernelFunction','rbf','BoxConstraint',100); 
    yfit2_2 = predict(model2_2,x_test); 
    mse2_2 = mse(yfit2_2,y_test); disp("mse =");disp(mse2_2);
    r22_2= get_r2(yfit2_2,y_test);disp("r2 ="); disp(r22_2);
    
    disp("CASE3:"); %case3
    model2_3 = fitrsvm(x_train,y_train,'KernelFunction','rbf','BoxConstraint',300); 
    yfit2_3 = predict(model2_3,x_test); 
    mse2_3 = mse(yfit2_3,y_test); disp("mse =");disp(mse2_3);
    r22_3= get_r2(yfit2_3,y_test);disp("r2 ="); disp(r22_3);   
    
    disp("OPTIMIZED:"); %optimized case
    mdl2= fitrsvm(x_train,y_train, 'KernelFunction','rbf', 'OptimizeHyperparameters', 'auto', 'HyperparameterOptimizationOptions', struct('AcquisitionFunctionName', 'expected-improvement-plus'));
    yfit2 = predict(mdl2,x_test);
    mse2 = mse(yfit2,y_test); disp("mse ="); disp(mse2);
    r22= get_r2(yfit2,y_test);disp("r2 ="); disp(r22);
    
    figure
    FigH = figure;
    plot(x_test,y_test,x_test,yfit2_1,x_test,yfit2_2,x_test,yfit2_3,x_test,yfit2);
    legend('actual data','case 1','case 2','case 3','optimized');
    xlabel('June 30, 2016 (Thursday)');
    ylabel('Traffic flow');
    title('SVM + RBF');
    saveas(FigH, 'rbf.jpg');
    
    % SVM + kernel 3
    disp("-------Polynomial-------");
    disp("CASE1 - default:"); %default
    model3_1 = fitrsvm(x_train,y_train,'KernelFunction','polynomial','Standardize',true); %default
    yfit3_1 = predict(model3_1,x_test); 
    mse3_1 = mse(yfit3_1,y_test); disp("mse =");disp(mse3_1);
    r23_1= get_r2(yfit3_1,y_test);disp("r2 ="); disp(r23_1);
    
    disp("CASE2:"); %case2
    model3_2 = fitrsvm(x_train,y_train,'KernelFunction','polynomial','Standardize',true,'PolynomialOrder',5);
    yfit3_2 = predict(model3_2,x_test); 
    mse3_2 = mse(yfit3_2,y_test); disp("mse =");disp(mse3_2);
    r23_2= get_r2(yfit3_2,y_test);disp("r2 ="); disp(r23_2);
    
    disp("CASE3:"); %case3
    model3_3 = fitrsvm(x_train,y_train,'KernelFunction','polynomial','Standardize',true,'PolynomialOrder',10);
    yfit3_3 = predict(model3_3,x_test); 
    mse3_3 = mse(yfit3_3,y_test); disp("mse =");disp(mse3_3);
    r23_3= get_r2(yfit3_3,y_test);disp("r2 ="); disp(r23_3);
    
    disp("OPTIMIZED:"); %optimized case
    mdl3= fitrsvm(x_train,y_train, 'KernelFunction','polynomial', 'Standardize',true,'OptimizeHyperparameters', 'auto', 'HyperparameterOptimizationOptions', struct('AcquisitionFunctionName', 'expected-improvement-plus'));
    yfit3 = predict(mdl3,x_test);
    mse3 = mse(yfit3,y_test); disp("mse ="); disp(mse3);
    r23= get_r2(yfit3,y_test);disp("r2 ="); disp(r23);
    
    figure
    FigH = figure;
    plot(x_test,y_test,x_test,yfit3_1,x_test,yfit3_2,x_test,yfit3_3,x_test,yfit3);
    legend('actual data','case 1','case 2','case 3','optimized');
    xlabel('June 30, 2016 (Thursday)');
    ylabel('Traffic flow');
    title('SVM + Polynomial');
    saveas(FigH,'poly.jpg');
    
    figure
    FigH = figure;
    x = x_test;
    y1 = predict(model1_1,x);
    y2 = predict(model2_1,x);
    y3 = predict(model3_3,x);
    p = polyfit(x_test,y_test,9);
    y_lsr = polyval(p,x,9);
    plot(x,y_test,x,y1,'-o',x,y2,'g-*',x,y3,'m-x',x,y_lsr,'r--s');
    legend('actual data','SVM+Gaussian','SVM+RBF','SVM+Polynomial','LSR')
    xlabel('June 30, 2016 (Thursday)');
    ylabel('Traffic flow');
    title('Best Predictions for Different Models');
    saveas(FigH, 'best.jpg');

end