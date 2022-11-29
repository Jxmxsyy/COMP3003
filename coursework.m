%Gaussian Data Creation with random number of samples
samples = [];
for i = 3:-1:1    
    samples(i) = randi([1,100]);
    disp(samples);
end
sample1 = samples(1);
sample2 = samples(2);
sample3 = samples(3);
Mean1 = [6; 3;];
Mean2 = [-1;-3;];
Mean3 = [-4; 2;];
Std1= 1.9;
Std2= 2;
Std3 = 2.5;
data1 = Std1 * randn(2,sample1) + repmat(Mean1,1,sample1);
data2 = Std2 * randn(2,sample2) + repmat(Mean2,1,sample2);
data3 = Std3 * randn(2,sample3) + repmat(Mean3,1,sample3);

%Plotting Original Dataset
figure
hold on
plot(data1(1,:),data1(2,:),'r.');
plot(data2(1,:),data2(2,:),'b.');
plot(data3(1,:),data3(2,:),'g.');
xlabel("x-value");
ylabel("y-value");
title("Original Dataset - Random Sample Sizes");


%Plots Merged Dataset
dataTotal = [data1 data2 data3];
figure
hold on
plot(dataTotal(1,:),dataTotal(2,:),'ko');
xlabel("x-value");
ylabel("y-value");
title("Merged Dataset - Random Sample Sizes");

%Setting k value
k = 3;
%Collects all X and Y co-ordinate data into arrays
ax = gca;
h = findobj(ax , 'Type', 'line');
x = h(1).XData;
y = h(1).YData;
disp(h);

%Sets random values to be used in centroid selection
l = length(y);
r = [];
for i = 3:-1:1    
    r(i) = randi([1,l]);
    disp(r);
end


c1xNEW = (x(1,r(1))); %x coord 1st cluster
c1yNEW = (y(1,r(1))); %y coord 1st cluster
c2xNEW = (x(1,r(2))); %x coord 2nd cluster
c2yNEW = (y(1,r(2))); %y coord 2nd cluster
c3xNEW = (x(1,r(3))); %x coord 3rd cluster
c3yNEW = (y(1,r(3))); %y coord 3rd cluster


%Plots centroids on Merged Dataset
plot(c1xNEW,c1yNEW, 'ro');
plot(c2xNEW,c2yNEW, 'bo');
plot(c3xNEW,c3yNEW, 'go');


%Initialise the arrays 
temp = 0;
numLoops = 0;
k1x = [];
k1y = [];
k2x = [];
k2y = [];
k3x = [];
k3y = [];

%Euclidean Distance Calculation Loop
while(temp == 0)
    cx = [c1xNEW c2xNEW c3xNEW];
    c1xOLD = cx(1);
    c2xOLD = cx(2);
    c3xOLD = cx(3);
    
    cy = [c1yNEW c2yNEW c3yNEW];
    c1yOLD = cy(1);
    c2yOLD = cy(2);
    c3yOLD = cy(3);
    
    %Calculating euclidean distance
    for i=1:l
        xx1 = (x(i)-c1xOLD)^2;
        yy1 = (y(i)-c1yOLD)^2;
        g=xx1+yy1;
        g1=sqrt(g);
        xx2 = (x(i)-c2xOLD)^2;
        yy2 = (y(i)-c2yOLD)^2;
        g=xx2+yy2;
        g2=sqrt(g);
        xx3 = (x(i)-c3xOLD)^2;
        yy3 = (y(i)-c3yOLD)^2;
        g=xx3+yy3;
        g3=sqrt(g);
        
        if(g1 > g2 && g2 < g3)
            k2x = [k2x x(i)];
            k2y = [k2y y(i)];
        elseif (g2 > g1 && g1 < g3)
            k1x = [k1x x(i)];
            k1y = [k1y y(i)];
        else
            k3x = [k3x x(i)];
            k3y = [k3y y(i)];
        end
    end
    
c1xNEW = mean(k1x);
c2xNEW = mean(k2x);
c3xNEW = mean(k3x);
c1yNEW = mean(k1y);
c2yNEW = mean(k2y);
c3yNEW = mean(k3y);

%Check if progress made to end loop or not
if(c1xNEW ~= c1xOLD && c2xNEW ~= c2xOLD && c3yNEW ~= c3xOLD && ...
        c1yNEW ~= c1yOLD && c2yNEW ~= c2yOLD && c3yNEW ~= c3yOLD)
    k1x=[];
    k2x=[];
    k3x=[];
    k1y=[];
    k2y=[];
    k3y=[];
    numLoops = numLoops + 1;
else
    temp = 1;
    disp("Total loops ran before plateauing:" + numLoops);
end
end

