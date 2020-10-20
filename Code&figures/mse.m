function m = mse(yfit,y0)
    N = length(yfit);
    y = yfit-y0;
    s = sum(y.^2);
    m = s/N;
end