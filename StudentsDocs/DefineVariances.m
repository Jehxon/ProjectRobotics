% Set the parameters which have the "Determined by student" comment to tune
% the Kalman filter. Do not modify anything else in this file.

% Uncertainty on initial position of the robot.

sigmaX     = 10/3 ;         % Determined by student
sigmaY     = 10/3 ;         % Determined by student
sigmaTheta = 10/3*pi/180 ;   % Determined by student
Pinit = diag( [sigmaX^2 sigmaY^2 sigmaTheta^2] ) ;


% Measurement noise.

sigmaXmeasurement = sqrt(20^2/12) ;  % Determined by student
sigmaYmeasurement = sqrt(10^2/12) ;  % Determined by student
Qgamma = 0*diag( [sigmaXmeasurement^2 sigmaYmeasurement^2] ) ;


% Input noise

sigmaTuning = 0.1 ; 
Qwheels = sigmaTuning^2 * eye(2) ;
Qbeta   = jointToCartesian * Qwheels * jointToCartesian.' ; 

% State noise
 
Qalpha = zeros(3) ;

% Mahalanobis distance threshold

mahaThreshold = sqrt(chi2inv (0.95,2));  % Determined by student
