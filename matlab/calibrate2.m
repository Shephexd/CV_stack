function M=calibrate2(p2,p3)
    N = length(p2);
    avrx = mean(p2');
    d2 = sum(sqrt((p2(1,:) - avrx(1)).^2 + (p2(2,:) - avrx(2)).^2))/N;
    
    p2x = sum(p2(1,:))/N;
    p2y = sum(p2(2,:))/N;
    
    T = [
        sqrt(2)/d2  0            -sqrt(2)*p2x/d2;
        0           sqrt(2)/d2   -sqrt(2)*p2y/d2;
        0           0            1;
    ];

    avrx2 = mean(p3');
    d3 = sum(sqrt((p3(1,:) - avrx2(1)).^2 + (p3(2,:) - avrx2(2)).^2 + (p3(3,:) - avrx2(3)).^2))/N;
    p3x = sum(p3(1,:))/N;
    p3y = sum(p3(2,:))/N;
    p3z = sum(p3(3,:))/N;

    U = [
            sqrt(3)/d3  0           0           -sqrt(2)*p3x/d3;
            0           sqrt(3)/d3  0           -sqrt(2)*p3y/d3;
            0           0           sqrt(3)/d3  -sqrt(2)*p3z/d3;
            0           0           0           1;
    ];

    p2 = T*p2;
    p3 = U*p3;
    
    n = size(p2,2);
    A = zeros(2*n,12);
    for i=1:n
        ind = 2*(i-1)+1;
        A(ind,:) = [p3(1:3,i)' 1 0 0 0 0 -p2(1,i)*[p3(1:3,i)' 1 ]];
        A(ind+1,:) = [0 0 0 0 p3(1:3,i)' 1 -p2(2,i)*[p3(1:3,i)' 1]];
    end
    [~,D,V] = svd(A);
    
    Mp = reshape(V(:,12),4,3)';
    M = inv(T)*Mp*U;
end

% SVD 