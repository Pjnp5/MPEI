%% a
T = zeros(3,3);
T(1,1) = 1-0.09-0.01;
T(1,2) = 1-0.4-0.1;
T(2,1) = 0.09;
T(2,2) = 0.4;
T(3,1) = 0.01;
T(3,2) = 0.1;
T(:,3) = T(:,2);
v = [0;0;1];
%% b
T4 = T^3 *v
%% c
xn = v;
  i = 1;
  graphProb = [];
  
  while 1
    xOld = xn;
    xn = T^i*v;
    
    if(max(abs(xn-xOld))<1e-3)
      break;
    end
    
    graphProb = [graphProb xn];
    plot(graphProb');
    drawnow();
    
    i = i + 1;
  end
  
  xlabel("Trans");
  ylabel("Prob");
  xn(3)
  xn(2)+xn(3)
  xn