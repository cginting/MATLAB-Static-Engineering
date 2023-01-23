clf
%confirm the actual minimum Young's Modulus value calculated from Project 1
actualvalue = calcZstan(3000,2,.4,.5);
%create row  representing wall heights from 1-10
tall=1:.01:10;
%create row matrix representing Poisson's ratios from 0 to 1
soils=0:.001:1;
%calculate YM's based on tall
tallVar=calcZstan(3000,tall,.4,.5);
%calculate YM's based on soils
soilmod=calcZstan(3000,2,soils,.5);
%the next 3 lines are to make matrixes the same size as tall with every
%value within the matrix equal to c. This is used to generate a flat line
%when plotted
c=6*10^9;
filler=tall;
filler(:,:)=c;
%the next two lines create a figure that graphs YM over various wall heights, 
%and clear any figure history to remove
%duplicated legends
figure(1);
clf;
title(' Minimum Youngs Modulus Over Varying Wall Heights');
ylabel('Youngs Modulus (Pa)');
xlabel('Height of wall (m)');
hold on;
%plotting variation, aswell as flat lines that represent YM's of various
%materials
plot(tall,tallVar,'DisplayName','Height Variation',LineWidth=2);
plot(tall,filler,'DisplayName','Brick',LineWidth=2);
c=7*10^9;
filler(:,:)=c;
plot(tall,filler,'DisplayName','Spruce',LineWidth=2);
c=9*10^9;
filler(:,:)=c;
plot(tall,filler,'DisplayName','Oak',LineWidth=2);
c=10*10^9;
filler(:,:)=c;
plot(tall,filler,'DisplayName','Pine',LineWidth=2);
c=50*10^9;
filler(:,:)=c;
plot(tall,filler,'DisplayName','Concrete',LineWidth=2);
legend;
hold off;
%graph of YMs when Poisson's ratio is varied, clearing the legend.
figure(2);
clf;
PoissonGraph=figure(2);
%begin plotting
hold on;
plot(soils,soilmod,'DisplayName','Poisson Variation',LineWidth=2);
%once again, making filler row matrixes of size soils so that
%plot(soils,filler) will produce a flat line at Y=C
filler=soils;
c=6*10^9;
filler(:,:)=c;
plot(soils,filler,'DisplayName','Brick',LineWidth=2);
c=7*10^9;
filler(:,:)=c;
plot(soils,filler,'DisplayName','Spruce',LineWidth=2);
c=9*10^9;
filler(:,:)=c;
plot(soils,filler,'DisplayName','Oak',LineWidth=2);
c=10*10^9;
filler(:,:)=c;
plot(soils,filler,'DisplayName','Pine',LineWidth=2);
c=50*10^9;
filler(:,:)=c;
plot(soils,filler,'DisplayName','Concrete',LineWidth=2);
title('Minimum Youngs Modulus vs Various Poissons Ratios');
ylabel('Youngs Modulus (Pa)');
xlabel('Poisson Ratio');
legend;
figure(3);
%bar graph comparing costs. material names are created and organized into
%the same order that the costs are in so they match an already made
%calculation table
matNames = categorical({'Pine','Oak','Spruce','Concrete', 'Brick'});
matNames = reordercats(matNames,{'Pine','Oak','Spruce','Concrete', 'Brick'});
costs = [1324 10000 2500 300 1410];
bar(matNames,costs);
title('Costs to Build Wall Using Common Building Materials');
xlabel('Materials');
ylabel('Cost (USD)');
%function to determine the Young's Modulus given the density, height
%Poisson ratio, and width of a wall. The function will print out the result
%only if the user asks for a single input-output. 
function [Z]=calcZstan(y,h,u,w);
Z= 160.*y.*h.^4.*u./(w.^3-u.*w.^3);
formatSpec = 'The minimum Youngs modulus is %f Pascals';
if width(Z)==1;
    fprintf(formatSpec,Z);
end 
end



