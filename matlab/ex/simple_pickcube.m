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


%%
W_porg =  [(622+115), 196, -25.0];
R_porg =  [(622+115), 196, 25.0];
R_pint = [450.0+10, -60.0, 300.0, 220, 1, -2];

%%
W_pcub =  [140, 150, 15, 200.0, 10, -23];
W_ppck =  [140, 150, 200, 200.0, 10, -23];
W_pset = [W_pcub(1), W_pcub(2),   W_pcub(3)+5, W_pcub(4), W_pcub(5), W_pcub(6);
          W_pcub(1), W_pcub(2),     W_pcub(3), W_pcub(4), W_pcub(5), W_pcub(6);];

RV3SB_client(gripOpen);
RV3SB_client('CMD_MOVETO', W_pset );
RV3SB_client(gripClose);
RV3SB_client('CMD_MOVETO', W_ppck );
RV3SB_client(gripOpen);