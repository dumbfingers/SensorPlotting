function result = feature_calculation(Mat, timestart, timeend)
%load matrix
timeList = Mat(:, 1);

t1 = Binary_Search(timeList, 1, length(timeList), timestart);
t2 = Binary_Search(timeList, 1, length(timeList), timeend);

% x-axis
x = Mat(t1:t2, 2);
% y-axis
y = Mat(t1:t2, 3);
% z-axis
z = Mat(t1:t2, 4);

% mean
meanX = mean(x);
meanY = mean(y);
meanZ = mean(z);

% variance
varX = var(x);
varY = var(y);
varZ = var(z);

%percentile
percentileX = prctile(x, 75);
percentileY = prctile(y, 75);
percentileZ = prctile(z, 75);

%fft & fft energy
energyX = (abs(fft(x))).^2;
energyY = (abs(fft(x))).^2;
energyZ = (abs(fft(x))).^2;

%zero-crossing rate
zcrX = ZCR(x);
zcrY = ZCR(y);
zcrZ = ZCR(z);


% Print the results
disp('=========== Mean ===========');
disp('Mean, x axis');
disp(meanX);
disp('Mean, y axis');
disp(meanY);
disp('Mean, z axis');
disp(meanZ);

disp('=========== Variance ===========');
disp('Variance, x axis');
disp(varX);
disp('Variance, y axis');
disp(varY);
disp('Variance, z axis');
disp(varZ);

disp('=========== Percentile ===========');
disp('75 percentile, x axis');
disp(percentileX);
disp('75 percentile, y axis');
disp(percentileY);
disp('75 percentile, z axis');
disp(percentileZ);

disp('=========== FFT Energy ===========');
disp('FFT Energy, x axis');
disp(energyX);
disp('FFT Energy, y axis');
disp(energyY);
disp('FFT Energy, z axis');
disp(energyZ);

disp('=========== ZCR ===========');
disp('ZCR, x axis');
disp(zcrX);
disp('ZCR, y axis');
disp(zcrY);
disp('ZCR, z axis');
disp(zcrZ);



