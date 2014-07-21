fig = figure;
%hold on;
x = M(:, 1);
% convert the x (time) value from unix time to matlab time
x = (x / 86400 / 1000) + datenum(1970,1,1);
y1 = M(1:end, 2);
y2 = M(1:end, 3);
y3 = M(1:end, 4);

plot(x, y1, 'x-', x, y2, '+-', x, y3, 'o-');
%xlim([min(accelerometer(:, 1)) max(accelerometer(:, 1))]);
% timeList = M(:, 1);
% timeStart = Binary_Search(timeList, 1, length(timeList), 1405000824485);
% timeStart = 1400231604485;
% timeEnd = 1405003426932;
% timeEnd = Binary_Search(timeList, 1, length(timeList), 1405003426932);
% xlim([x(timeStart), x(timeEnd)]);
% set(gca, 'XTick', [x(timeStart):0.1:x(timeEnd)]);
xlim([x(1), x(end)]);

% xlim('auto');
set(gca, 'XTick', x);
grid on;

datetick('x','yyyy-mm-dd HH:MM:SS.FFF', 'keeplimits', 'keepticks');
% xticklabel_rotate;
rotateXLabels(gca, 90);

% axis 'auto x';
hleg1 = legend('x', 'y', 'z');
% signin('ss1271', 'a81m2i9wtf')
% fig2plotly(fig, 'name', 'accelerometer 14-07-2014')
% zoomAdaptiveDateTicks('on');