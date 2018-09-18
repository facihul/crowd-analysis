function varargout = interface_version_1(varargin)
% created by 
% MD Facihul Azam & Nader Hariri
%
% var4
% 



% INTERFACE_VERSION_1 MATLAB code for interface_version_1.fig
%      INTERFACE_VERSION_1, by itself, creates a new INTERFACE_VERSION_1 or raises the existing
%      singleton*.
%
%      H = INTERFACE_VERSION_1 returns the handle to a new INTERFACE_VERSION_1 or the handle to
%      the existing singleton*.
%
%      INTERFACE_VERSION_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE_VERSION_1.M with the given input arguments.
%
%      INTERFACE_VERSION_1('Property','Value',...) creates a new INTERFACE_VERSION_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface_version_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface_version_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface_version_1

% Last Modified by GUIDE v2.5 30-Nov-2015 02:11:20

% Begin initialization code - DO NOT EDIT


gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface_version_1_OpeningFcn, ...
                   'gui_OutputFcn',  @interface_version_1_OutputFcn, ...
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


% --- Executes just before interface_version_1 is made visible.
function interface_version_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface_version_1 (see VARARGIN)

% Choose default command line output for interface_version_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interface_version_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface_version_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%%%%  Gui component work here %%%%%%%%%%%



% --- Executes on button press in playbutton.
function playbutton_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%
% Play a single video file and detect the moving objects. It doesnot stores
% anything.
%%%%%%%%%%%%%%%%%%%%



% hObject    handle to playbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  handles = guidata(hObject);   IMPORTANT ??? 


handles = guidata(hObject);
file = get(handles.edit1,'String');
temp = get(handles.edit7,'String');
time = str2double(temp); % get time slots in minutes

if get(handles.mon, 'Value') == 1 
   filename = 'monday'; 
elseif get(handles.tues, 'Value') == 1 
   filename = 'tuesday';    
elseif get(handles.wed, 'Value') == 1 
   filename = 'wednesday'; 
elseif get(handles.thurs, 'Value') == 1 
   filename = 'thursday';    
elseif get(handles.fri, 'Value') == 1 
   filename = 'friday'; 
elseif get(handles.sat, 'Value') == 1 
   filename = 'satarday';    
else   filename = 'sunday'; 

end


frame= time*60*25; % 25 frames per second 
file = fullfile('/Volumes/study/TUT/sig_innovation/video/',filename,file);
%file = fullfile(filepath,file);
num_people  = single_video(file, frame );

disp (num_people)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating directory  and Collect the information of number of people in the
% video file.Store the data in dily basis in different directotory. 
% Data is stored in matrix format and also texual format. 
% %%%%%%%%%%%%%%%%%%

% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles = guidata(hObject);
% 
% file_write_name=get(handles.edit1,'String');



% %   
if get(handles.mon, 'Value') == 1 
   filename = 'monday'; 
elseif get(handles.tues, 'Value') == 1 
   filename = 'tuesday';    
elseif get(handles.wed, 'Value') == 1 
   filename = 'wednesday'; 
elseif get(handles.thurs, 'Value') == 1 
   filename = 'thursday';    
elseif get(handles.fri, 'Value') == 1 
   filename = 'friday'; 
elseif get(handles.sat, 'Value') == 1 
   filename = 'satardayday';    
else   filename = 'sunday'; 

end

temp = get(handles.edit7,'String');
time = str2double(temp); % get time slots in minutes
frame= time*60*25; % 25 frames per second 

%% Set the video file path here %%%%%%%%%%%%%%%%%%%

path = fullfile('/Volumes/study/TUT/sig_innovation/video/',filename);  
files= dir(path);
 k= numel(files);
 num_people = zeros(1,k-3);
   for i = 4:k
    file = files(i).name; 
    filepath = fullfile('/Volumes/study/TUT/sig_innovation/video/',filename,file);
    num_people(i-3)  = people_count(filepath, frame );
     
   end

node = 1:length(num_people);

A = [node; num_people];

chk1 = exist('graphical_data', 'dir');
chk2 = exist('textual_data', 'dir');
textfile= strcat(filename,'.txt');  
  if chk1 == 0 
      mkdir ('graphical_data');
      save(fullfile('graphical_data',filename), 'num_people');
  else save(fullfile('graphical_data',filename), 'num_people');
  end    
  if chk2 == 0 
      mkdir ('textual_data');
      fileId = fopen(fullfile('textual_data',textfile), 'w');
  else fileId = fopen(fullfile('textual_data',textfile), 'w');
  end    
   fprintf(fileId, '%8s %20s\n\n ', 'Location ' , 'Number of People');
   fprintf(fileId, 'site %d ---------moving people observed %d \n', A);
   fclose(fileId); 
   
 %%%% end of load button %%%%%%%%%%%%% 

function file_load_Callback(hObject, eventdata, handles)
% hObject    handle to file_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_load as text
%        str2double(get(hObject,'String')) returns contents of file_load as a double

 
  
