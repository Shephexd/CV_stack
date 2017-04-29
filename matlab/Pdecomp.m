function [K, R, C] = Pdecomp(M)

    [K,R] = rq(M);
    C = ones(4,1);

    C(1) = det([M(:,2),M(:,3),M(:,4)]);
    C(2) = -det([M(:,1),M(:,3),M(:,4)]);
    C(3) = det([M(:,1),M(:,2),M(:,4)]);
    C(4) = -det([M(:,1),M(:,2),M(:,3)]);
end