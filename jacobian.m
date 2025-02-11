function Xe_dot= jacobian(q,q_dot)


    theta1=q(1);
    theta2=q(2);
    
    a1=0.5;
    
    a2=0.5;
    
    Jacobian=[- a2*sin(theta1 + theta2) - a1*sin(theta1), -a2*sin(theta1 + theta2), 0, 0; 
        a2*cos(theta1 + theta2) + a1*cos(theta1), a2*cos(theta1 + theta2), 0,0; 
        0, 0, -1, 0;
        1, 1, 0, 1];
    
    Xe_dot=Jacobian*q_dot;

end
