function varargout = Help_Sobre(varargin)
% HELP_SOBRE M-file for Help_Sobre.fig
%      HELP_SOBRE, by itself, creates a new HELP_SOBRE or raises the existing
%      singleton*.
%
%      H = HELP_SOBRE returns the handle to a new HELP_SOBRE or the handle to
%      the existing singleton*.
%
%      HELP_SOBRE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HELP_SOBRE.M with the given input arguments.
%
%      HELP_SOBRE('Property','Value',...) creates a new HELP_SOBRE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Help_Sobre_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Help_Sobre_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Help_Sobre

% Last Modified by GUIDE v2.5 10-Jul-2008 10:20:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Help_Sobre_OpeningFcn, ...
                   'gui_OutputFcn',  @Help_Sobre_OutputFcn, ...
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


% --- Executes just before Help_Sobre is made visible.
function Help_Sobre_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Help_Sobre (see VARARGIN)


axes(handles.axes1)
imagesc(imread('Imagem_Help_Sobre', 'jpeg'))
axis('off');


% Choose default command line output for Help_Sobre
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Help_Sobre wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Help_Sobre_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
