function [ R,t ] = absor( P1,P2 )

%ABSOR Summary of this function goes here
%   Detailed explanation goes here
n = size(P1,2);

mP1 = mean(P1,2);
mP2 = mean(P2,2);
Q1 = P1 - repmat(mP1,1,n);
Q2 = P2 - repmat(mP2,1,n);

H = Q1*Q2';

[U,D,V] = svd(H);
R = V*U';
if det(R)<0
    warning 'error'
end


t = mP2 - R*mP1;

end
