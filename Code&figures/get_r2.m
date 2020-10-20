function err = get_r2(A,B)
    n = length(A);
    C = A.*B;
    
    err = (n*sum(C) - sum(A) * sum(B))^2/((n*sum(A.^2) - sum(A)^2)*(n*sum(B.^2) - sum(B)^2)); 
end
