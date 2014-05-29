function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 28-May-2014 11:20:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% initialise the x axis time scales
handles.tStart = -1;
handles.tEnd = -1;
handles.dataPath = '../Sensor_data/';
% get the current folder
handles.folderList = dir(fullfile(handles.dataPath));
% get rid of the hidden files and '.DS_Store' file
handles.folderList(strncmp({handles.folderList.name}, '.', 1)) = [];

for i = 1:length(handles.folderList)
    folderName{i} = handles.folderList(i).name;
end

% populate the pop up menu
set(handles.popup, 'String', folderName);

% list the current dir files
% handles.matList = dir(fullfile('*.mat'));

% for i = 1:length(handles.matList)
%     filename{i} = handles.matList(i).name;
% end
% populate the pop up menu
% set(handles.popup, 'String', filename);

% handles.mat = load(handles.matList(1).name);
% handles.sensorName = handles.matList(1).name;



% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in setStartButton.
function setStartButton_Callback(hObject, eventdata, handles)
% hObject    handle to setStartButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% preset to NOW
% dateNum = now;
% dateFormat = 'dd-mmm-yyyy HH:MM:SS';
% dateString = datestr(dateNum, dateFormat, 'local');
% show the date chooser dialog
% handles.tStart = guiDatePicker(dateString);
tStart = guiDatePicker();

timeList = accelerometer.M(:, 1);
% convert the selected time to unix timestamp
timeSelected = (tStart - datenum(1970, 1, 1)) * 1000 * 86400;
% find the current time stamp
handles.tStart = Binary_Search(timeList, 1, length(timeList), timeSelected);
disp(handles.tStart);
guidata(hObject, handles);


% --- Executes on button press in setEndButton.
function setEndButton_Callback(hObject, eventdata, handles)
% hObject    handle to setEndButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% dateNum = now;
% dateFormat = 'dd-mmm-yyyy HH:MM:SS';
% dateString = datestr(dateNum, dateFormat, 'local');
% handles.tEnd = guiDatePicker(dateString);
tEnd = guiDatePicker();

timeList = accelerometer.M(:, 1);

timeSelected = (tEnd - datenum(1970, 1, 1)) * 1000 * 86400;

handles.tEnd = Binary_Search(timeList, 1, length(timeList), timeSelected);
disp(handles.tEnd);
guidata(hObject, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in sensorPopupmenu.
function sensorPopupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to sensorPopupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns sensorPopupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from sensorPopupmenu

str = get(hObject, 'String');
val = get(hObject, 'Value');


% handles.mat = [];
% handles.sensorName = [];
switch val
    case 1
        handles.path = strcat(handles.dataPath, handles.folderList(1).name);

%         handles.mat = load(handles.matList(1).name);
%         handles.sensorName = handles.matList(1).name
    case 2
        handles.path = strcat(handles.dataPath, handles.folderList(2).name);
%         handles.mat = load(handles.matList(2).name);
%         handles.sensorName = handles.matList(2).name;
    case 3
        handles.path = strcat(handles.dataPath, handles.folderList(3).name);
%         handles.mat = load(handles.matList(3).name);
%         handles.sensorName = handles.matList(3).name;
    case 4
%         handles.mat = load(handles.matList(4).name);
%         handles.sensorName = handles.matList(4).name;
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function sensorPopupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sensorPopupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% pass the reference before populate the popup menu
handles.popup = hObject;
guidata(hObject, handles);


% --- Executes on button press in plotButton.
function plotButton_Callback(hObject, eventdata, handles)
% hObject    handle to plotButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% var_mat = [];
handles.x0 = [];
handles.y01 = [];
handles.y02 = [];
handles.y03 = [];

handles.x1 = [];
handles.y11 = [];
handles.y12 = [];
handles.y13 = [];

accelerometer = load(fullfile(handles.path, 'accelerometer.mat'));
handles.x0 = accelerometer.M(:, 1);
handles.x0 = (handles.x0 / 86400 / 1000) + datenum(1970,1,1);
handles.y01 = accelerometer.M(:, 2);
handles.y02 = accelerometer.M(:, 3);
handles.y03 = accelerometer.M(:, 4);

% check if gyroscope.mat exists
% gyroscope = [];
% if (exist(fullfile(handles.path, 'gyroscope.mat'), 'file') == 2)
%     
%     gyroscope = load(fullfile(handles.path, 'gyroscope.mat'));
%     
% else if (exist(fullfile(handles.path, 'gyroscope.mat'), 'file') == 0)
%         
%         gyroscope = load(fullfile(handles.path, 'rotation_vector.mat'));
%         
%     end

% gyroscope may not be equipped on every devices, but rotation_vector does
% exist on every devices.
rotation_vector = load(fullfile(handles.path, 'rotation_vector.mat')); 
handles.x1 = rotation_vector.M(:, 1);
handles.x1 = (handles.x1 / 86400 / 1000) + datenum(1970,1,1);
handles.y11 = rotation_vector.M(:, 2);
handles.y12 = rotation_vector.M(:, 3);
handles.y13 = rotation_vector.M(:, 4);

% Upper plot
plot1 = subplot(2, 1, 1);

plot(handles.x0, handles.y01, handles.x0, handles.y02, handles.x0, handles.y03);

if (handles.tStart ~= -1) && (handles.tEnd ~= -1)
    xlim([handles.x0(handles.tStart), handles.x0(handles.tEnd)]);
    % hide the xtick label on the upper graph
    set(gca, 'XTick', [handles.x0(handles.tStart):0.01:handles.x0(handles.tEnd)]);
end
grid on;
legend('x', 'y', 'z');
datetick('x','', 'keeplimits', 'keepticks');

% Lower plot
plot2 = subplot(2, 1, 2);
plot(handles.x1, handles.y11, handles.x1, handles.y12, handles.x1, handles.y13);

if (handles.tStart ~= -1) && (handles.tEnd ~= -1)
    xlim([handles.x1(handles.tStart), handles.x1(handles.tEnd)]);
    set(gca, 'XTick', [handles.x1(handles.tStart):0.01:handles.x1(handles.tEnd)]);
end

grid on;

datetick('x','yyyy-mm-dd HH:MM:SS.FFF', 'keeplimits', 'keepticks');
xticklabel_rotate;

%# find current position [x,y,width,height]
pos2 = get(plot2,'Position');
pos1 = get(plot1,'Position');

%# set width of second axes equal to first
pos1(3) = pos2(3);
pos2(4) = pos1(4);
set(plot1,'Position',pos1);
set(plot2,'Position',pos2);



% --- Executes during object creation, after setting all properties.
function axes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes


% --- Executes on mouse press over axes background.
function axes_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% pt = get(hObject, 'CurrentPoint');
% display(pt);
