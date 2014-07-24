fig = figure;
%hold on;
x = M(:, 1);
% convert the x (time) value from unix time to matlab time for datetick use
% x = (x / 86400 / 1000) + datenum(1970,1,1);

y1 = M(1:end, 2);
y2 = M(1:end, 3);
y3 = M(1:end, 4);

plot(x, y1, 'x-', x, y2, '+-', x, y3, 'o-');

xlim([x(1), x(end)]);

% xlim('auto');
set(gca, 'XTick', x);
set(gca, 'XTickLabel', sprintf('%0.0f|', x));
grid on;

% datetick('x','yyyy-mm-dd HH:MM:SS.FFF', 'keeplimits', 'keepticks');
rotateXLabels(gca, 90);

hleg1 = legend('x', 'y', 'z');
% zoomAdaptiveDateTicks('on');


%Time points:
% 140534831   7500
%                 8011
%             8510
%                 9009
%             9553
%                 9995
%        32   0507
%                 1034
%             1515
%                 2002
%             2507
%                 3015
%             3509