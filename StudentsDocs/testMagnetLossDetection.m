% Test the detection of a magnet loss

RobotAndSensorDefinition ;
DefineVariances ;

X = [ 0, 0, 0*pi/180 ].' ;    % Set this according to robot initial position.

%Load the data file
dataFile = uigetfile('data/*.txt','Select data file') ;
if isunix 
    eval(['load data/' , dataFile]) ;
else
    eval(['load data\' , dataFile]) ;
end
dataFile = strrep(dataFile, '.txt', '') ;
eval(['data = ',dataFile,'; clear ',dataFile]) ;

disp('-----');
disp('MagnetLoc running with:');
fprintf('File: %s\n',dataFile);
fprintf('Initial posture: x: %d mm  y: %d mm  theta: %d deg.\n', X(1),X(2),X(3)*180/pi);
fprintf('Tuning parameter: %d\n',sigmaTuning);


[nbLoops,t,qL,qR,sensorReadings] = PreprocessData(data, dots2rad, dumbFactor, subSamplingFactor ) ;

wbHandle = waitbar(0,'Computing...') ;

buffer = nan(nbLoops,4);
buffer(1,:) = [0 0 0 0];


for i = 2 : nbLoops 
    
    t = (i-1)*samplingPeriod ;
    
    waitbar(i/nbLoops) ;


    measures = ExtractMeasurements( sensorReadings(i), ...
        nbReedSensors, magnetDetected );
    
    
    [buffer(i,3),buffer(i,4)] = detectChange2(measures, buffer(i-1,1:2));
    
    
    buffer(i,1:2) = measures;
    
end

close(wbHandle) ;
