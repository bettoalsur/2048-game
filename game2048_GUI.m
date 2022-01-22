function varargout = game2048_GUI(varargin)
% GAME2048_GUI MATLAB code for game2048_GUI.fig
%      GAME2048_GUI, by itself, creates a new GAME2048_GUI or raises the existing
%      singleton*.
%
%      H = GAME2048_GUI returns the handle to a new GAME2048_GUI or the handle to
%      the existing singleton*.
%
%      GAME2048_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAME2048_GUI.M with the given input arguments.
%
%      GAME2048_GUI('Property','Value',...) creates a new GAME2048_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before game2048_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to game2048_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help game2048_GUI

% Last Modified by GUIDE v2.5 26-Apr-2021 16:46:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @game2048_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @game2048_GUI_OutputFcn, ...
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


% --- Executes just before game2048_GUI is made visible.
function game2048_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to game2048_GUI (see VARARGIN)

% Choose default command line output for game2048_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes game2048_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = game2048_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
set(handles.pushbutton1,'Enable','off');

m = zeros(4,4);
m = add_num(m);
m = add_num(m);

num = 1;

while sum(m(:)==0) > 0  ||  num > 0
    
    aux = m;
    
    [handles] = update_interface(m,handles);
    k = waitforbuttonpress; 
    % 28 leftarrow
    % 29 rightarrow
    % 30 uparrow
    % 31 downarrow
    value = double(get(gcf,'CurrentCharacter'));

    switch value
        case 28
            for i = 1:4
               row = flip(m(i,:));
               m(i,:) = flip(handle_row(row));
            end
        case 29
            for i = 1:4
               row = m(i,:);
               m(i,:) = handle_row(row);
            end
        case 30
            for i = 1:4
               row = flip(m(:,i)');
               m(:,i) = flip(handle_row(row))';
            end
        case 31
            for i = 1:4
               row = m(:,i)';
               m(:,i) = handle_row(row)';
            end
    end
    
    if sum(sum(abs(aux - m))) ~= 0
        m = add_num(m);
    end
    
    if sum(m(:)==0) == 0
        num = num_moves(m);
    end

end

handles = update_interface(m,handles);





















% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
