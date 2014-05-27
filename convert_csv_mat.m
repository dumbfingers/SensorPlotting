% this script will convert the CSV file into MAT file under the same
% directory.
files = dir(fullfile('*.csv'))
for i=1:length(files)
[path, name, ext] = fileparts(files(i).name);
% M = csvread(files(i).name);
M = importfile(files(i).name);
save(strcat(name, '.mat'), 'M');
end