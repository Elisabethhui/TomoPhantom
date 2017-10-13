% Script to generate 3D analytical phantoms
% If one needs to modify/add phantoms just edit Phantom3DLibrary.dat

close all;clc;clear all;
% adding paths
addpath('../functions/'); addpath('../functions/models/');


ModelNo = 01; % Select a model
% Define phantom dimensions
N = 256; % x-y-z size (cubic image)

% generate 3D phantom:
cd ../functions/
[G] = buildPhantom3D(ModelNo,N);
cd ../matlab/

% check the cenral slice
figure(1); imshow(G(:,:,round(0.5*N)), []);

% see the whole 3D Phantom
figure(2);
filename = strcat('ModelNo',num2str(ModelNo));
counter = 1;
for i = 1:N
    imshow(G(:,:,i), [0 1]);
    pause(0.01);
    
    % write tiff images
%     IM = im2uint16(G(:,:,i));
%     setStrNo = num2str(counter);
%     if (counter < 10)
%         filename_save = strcat(filename,'_','000',setStrNo, '.tiff');
%     elseif ((counter >= 10) &&  (counter < 100))
%         filename_save = strcat(filename,'_','00',setStrNo,'.tiff');
%     elseif ((counter >= 100) &&  (counter < 1000))
%         filename_save = strcat(filename,'_','0',setStrNo, '.tiff');
%     else
%         filename_save = strcat(filename,'_',setStrNo, '.tiff');
%     end
%     imwrite(IM,filename_save,'tiff');
%     counter = counter + 1;
end
close (figure(2));
%%
% generate angles
% max_anlges = 300;
% angles = linspace(0,179.9,max_anlges); % projection angles
% P = 367;
% % generate the 3D analytical parallel beam sinogram
% tic;
% [F_a] = buildSino3D(ModelNo,G,P,angles);
% toc;
% figure; imshow(F_a(:,:,105), []);
%%