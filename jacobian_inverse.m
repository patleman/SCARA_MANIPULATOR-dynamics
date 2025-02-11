function q_dot_dot= jacobian_inverse(Ke_q)


Ke=Ke_q(1:4);
theta1=Ke_q(5);
theta2=Ke_q(6);

a1=0.5;

a2=0.5;


Jacobian=[- a2*sin(theta1 + theta2) - a1*sin(theta1), -a2*sin(theta1 + theta2), 0, 0; 
    a2*cos(theta1 + theta2) + a1*cos(theta1), a2*cos(theta1 + theta2), 0,0; 
    0, 0, -1, 0;
    1, 1, 0, 1];

q_dot_dot=inv(Jacobian)*Ke;

end