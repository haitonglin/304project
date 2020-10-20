[x_train, y_train, x_test, y_test]= data(); % load data

% Project part 1
disp("--------Project part 1----------");
plot_alldata(x_train, y_train, x_test, y_test); % plot all data
fit_data(x_train, y_train, x_test, y_test); % fitting data & plot the best model

% Project part 2
disp("--------Project part 2----------");
svm(x_train,y_train,x_test,y_test); % svm model fitting & plots