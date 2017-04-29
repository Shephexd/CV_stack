imgC = imread('0003.bmp'); %calibration image
imgT = imread('0004.bmp'); %Test image

%I = rgb2gray(Cimg);
%BK = edge(I,'Canny',0.08);

imshow(imgC)
bs = ;
Wp = [0.0   bs      0.0     bs      bs      0.0     bs;
      bs   bs      0.0     0.0     bs      0.0     0.0;
      bs   bs      bs      bs      0.0     0.0     0.0;
     1.0    1.0     1.0     1.0     1.0     1.0     1.0;
];

N=7;

points = ginput(N);
Ip = [points ones(N,1)]';
%% Normalized Calibration Test
M = calibrate2(Ip, Wp);
[K, R, C] = Pdecomp(M);

X = Wp;
xp = M*X;
Xp = pinv(M)*Ip;
for i =1:3
    xp(i,:) = xp(i,:) ./ xp(3,:);
end

%%
imshow(imgC)
hold on
plot(Ip(1,:),Ip(2,:),'rx')
plot(xp(1,:),xp(2,:),'ro')


%%
% Wpt = [
%         2.5   1.5   5.5;
%         1.5   3.5   3.5;
%         0.0   0.0   0.0;
%         1.0   1.0   1.0;
% ];

Wpt = [
        1.5   -0.5   3.5;
        -0.5   1.5   1.5;
        0.0   0.0   0.0;
        1.0   1.0   1.0;
];

Wpt(1,:) = Wpt(1,:) * bs;
Wpt(2,:) = Wpt(2,:) * bs;
Wpt(3,:) = Wpt(3,:) * bs;

xp2 = M*Wpt;
for i =1:3
    xp2(i,:) = xp2(i,:) ./ xp2(3,:);
end

figure
imshow(imgT)
hold on
plot(xp2(1,:),xp2(2,:),'ro')

%%
rp = ginput(3);
rp2 = [rp ones(3,1)]';

%% Fitting parameter
d=sum((rp2(:,1) - xp2(:,1)).^2);
J=sqrt(d);
f= 0.5*d^2;

error(1)
error(2)

R(1:3,4) %t
R(1:3,1:3) %R



%% Robot Localization
%World frame test
P(:,1) = [0,0,0,1]';
P(:,2) = [0,0,1,1]';
P(:,3) = [0,1,0,1]';
P(:,4) = [1,0,0,1]';

%Robot frame test
Q(:,1) = [-1,0,1,1]';
Q(:,2) = [-1,0,2,1]';
Q(:,3) = [-1.644,.765,1.0,1]';
Q(:,4) = [-.235,.644,1.0,1]';

[R2,t] = absor(P,Q);
R2(1:3,4) = t(1:3);
%R*P + t

R2*P
Q
inv(R2)*Q




%% Robot Localization
%World frame test
P(:,1) = [0.5,0.5,0,1]';
P(:,2) = [0.5,2.5,0,1]';
P(:,3) = [0.5,1.5,0,1]';

P(:,4) = [1.5,1.5,0,1]';

%Robot frame test
Q(:,1) = [520,-58,50,1]';
Q(:,2) = [570,-58,50,1]';
Q(:,3) = [470,-58,0,1]';
Q(:,4) = [470,-108,50,1]';



[R2,t] = absor(P,Q);
R2(1:3,4) = t(1:3);
%R*P + t

R2*P
Q
inv(R2)*Q
