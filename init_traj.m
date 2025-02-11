%main code
clear all;
close all;
clc
Ts=0.001;
%trapezoidal profile in x,y,z space for position (4 segment ; 5 points)
% initial and final point in 3d space
p0=[0;-0.80;0];% point 1
p1=[0;-0.80;0.5];% point 2
p2=[0.5;-0.6;0.5];%  point 3
p3=[0.8;0;0.5];% point 4
p4=[0.8;0;0];% point 5

waypoints=[p0 p1 p2 p3 p4];
% sampling time set
%Ts=0.001;

% variables to hold position, velocity and acceleration
pd=zeros(3,4001);
pd_dot=zeros(3,4001);
pd_dot_dot=zeros(3,4001);

ts=0:Ts:4;
t0=0;
t1=0.6;
t2=2;
t3=3.4;
t4=4;

% anticipation time small_del_t=0.2
sdt=0.2;

% capital del: advance time
dt0=0;

% advance time for 4 segments
dt1=dt0+0;%sdt;0
dt2=dt1+sdt;%0.2
dt3=dt2+sdt;% 0.4
dt4=dt3+sdt;% 0.6


% Defining tangent unit vector 
T1=(p1-p0)/norm(p1-p0);
T2=(p2-p1)/norm(p2-p1);
T3=(p3-p2)/norm(p3-p2);
T4=(p4-p3)/norm(p4-p3);

%Structuring Data
T=[T1 T2 T3 T4];% list of tangent unit vectors
ta=[t0;t1-dt1;t2-dt2;t3-dt3;t4-dt4];% list of time instances with time advancements

ti=[t0;t1-dt2;t2-dt3;t3-dt4];

Na=[norm(p1-p0);norm(p2-p1);norm(p3-p2);norm(p4-p3)];% list of norms of segments

