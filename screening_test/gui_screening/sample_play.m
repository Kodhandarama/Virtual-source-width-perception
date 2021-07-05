function files = sample_play(path,folder,name,i) 

path_file = '../data/'; 
result_file = strcat('../',name,'_training.txt'); 

if path == 1 
    path_file = strcat(path_file,'direction/');
elseif path == 2 
    path_file = strcat(path_file,'loudness/');
elseif path == 3
    path_file = strcat(path_file,'pitch/');
elseif path == 4
    path_file = strcat(path_file,'timbre/');
elseif path == 5
    path_file = strcat(path_file,'width/');
end

if folder == 1 
    path_file = strcat(path_file,'1/');
elseif folder == 2 
    path_file = strcat(path_file,'2/');
elseif folder == 3 
    path_file = strcat(path_file,'3/');
elseif folder == 4
    path_file = strcat(path_file,'4/');
end

files = dir(path_file); 

fig = sample_present();
handles=guihandles(fig);
handles.i = i ; 
handles.files = files;
handles.path_file = path_file;
fid = fopen(result_file,'a'); 
handles.fid = fid;
guidata(fig,handles);

