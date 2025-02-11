clear all
close all
clc
vrclear
vrclose

load('generated_traj.mat');% mat file from part 1
control;
sim('control.slx', t);
%SCARA_VR_VISUALIZE(squeeze(q(:,1,:)), false);
results