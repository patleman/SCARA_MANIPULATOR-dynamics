

figure('Name','Joint Position')
subplot(4,1,1); plot(t, ans.joint(:,1));title('Joint1')
subplot(4,1,2); plot(t, ans.joint(:,2));title('Joint2 ')
subplot(4,1,3); plot(t, ans.joint(:,3));title('Joint 3')
subplot(4,1,4); plot(t, ans.joint(:,4));title('Joint 4')


figure('Name','Joint Velocity Error')
subplot(4,1,1); plot(t, ans.joint_velocity_error(:,1));title('Joint1 velocity Error')
subplot(4,1,2); plot(t, ans.joint_velocity_error(:,2));title('Joint2 velocity Error')
subplot(4,1,3); plot(t, ans.joint_velocity_error(:,3));title('Joint3 velocity Error')
subplot(4,1,4); plot(t, ans.joint_velocity_error(:,4));title('Joint4 velocity Error')

figure('Name','Joint Error')
subplot(4,1,1); plot(t, ans.joint_error(:,1));title('Joint1 Error')
subplot(4,1,2); plot(t, ans.joint_error(:,2));title('Joint2 Error')
subplot(4,1,3); plot(t, ans.joint_error(:,3));title('Joint3 Error')
subplot(4,1,4); plot(t, ans.joint_error(:,4));title('Joint4 Error')

XP=zeros(3,4001);

for i=1:1:4001
    theta1=ans.joint(i,1);
    theta2=ans.joint(i,2);
    d3=ans.joint(i,3);
    theta4=ans.joint(i,4);
    % robot parameters
    L1=1;
    
    a1=0.5;
    
    a2=0.5;
    
    H_be=[cos(theta1 + theta2 + theta4), -sin(theta1 + theta2 + theta4), 0, a2*cos(theta1 + theta2) + a1*cos(theta1); 
        sin(theta1 + theta2 + theta4), cos(theta1 + theta2 + theta4), 0, a2*sin(theta1 + theta2) + a1*sin(theta1); 
        0, 0, 1, L1 - d3;
        0, 0, 0, 1];
    
    aux_result=H_be*[0;0;0;1];
    XP(:,i)=aux_result(1:3);

end
figure('Name','End-Effector Trajectory')
plot3(XP(1,:),XP(2,:),XP(3,:));