% --- Executes during object creation, after setting all properties.
function file_load_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in bar_create.
function bar_create_Callback(hObject, eventdata, handles)
% hObject    handle to bar_create (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 handles = guidata(hObject);
  
   filepath = '/Volumes/study/TUT/sig_innovation/video/graphical_data/';  
   %filepath= 'graphical_data' ;
   %filepath = fullfile(filepath,folder);
   if get(handles.mon, 'Value') == 1
       filename = 'monday.mat'; 
       file = fullfile(filepath,filename);
       load(file);
   elseif get(handles.tues, 'Value') == 1
       filename = 'tuesday.mat'; 
       file = fullfile(filepath,filename);
       load(file);
   elseif get(handles.wed, 'Value') == 1
       filename = 'wednesday.mat'; 
       file = fullfile(filepath,filename);
       load(file);
   elseif get(handles.thurs, 'Value') == 1
       filename = 'thursday.mat'; 
       file = fullfile(filepath,filename);
       load(file);
   elseif get(handles.fri, 'Value') == 1
       filename = 'friday.mat'; 
       file = fullfile(filepath,filename);
       load(file);
   elseif get(handles.sat, 'Value') == 1
       filename = 'satarday.mat'; 
       file = fullfile(filepath,filename);
       load(file);
    
   else filename = 'sunday.mat'; 
       file = fullfile(filepath,filename);
       load(file);
   end
   
 node = 1:length(num_people);  
axes(handles.axes1)
%set(axes, 'Xlim', [0 max(node)],'YLIM', [0 length(num_people)] );
bar(num_people), colormap('cool')
ylabel('num_people')
xlabel('nodes')

 
% --- Executes on button press in textual.
function textual_Callback(hObject, eventdata, handles)
% hObject    handle to textual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 handles = guidata(hObject);
 filepath = '/Volumes/study/TUT/sig_innovation/video/textual_data/'; 
  
   if get(handles.mon, 'Value') == 1
       filename = 'monday.txt'; 
       file = fullfile(filepath,filename);
       
   elseif get(handles.tues, 'Value') == 1
       filename = 'tuesday.txt'; 
       file = fullfile(filepath,filename);
       
   elseif get(handles.wed, 'Value') == 1
       filename = 'wednesday.txt'; 
       file = fullfile(filepath,filename);
      
   elseif get(handles.thurs, 'Value') == 1
       filename = 'thursday.txt'; 
       file = fullfile(filepath,filename);
       
   elseif get(handles.fri, 'Value') == 1
       filename = 'friday.txt'; 
       file = fullfile(filepath,filename);
       
   elseif get(handles.sat, 'Value') == 1
       filename = 'satarday.txt'; 
       file = fullfile(filepath,filename);
       
    
   else filename = 'sunday.txt'; 
       file = fullfile(filepath,filename);
       
   end
%  axes(handles.axes1)
 fileID = fopen(file);
   C = textscan(fileID,'%s');
   celldisp(C)
fclose(fileID);

% --- Executes on button press in mon.
function mon_Callback(hObject, eventdata, handles)
% hObject    handle to mon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of mon


% --- Executes on button press in tues.
function tues_Callback(hObject, eventdata, handles)
% hObject    handle to tues (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tues


% --- Executes on button press in wed.
function wed_Callback(hObject, eventdata, handles)
% hObject    handle to wed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of wed


% --- Executes on button press in thurs.
function thurs_Callback(hObject, eventdata, handles)
% hObject    handle to thurs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of thurs


% --- Executes on button press in fri.
function fri_Callback(hObject, eventdata, handles)
% hObject    handle to fri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of fri


% --- Executes on button press in sat.
function sat_Callback(hObject, eventdata, handles)
% hObject    handle to sat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sat


% --- Executes on button press in sun.
function sun_Callback(hObject, eventdata, handles)
% hObject    handle to sun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sun


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles = guidata(hObject);
  
   filepath = '/Volumes/study/TUT/sig_innovation/video/graphical_data/';  
   %filepath= 'graphical_data' ;
   %filepath = fullfile(filepath,folder);
   if get(handles.mon, 'Value') == 1
       filename = 'monday.mat'; 
       file = fullfile(filepath,filename);
       load(file);
   elseif get(handles.tues, 'Value') == 1
       filename = 'tuesday.mat'; 
       file = fullfile(filepath,filename);
       load(file);
   elseif get(handles.wed, 'Value') == 1
       filename = 'wednesday.mat'; 
       file = fullfile(filepath,filename);
       load(file);
   elseif get(handles.thurs, 'Value') == 1
       filename = 'thursday.mat'; 
       file = fullfile(filepath,filename);
       load(file);
   elseif get(handles.fri, 'Value') == 1
       filename = 'friday.mat'; 
       file = fullfile(filepath,filename);
       load(file);
   elseif get(handles.sat, 'Value') == 1
       filename = 'satarday.mat'; 
       file = fullfile(filepath,filename);
       load(file);
    
   else filename = 'sunday.mat'; 
       file = fullfile(filepath,filename);
       load(file);
   end
   
 node = 1:length(num_people); 
 time = [0 0 0 8 9 10];
 d= [node time];
axes(handles.axes1)
bar3(num_people), colormap('cool')


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
cla(handles.axes1,'reset');



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
