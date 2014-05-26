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

% Last Modified by GUIDE v2.5 25-May-2014 17:04:40

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

% list the current dir files
handles.matList = dir(fullfile('*.mat'));
% filename = 'accelerometer_yaxi.mat';
handles.mat = load(handles.matList(1).name);
handles.sensorName = handles.matList(1).name;
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
handles.tStart = guiDatePicker();


% --- Executes on button press in setEndButton.
function setEndButton_Callback(hObject, eventdata, handles)
% hObject    handle to setEndButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% dateNum = now;
% dateFormat = 'dd-mmm-yyyy HH:MM:SS';
% dateString = datestr(dateNum, dateFormat, 'local');
% handles.tEnd = guiDatePicker(dateString);
handles.tEnd = guiDatePicker();


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
        handles.mat = load(handles.matList(1).name);
        handles.sensorName = handles.matList(1).name
    case 2
        handles.mat = load(handles.matList(2).name);
        handles.sensorName = handles.matList(2).name;
    case 3
        handles.mat = load(handles.matList(3).name);
        handles.sensorName = handles.matList(3).name;
    case 4
        handles.mat = load(handles.matList(4).name);
        handles.sensorName = handles.matList(4).name;
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


% --- Executes on button press in plotButton.
function plotButton_Callback(hObject, eventdata, handles)
% hObject    handle to plotButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

var_mat = handles.mat;
handles.x = [];
handles.y1 = [];
handles.y2 = [];
handles.y3 = [];
% switch handles.sensorName

if strcmp(handles.sensorName, handles.matList(1).name)
    handles.x = var_mat.accelerometer(:, 1);
    handles.x = (handles.x / 86400 / 1000) + datenum(1970,1,1);
    handles.y1 = var_mat.accelerometer(:, 2);
    handles.y2 = var_mat.accelerometer(:, 3);
    handles.y3 = var_mat.accelerometer(:, 4);
    
end

if strcmp(handles.sensorName, handles.matList(2).name)
    handles.x = var_mat.gyroscope(:, 1);
    handles.x = (handles.x / 86400 / 1000) + datenum(1970,1,1);
    handles.y1 = var_mat.gyroscope(:, 2);
    handles.y2 = var_mat.gyroscope(:, 3);
    handles.y3 = var_mat.gyroscope(:, 4);
    
end
%     case strcmp(handles.sensorName, handles.matList(3).name)
%     handles.x = var_mat.magnetometer(:, 1);
%     handles.x = (handles.x / 86400 / 1000) + datenum(1970,1,1);
%     handles.y1 = var_mat.magnetometer(:, 2);
%     handles.y2 = var_mat.magnetometer(:, 3);
%     handles.y3 = var_mat.magnetometer(:, 4);
    
% else if strcmp(handles.sensorName, handles.matList(4).name)
% end

plot(handles.x, handles.y1, handles.x, handles.y2, handles.x, handles.y3);
datetick('x','yyyy-mm-dd HH:MM:SS.FFF');



% --- Executes during object creation, after setting all properties.
function axes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes
