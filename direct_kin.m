function Position_Orientation=direct_kin(q)
theta1=q(1);

theta2=q(2);

d3=q(3);

theta4=q(4);
% robot parameters
L1=1;

a1=0.5;

a2=0.5;

H_be=[cos(theta1 + theta2 + theta4), -sin(theta1 + theta2 + theta4), 0, a2*cos(theta1 + theta2) + a1*cos(theta1); 
    sin(theta1 + theta2 + theta4), cos(theta1 + theta2 + theta4), 0, a2*sin(theta1 + theta2) + a1*sin(theta1); 
    0, 0, 1, L1 - d3;
    0, 0, 0, 1];

aux_result=H_be*[0;0;0;1];

Position_Orientation=[aux_result(1:3);theta1 + theta2 + theta4];

end