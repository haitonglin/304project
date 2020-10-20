function plot_alldata(x_train, y_train, x_test, y_test)
    figure
    fig = scatter(x_train,y_train,10,'filled');
    hold on
    fig = scatter(x_test,y_test,10,'filled');    
    legend('train data','test data');  
    xlabel('Time(hour)');
    ylabel('Traffic flow');
    title('All Data');
    saveas(fig,'alldata.jpg');
end