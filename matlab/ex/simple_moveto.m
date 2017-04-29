close all; clear all; clc;

% set student team id
team_id = 6;

% path to robot vision root
path_robotvision = '/opt/robotvision';

% path to students directory
path_teamdir = ['/opt/robotvision/students/team', num2str(team_id,'%0.2d')];

% initialize paths
addpath(fullfile(path_robotvision,'bin'));
cd(path_robotvision);

install_RV3SB_client;
% run RV3SB_server

cd([path_robotvision,'/bin'])
% robot command flags
% Robot commands
% CMD_GRIP_OPEN:  Open the grip of the robotic hand.
% CMD_GRIP_CLOSE: Close the grip of the robotic hand.
% CMD_MOVETO:     Move robot according to additional argument M.
% CMD_GRAB_IMAGE: Acquire an image and return it as output I (in this test
%                 interface the image is read from disk; the returned image
%                 can be changed by editing RV3SB_client_stub.m).
% CMD_STOP:       Stop and shutdown the server software.

gripOpen = 'CMD_GRIP_OPEN';
gripClose = 'CMD_GRIP_CLOSE';
moveTo = 'CMD_MOVETO';
grabImage = 'CMD_GRAB_IMAGE';
stopRobot = 'CMD_STOP';

% P = [X, Y, Z, A, B, C; ... ; ...];
W_porg =  [(622+115), 196, -25.0];
R_porg =  [(622+115), 196, 25.0];
R_pint = [450.0+10, 0.0, 50.0, 180, 10, 50];

%%
R_pset1 = R_pint;
R_pset1(1,1) = R_pset1(1,1) ;
R_pset1(1,2) = R_pset1(1,2) + 200;
R_pset1(1,3) = 200;
W_pset1 = R_pset1;

W_pset1(1) = -R_pset1(1) + W_porg(1);
W_pset1(2) = -R_pset1(2) + W_porg(2);
W_pset1(3) =  R_pset1(3) + W_porg(3);


ret
R_pset2 = W_pset1;
R_pset2(1) = -W_pset1(1) + R_porg(1);
R_pset2(2) = -W_pset1(2) + R_porg(2);
R_pset2(3) =  W_pset1(3) + R_porg(3);

W_pset1
R_pset1
R_pset2

%%
% W_pcub =  [235, 403, 25, 100.0, 10, 155.0];
% W_pset = [W_pcub(1), W_pcub(2), W_pcub(3)+100, W_pcub(4),W_pcub(5), W_pcub(6);
%           W_pcub(1), W_pcub(2),     W_pcub(3), W_pcub(4),W_pcub(5), W_pcub(6);];
% R_pset = W_pset;
% 
% R_pset(:,1) = -W_pset(:,1) + ones(2,1)*R_porg(1);
% R_pset(:,2) = -W_pset(:,2) + ones(2,1)*R_porg(2);
% R_pset(:,3) =  W_pset(:,3) + ones(2,1)*R_porg(3);
% 
% 
% 
% R_pset(:,1) = -W_pset(:,1) + ones(2,1)*R_porg(1);
% R_pset(:,2) = -W_pset(:,2) + ones(2,1)*R_porg(2);
% R_pset(:,3) =  W_pset(:,3) + ones(2,1)*R_porg(3);
% 
% 
% 
W_pset1
% R_pset


RV3SB_client('CMD_MOVETO', W_pset1 );


