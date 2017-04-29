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

RV3SB_client(stopRobot);


