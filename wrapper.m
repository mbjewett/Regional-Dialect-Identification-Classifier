clear;clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% EDIT THIS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
noisy = 0; %0 for train_clean, 1 for test_clean and 2 for test_noisy
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The wav files can be in different sub-folders but it will be good if you
% can give a parent folder with the all the folders of the wave files
Fs = 44100;  %sampling rate of wav files
curr_dir = pwd;

if noisy==0
    fileDir = [curr_dir '/']; %PARENT FOLDER
    wav_file =  'train_files.txt'; %list of all the files for feature extraction
    %%%%%%%%% EDIT THIS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    ftr_Dir = 'my_features/train_clean.csv'; %location of the parent folder to store 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%the extracted features
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif noisy==1
    fileDir = [curr_dir '/']; %PARENT FOLDER
    wav_file =  'test_clean_files.txt'; %list of all the files for feature extraction
    %%%%%%%%% EDIT THIS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    ftr_Dir = 'my_features/test_clean.csv'; %location of the parent folder to store 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%the extracted features
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
else
    fileDir = [curr_dir '/']; %PARENT FOLDER
    wav_file =  'test_noisy_files.txt'; %list of all the files for feature extraction
    %%%%%%%%% EDIT THIS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    ftr_Dir = 'my_features/test_noisy.csv'; %location of the parent folder to store 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%the extracted features
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
fid=fopen(wav_file,'r');
count=1;
while ~feof(fid)
    
    tline = fgets(fid);
    temp_in = regexp(tline,'[\r\f\n]','split');
    temp = temp_in{1};
    filenames{count} = temp;
    count=count+1;
    
end
fclose(fid);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for cnt = 1:length(filenames)
    
    fileName = filenames{cnt};
    snd_FilePath =  [fileDir fileName];
    fprintf('Processing %s\n', fileName);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%% Edit this part to extract your custom features %%%%%%%%%%%%%%%%%
    
%     ftr = 1;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    feature_list{cnt} = ftr;
end

dirstore = [curr_dir '/' ftr_Dir];

dlmwrite(dirstore,feature_list);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
