%%

close all; clear all; clc;
%%
% set student team id
team_id = 7;

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

%% move to pint
R_pint = [500, 0.0, 300, -177.00, 0, 166.00];

W_pint = R_pint;
W_pint(1) = -R_pint(1) + W_porg(1);
W_pint(2) = -R_pint(2) + W_porg(2);
W_pint(3) =  R_pint(3) + W_porg(3);

R_pint
W_pint
RV3SB_client('CMD_MOVETO', W_pint );

%% move to pset
W_pset =  [63+100-50, 129+200, 25, -177.00, 0, 166.00];
% W_pset = [W_pset(1), W_pset(2), W_pset(3)+100, W_pset(4),W_pset(5), W_pset(6);
%          W_pset(1), W_pset(2),     W_set(3), W_pset(4),W_pset(5), W_pset(6);];

R_pset = W_pset;

R_pset(1,1) = -W_pset(1,1) + ones(size(W_pset,1),1)*R_porg(1);
R_pset(1,2) = -W_pset(1,2) + ones(size(W_pset,1),1)*R_porg(2);
R_pset(1,3) =  W_pset(1,3) + ones(size(W_pset,1),1)*R_porg(3);
R_pset 
W_pset

RV3SB_client('CMD_MOVETO', W_pset );

%% stop robot
RV3SB_client('CMD_STOP' );


