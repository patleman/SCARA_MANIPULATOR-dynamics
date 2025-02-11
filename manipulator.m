function output=manipulator(input)

    theta1 = input(1);
    theta2 = input(2);
    d3 = input(3);
    theta4 = input(4);

    
    u1 = input(5);
    u2 = input(6);
    u3 = input(7);
    u4 = input(8);

    theta_dot_1 = input(9);
    theta_dot_2 = input(10);
    d3_dot = input(11);
    theta_dot_4 = input(12);

    ml1 = 25;
    ml2 = 25;
    ml3 = 10;
    ml4 = 5;
    Il1 = 5;
    Il2 = 5;
    Il4 = 1;
    Im1 = 0.0001;
    Im2 = 0.0001;
    Im3 = 0.01;
    Im4 = 0.005;
    a1 = 0.50;
    a2 = 0.50;
    Kr1 = 1;
    Kr2 = 1;
    Kr3 = 50;
    Kr4 = 20;
    g = 9.8;
    Fm1 = 0.0001;
    Fm2 = 0.0001;
    Fm3 = 0.01;
    Fm4 = 0.005;
    
  % B(q) matrix 
   B=[Il1 + Il2 + Il4 + Im2 + Im3 + Im4 + ml1/16 + ml2/16 - (a1*ml1)/2 - (a2*ml2)/2 + Im1*Kr1^2 + a1^2*ml1 + a1^2*ml2 + a1^2*ml3 + a2^2*ml2 + a1^2*ml4 + a2^2*ml3 + a2^2*ml4 - (a1*ml2*cos(theta2))/2 + 2*a1*a2*ml2*cos(theta2) + 2*a1*a2*ml3*cos(theta2) + 2*a1*a2*ml4*cos(theta2), Il2 + Il4 + Im3 + Im4 + ml2/16 - (a2*ml2)/2 + a2^2*ml2 + a2^2*ml3 + a2^2*ml4 + Im2*Kr2 - (a1*ml2*cos(theta2))/4 + a1*a2*ml2*cos(theta2) + a1*a2*ml3*cos(theta2) + a1*a2*ml4*cos(theta2), -Im3*Kr3, Il4 + Im4*Kr4;
    Il2 + Il4 + Im3 + Im4 + ml2/16 - (a2*ml2)/2 + a2^2*ml2 + a2^2*ml3 + a2^2*ml4 + Im2*Kr2 - (a1*ml2*cos(theta2))/4 + a1*a2*ml2*cos(theta2) + a1*a2*ml3*cos(theta2) + a1*a2*ml4*cos(theta2), Il2 + Il4 + Im3 + Im4 + ml2/16 - (a2*ml2)/2 + Im2*Kr2^2 + a2^2*ml2 + a2^2*ml3 + a2^2*ml4, -Im3*Kr3, Il4 + Im4*Kr4; 
    -Im3*Kr3, -Im3*Kr3, Im3*Kr3^2 + ml3 + ml4, 0;
    Il4 + Im4*Kr4, Il4 + Im4*Kr4,0, Im4*Kr4^2 + Il4];

    C=[-theta_dot_2*(a1*a2*ml2*sin(theta2) - (a1*ml2*sin(theta2))/4 + a1*a2*ml3*sin(theta2) + a1*a2*ml4*sin(theta2)), - theta_dot_1*(a1*a2*ml2*sin(theta2) - (a1*ml2*sin(theta2))/4 + a1*a2*ml3*sin(theta2) + a1*a2*ml4*sin(theta2)) - theta_dot_2*(a1*a2*ml2*sin(theta2) - (a1*ml2*sin(theta2))/4 + a1*a2*ml3*sin(theta2) + a1*a2*ml4*sin(theta2)), 0, 0;
       theta_dot_1*(a1*a2*ml2*sin(theta2) - (a1*ml2*sin(theta2))/4 + a1*a2*ml3*sin(theta2) + a1*a2*ml4*sin(theta2)), 0, 0, 0;
       0, 0, 0, 0; 
       0, 0, 0, 0];
 
    Gq = [0; 0; -(ml3+ml4)*g; 0];


    F = [Kr1^2*Fm1 0 0 0;0 Kr2^2*Fm2 0 0;0 0 Kr3^2*Fm3 0;0 0 0 Kr4^2*Fm4];
  
    
    Torque = [u1;u2;u3;u4];
    taux= C*[theta_dot_1 theta_dot_2 d3_dot theta_dot_4]'+F*[theta_dot_1 theta_dot_2 d3_dot theta_dot_4]'+Gq;
    
    output = B\(Torque-taux);
    
    
end