j=1;
i=1;
for t=0:Ts:t4-dt4
    
   if(t>=0 && t<0.4) % only s1
        j=1;
        pd(:,i)=waypoints(:,j)+(Trapezoidal_p(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot(:,i)=(Trapezoidal_pd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot_dot(:,i)=(Trapezoidal_pdd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);

   elseif (t>=0.4 && t<0.6) % s1 and s2
        j=1;
        pd(:,i)=waypoints(:,j)+(Trapezoidal_p(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot(:,i)=(Trapezoidal_pd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot_dot(:,i)=(Trapezoidal_pdd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);

        j=2;
        pd(:,i)=pd(:,i)+(Trapezoidal_p(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot(:,i)=pd_dot(:,i)+(Trapezoidal_pd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot_dot(:,i)=pd_dot_dot(:,i)+(Trapezoidal_pdd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);

   elseif (t>=0.6 && t<1.6) % only s2
        j=2;
        pd(:,i)=waypoints(:,j)+(Trapezoidal_p(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot(:,i)=(Trapezoidal_pd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot_dot(:,i)=(Trapezoidal_pdd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);

   elseif (t>=1.6 && t<1.8) % s2 and s3
       j=2;
        pd(:,i)=waypoints(:,j)+(Trapezoidal_p(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot(:,i)=(Trapezoidal_pd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot_dot(:,i)=(Trapezoidal_pdd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);

        j=3;
        pd(:,i)=pd(:,i)+(Trapezoidal_p(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot(:,i)=pd_dot(:,i)+(Trapezoidal_pd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot_dot(:,i)=pd_dot_dot(:,i)+(Trapezoidal_pdd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);

   elseif (t>=1.8 && t<2.8) % only s3
        j=3;
        pd(:,i)=waypoints(:,j)+(Trapezoidal_p(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot(:,i)=(Trapezoidal_pd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot_dot(:,i)=(Trapezoidal_pdd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);

   elseif (t>=2.8 && t<3.0) % s3 and s4
        j=3;
        pd(:,i)=waypoints(:,j)+(Trapezoidal_p(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot(:,i)=(Trapezoidal_pd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot_dot(:,i)=(Trapezoidal_pdd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);

        j=4;
        pd(:,i)=pd(:,i)+(Trapezoidal_p(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot(:,i)=pd_dot(:,i)+(Trapezoidal_pd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot_dot(:,i)=pd_dot_dot(:,i)+(Trapezoidal_pdd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);

   else      % only s4   
        j=4;
        pd(:,i)=waypoints(:,j)+(Trapezoidal_p(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot(:,i)=(Trapezoidal_pd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);
        
        pd_dot_dot(:,i)=(Trapezoidal_pdd(t,Na(j),0,ta(j+1),ti(j)))*T(:,j);

   end   
    
    i=i+1;
end


while(i<=4001)
    pd(:,i)=pd(:,i-1);
    
    pd_dot(:,i)=0;%
        
    pd_dot_dot(:,i)=0;%
    i=i+1;
end

figure('Name','X Trajectory')
subplot(3,1,1); plot(ts,pd(1,:));title("Position Graph X");
subplot(3,1,2); plot(ts,pd_dot(1,:));title("Velocity Graph X");
subplot(3,1,3); plot(ts,pd_dot_dot(1,:));title("Acceleration Graph X");


figure('Name','Y Trajectory')
subplot(3,1,1); plot(ts,pd(2,:));title("Position Graph Y");
subplot(3,1,2); plot(ts,pd_dot(2,:));title("Velocity Graph Y");
subplot(3,1,3); plot(ts,pd_dot_dot(2,:));title("Acceleration Graph Y");

figure('Name','Z Trajectory')
subplot(3,1,1); plot(ts,pd(3,:));title("Position Graph Z");
subplot(3,1,2); plot(ts,pd_dot(3,:));title("Velocity Graph Z");
subplot(3,1,3); plot(ts,pd_dot_dot(3,:));title("Acceleration Graph Z");


figure('Name','3D trajectory')
plot3(pd(1,:),pd(2,:),pd(3,:));title("Generated 3D Trajectory");

% Saving the trajectory in .mat file
pd=pd';
pd_dot=pd_dot';
pd_dot_dot=pd_dot_dot';
t=0:0.001:4;
t=t';
q0=[-0.9273;-1.2870;0.7000;2.2143];
theta_d=zeros(4001,1);
theta_d_dot=zeros(4001,1);
theta_d_dot_dot=zeros(4001,1);
Tc=0.001;
save generated_traj.mat pd pd_dot pd_dot_dot t theta_d_dot theta_d_dot_dot theta_d  Tc q0 

% arc length output from trapezoidal velocity profile
function pt=Trapezoidal_p(t,qf,qi,tf,ti)
    t=t-ti;% taking difference to use time in formula
    tf=tf-ti;
    qc_dot_dot=2.4*pi;% greater than 4*(qf-qi)/tf^2

    tc=((tf)/2)-(1/2)*sqrt((((tf^2)*qc_dot_dot)-4*(qf-qi))/qc_dot_dot);

   
        if (t<=tc && t>=0)
            pt=qi+(0.5)*qc_dot_dot*t^2;
        elseif (t>tc && t<=tf-tc)
            pt= qi+qc_dot_dot*tc*(t-(tc/2));
        elseif (t>=tf-tc && t<=(tf))
            pt=qf-(0.5)*qc_dot_dot*(((tf)-t)^2);
        end
    
end

function ptd=Trapezoidal_pd(t,qf,qi,tf,ti)
    t=t-ti;% taking difference to use time in formula
    tf=tf-ti;
    qc_dot_dot=2.4*pi;% greater than 4*(qf-qi)/tf^2

    tc=((tf)/2)-(0.5)*sqrt(((((tf)^2)*qc_dot_dot)-4*(qf-qi))/qc_dot_dot);
     
        if (t<=tc && t>=0)
            ptd=qc_dot_dot*t;
        elseif (t>tc && t<=tf-tc)
            ptd= qc_dot_dot*tc;
        elseif (t>=tf-tc && t<=tf)
            ptd=qc_dot_dot*(tf-t);
        end
    


end

function ptdd=Trapezoidal_pdd(t,qf,qi,tf,ti)
   
    t=t-ti;% taking difference to use time in formula
    tf=tf-ti;
    qc_dot_dot=2.4*pi;% greater than 4*(qf-qi)/tf^2

    tc=(tf/2)-(0.5)*sqrt((((tf^2)*qc_dot_dot)-4*(qf-qi))/qc_dot_dot);

        if (t<=tc && t>=0)
            ptdd=qc_dot_dot;
        elseif (t>tc && t<=tf-tc)
            ptdd= 0;
        elseif (t>=tf-tc && t<=tf)
            ptdd=-qc_dot_dot;
        end   

end