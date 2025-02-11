function output=n(input)

    theta2=input(6);
   
    theta_dot_1=input(1);
    theta_dot_2=input(2);
    d3_dot=input(3);
    theta_dot_4=input(4);

    ml1 = 25;
    ml2 = 25;
    ml3 = 10;
    ml4 = 5;
   
    a1 = 0.5;
    a2 = 0.5;

    Kr1 = 1;
    Kr2 = 1;
    Kr3 = 50;
    Kr4 = 20;
    g = 9.8;

    Fm1 = 0.0001;
    Fm2 = 0.0001;
    Fm3 = 0.01;
    Fm4 = 0.005;

    C=[-theta_dot_2*(a1*a2*ml2*sin(theta2) - (a1*ml2*sin(theta2))/4 + a1*a2*ml3*sin(theta2) + a1*a2*ml4*sin(theta2)), - theta_dot_1*(a1*a2*ml2*sin(theta2) - (a1*ml2*sin(theta2))/4 + a1*a2*ml3*sin(theta2) + a1*a2*ml4*sin(theta2)) - theta_dot_2*(a1*a2*ml2*sin(theta2) - (a1*ml2*sin(theta2))/4 + a1*a2*ml3*sin(theta2) + a1*a2*ml4*sin(theta2)), 0, 0;
       theta_dot_1*(a1*a2*ml2*sin(theta2) - (a1*ml2*sin(theta2))/4 + a1*a2*ml3*sin(theta2) + a1*a2*ml4*sin(theta2)), 0, 0, 0;
       0, 0, 0, 0; 
       0, 0, 0, 0];
 
    Gq = [0; 0; -(ml3+ml4)*g; 0];


    F = [Kr1^2*Fm1 0 0 0;0 Kr2^2*Fm2 0 0;0 0 Kr3^2*Fm3 0;0 0 0 Kr4^2*Fm4];

    output = C*[theta_dot_1;theta_dot_2;d3_dot;theta_dot_4]+F*[theta_dot_1;theta_dot_2 ;d3_dot;theta_dot_4]+Gq;
end