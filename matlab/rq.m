function [ R,Q ] = rq( KR )
%RQ Summary of this function goes here
%   Detailed explanation goes here
    [Q,R] = qr(flipud(KR)');
    R = flipud(R');
    R = fliplr(R);
    Q = Q';
    Q = flipud(Q);
end