%Plot Final Clustered Data
figure
hold on
plot(k1x,k1y,'r.');
plot(k2x,k2y,'b.');
plot(k3x,k3y,'g.');
xlabel("x-value");
ylabel("y-value");
title("Post Clustering Dataset - Random Sample Sizes || Loops taken " + numLoops);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Gaussian Data Creation with random number of samples
samples = 100;

Mean1 = [6; 3;];
Mean2 = [-1;-3;];
Mean3 = [-4; 2;];
Std1= 1.9;
Std2= 2;
Std3 = 2.5;
data1 = Std1 * randn(2,samples) + repmat(Mean1,1,samples);
data2 = Std2 * randn(2,samples) + repmat(Mean2,1,samples);
data3 = Std3 * randn(2,samples) + repmat(Mean3,1,samples);

%Plotting Original Dataset
figure
hold on
plot(data1(1,:),data1(2,:),'r.');
plot(data2(1,:),data2(2,:),'b.');
plot(data3(1,:),data3(2,:),'g.');
xlabel("x-value");
ylabel("y-value");
title("Original Dataset - Set Sample Sizes");


%Plots Merged Dataset
dataTotal = [data1 data2 data3];
figure
hold on
plot(dataTotal(1,:),dataTotal(2,:),'ko');
xlabel("x-value");
ylabel("y-value");
title("Merged Dataset - Set Sample Sizes");

%Setting k value
k = 3;
%Collects all X and Y co-ordinate data into arrays
ax = gca;
h = findobj(ax , 'Type', 'line');
x = h(1).XData;
y = h(1).YData;
disp(h);

%Sets random values to be used in centroid selection
l = length(y);
r = [];
for i = 3:-1:1    
    r(i) = randi([1,l]);
    disp(r);
end


c1xNEW = (x(1,r(1))); %x coord 1st cluster
c1yNEW = (y(1,r(1))); %y coord 1st cluster
c2xNEW = (x(1,r(2))); %x coord 2nd cluster
c2yNEW = (y(1,r(2))); %y coord 2nd cluster
c3xNEW = (x(1,r(3))); %x coord 3rd cluster
c3yNEW = (y(1,r(3))); %y coord 3rd cluster


%Plots centroids on Merged Dataset
plot(c1xNEW,c1yNEW, 'ro');
plot(c2xNEW,c2yNEW, 'bo');
plot(c3xNEW,c3yNEW, 'go');


%Initialise the arrays 
temp = 0;
numLoops = 0;
k1x = [];
k1y = [];
k2x = [];
k2y = [];
k3x = [];
k3y = [];

%Euclidean Distance Calculation Loop
while(temp == 0)
    cx = [c1xNEW c2xNEW c3xNEW];
    c1xOLD = cx(1);
    c2xOLD = cx(2);
    c3xOLD = cx(3);
    
    cy = [c1yNEW c2yNEW c3yNEW];
    c1yOLD = cy(1);
    c2yOLD = cy(2);
    c3yOLD = cy(3);
    
    %Calculating euclidean distance
    for i=1:l
        xx1 = (x(i)-c1xOLD)^2;
        yy1 = (y(i)-c1yOLD)^2;
        g=xx1+yy1;
        g1=sqrt(g);
        xx2 = (x(i)-c2xOLD)^2;
        yy2 = (y(i)-c2yOLD)^2;
        g=xx2+yy2;
        g2=sqrt(g);
        xx3 = (x(i)-c3xOLD)^2;
        yy3 = (y(i)-c3yOLD)^2;
        g=xx3+yy3;
        g3=sqrt(g);
        
        if(g1 > g2 && g2 < g3)
            k2x = [k2x x(i)];
            k2y = [k2y y(i)];
        elseif (g2 > g1 && g1 < g3)
            k1x = [k1x x(i)];
            k1y = [k1y y(i)];
        else
            k3x = [k3x x(i)];
            k3y = [k3y y(i)];
        end
    end
    
c1xNEW = mean(k1x);
c2xNEW = mean(k2x);
c3xNEW = mean(k3x);
c1yNEW = mean(k1y);
c2yNEW = mean(k2y);
c3yNEW = mean(k3y);

%Check if progress made to end loop or not
if(c1xNEW ~= c1xOLD && c2xNEW ~= c2xOLD && c3yNEW ~= c3xOLD && ...
        c1yNEW ~= c1yOLD && c2yNEW ~= c2yOLD && c3yNEW ~= c3yOLD)
    k1x=[];
    k2x=[];
    k3x=[];
    k1y=[];
    k2y=[];
    k3y=[];
    numLoops = numLoops + 1;
else
    temp = 1;
    disp("Total loops ran before plateauing:" + numLoops);
end
end

%Plot Final Clustered Data
figure
hold on
plot(k1x,k1y,'r.');
plot(k2x,k2y,'b.');
plot(k3x,k3y,'g.');
xlabel("x-value");
ylabel("y-value");
title("Post Clustering Dataset - Set Sample Sizes || Loops taken " + numLoops);





