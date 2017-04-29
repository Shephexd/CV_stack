close all; clear all; clc;

% set student team id
team_id = 7;

% path to robot vision root
path_robotvision = '/opt/robotvision';

% path to students directory
path_teamdir = ['/opt/robotvision/students/team', num2str(team_id,'%0.2d')];
path_temp = '~/Documents/';
% initialize paths
addpath(fullfile(path_robotvision,'bin'));
cd(path_robotvision);

% install_RV3SB_client;
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


% run RV3SB_client
img = RV3SB_client(grabImage);
imshow(img);

% imwrite(img,[path_students,'team07/','0019.bmp']);
% imwrite(img,[path_temp,'0029.bmp']);

% r = img(:,:,1);
% g = img(:,:,2);
% b = img(:,:,3);
% % idx = 1:4:1920;
% % calib_im = reshape(calib_im,[1080,1920,3]);
% subplot(2,2,1)
% imshow(img);
% subplot(2,2,2)
% imshow(r);
% subplot(2,2,3)
% imshow(g);
% subplot(2,2,4)
% imshow(b);




