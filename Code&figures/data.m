function [x_train, y_train, x_test, y_test]=data()
    % import data
    T = readtable('A1081 June.csv','HeaderLines',3);

    % training data: June 2, 9, 16, 23
    train = T(T.LocalDate==datetime(2016,6,2)|T.LocalDate==datetime(2016,6,9)|T.LocalDate==datetime(2016,6,16)|T.LocalDate==datetime(2016,6,23),{'LocalTime','TotalCarriagewayFlow'}); 
    % test data: June 30
    test = T(T.LocalDate==datetime(2016,6,30),{'LocalTime','TotalCarriagewayFlow'});
    
    % specify train data
    x_train = hours(train{:,'LocalTime'});
    y_train = train{:,'TotalCarriagewayFlow'};
    
    % specify test data
    x_test = hours(test{:,'LocalTime'});
    y_test = test{:,'TotalCarriagewayFlow'};
    
end