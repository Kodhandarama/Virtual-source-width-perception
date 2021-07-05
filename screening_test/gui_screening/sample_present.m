function varargout = sample_present(varargin)
% SAMPLE_PRESENT M-file for sample_present.fig
%      SAMPLE_PRESENT, by itself, creates a new SAMPLE_PRESENT or raises the existing
%      singleton*.
%
%      H = SAMPLE_PRESENT returns the handle to a new SAMPLE_PRESENT or the handle to
%      the existing singleton*.
%
%      SAMPLE_PRESENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SAMPLE_PRESENT.M with the given input arguments.
%
%      SAMPLE_PRESENT('Property','Value',...) creates a new SAMPLE_PRESENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sample_present_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sample_present_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sample_present

% Last Modified by GUIDE v2.5 14-Nov-2017 11:08:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sample_present_OpeningFcn, ...
                   'gui_OutputFcn',  @sample_present_OutputFcn, ...
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


% --- Executes just before sample_present is made visible.
function sample_present_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sample_present (see VARARGIN)

% Choose default command line output for sample_present
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sample_present wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sample_present_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_done.
function pushbutton_done_Callback(hObject, eventdata, handles)
    
    
    fprintf(handles.fid,'%d \n',handles.i);
    fprintf(handles.fid,'%s \n',strcat(handles.path_file,handles.files(1+2).name));
    fprintf(handles.fid,'%s \n',strcat(handles.path_file,handles.files(2+2).name));
    fprintf(handles.fid,'%s \n\n',handles.uibuttongroup1.SelectedObject.String); 
%     val = get(handles.text2,'String');
%     fprintf(fid,'%s \n',val); 
%     val = get(handles.text3,'String');
%     fprintf(fid,'%s \n',val); 
%     val = get(handles.text4,'String');
%     fprintf(fid,'%s \n',val); 
%     val = get(handles.text5,'String');
%     fprintf(fid,'%s \n',val); 
%     file_no = handles.ref100;
%     file_play = file_no; %strcat(handles.path,handles.files(file_no+2).name);
%     fprintf(fid,'ref: %s \n',file_play); 
%     for i = 1 : 5
%         fprintf(fid,'%s \n',handles.files(handles.idx(i)+2).name); 
%     end
    fclose(handles.fid)
    close all


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = ['killall python'];
unix(str)



% --- Executes on button press in pushbutton_ref1.
function pushbutton_ref0_Callback(hObject, eventdata, handles)
file_play = strcat(handles.path_file,handles.files(1+2).name);
[data,fs]=audioread(file_play); 
audiowrite('temp.wav',data(:,1:8),fs,'BitsPerSample',16);
str = ['python play_8chn.py temp.wav &']; %' &'
%str = ['python play_8chn.py ' file_play ' &']; %' &'
unix(str)
disp(file_play);
disp(file_play(end-13:end));

% --- Executes on button press in pushbutton_ref1.
function pushbutton_ref1_Callback(hObject, eventdata, handles)
file_play = strcat(handles.path_file,handles.files(2+2).name);
[data,fs]=audioread(file_play); 
audiowrite('temp.wav',data(:,1:8),fs,'BitsPerSample',16);
str = ['python play_8chn.py temp.wav &']; %' &'
%str = ['python play_8chn.py ' file_play ' &']; %' &'
unix(str)
disp(file_play);
disp(file_play(end-13:end));
