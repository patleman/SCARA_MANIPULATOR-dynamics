function J_dot=jacobian_dot(q_a_q_dot)
% q_a_q_dot= q an q_dot concatenated as one vector
%            first four elements for q, next 4 elements for q_dot
theta1=q_a_q_dot(1);
theta2=q_a_q_dot(2);
%d3=q_a_q_dot(3);
%theta4=q_a_q_dot(4);

theta1_dot=q_a_q_dot(5);
theta2_dot=q_a_q_dot(6);
d3_dot=q_a_q_dot(7);
theta4_dot=q_a_q_dot(8);

q_dot=[theta1_dot;theta2_dot;d3_dot;theta4_dot];

a1=0.5;
a2=0.5;

J_dot_pre=[- a2*cos(theta1 + theta2)*(theta1_dot + theta2_dot) - a1*cos(theta1)*theta1_dot, -a2*cos(theta1 + theta2)*(theta1_dot + theta2_dot), 0, 0;
    - a2*sin(theta1 + theta2)*(theta1_dot + theta2_dot) - a1*sin(theta1)*theta1_dot, -a2*sin(theta1 + theta2)*(theta1_dot+ theta2_dot), 0, 0;
    0, 0,0, 0;
    0, 0, 0, 0];
J_dot=J_dot_pre*q_dot;
end