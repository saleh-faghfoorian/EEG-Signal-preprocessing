% EEGLAB history file generated on the 04-Jun-2022
% ------------------------------------------------

EEG.etc.eeglabvers = '2021.1'; % this tracks which version of EEGLAB is being used, you may ignore it
EEG = pop_importdata('dataformat','matlab','nbchan',0,'data','E:\\1 About University\\Projects\\Signal Processing\\Data\\Data1\\ATCE010_1.mat','srate',250,'pnts',0,'xmin',0);
EEG.setname='Data1';

EEG = eeg_checkset( EEG );
EEG=pop_chanedit(EEG, 'lookup','E:\\1 About University\\Projects\\Signal Processing\\Codes\\eeglab2021.1\\plugins\\dipfit\\standard_BEM\\elec\\standard_1005.elc','load',{'E:\\1 About University\\Projects\\Signal Processing\\Channel Locations (EGI-64 channel)\\GSN64v2_0.sfp','filetype','sfp'});

EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [],[]);

EEG = eeg_checkset( EEG );
EEG = pop_eegfiltnew(EEG, 'locutoff',1,'hicutoff',40,'plotfreqz',1);

EEG = eeg_checkset( EEG );
EEG = eeg_checkset( EEG );
EEG = pop_runica(EEG, 'icatype', 'runica', 'extended',1,'interrupt','on');

EEG = eeg_checkset( EEG );
pop_ADJUST_interface(  );

%EEG = eeg_checkset( EEG );
%EEG = eeg_checkset( EEG );
%pop_eegplot( EEG, 1, 1, 1);

EEG = eeg_checkset( EEG );
EEG = eeg_eegrej( EEG, [57 114;229 277;432 1369;1983 2085;3072 3727;4212 4371;4774 4859;5284 6222;6446 7890;8575 8616;8757 9036;10076 10283;10358 10414;11465 11923;12081 12265;12438 12485;12949 13390;13589 13663;14394 15120;15680 16183;16444 16686;17189 17583;17959 18085;18169 18287;18363 18713;19314 20083;20351 21240;21623 21735;21903 21963;22574 22636;23265 23410;23503 23546;23682 23755;23815 24068;24157 25252;25340 27067;27558 27807;28034 28167;28754 28831;28903 29725]);

%pop_eegplot( EEG, 1, 1, 1);
EEG = eeg_checkset( EEG );
EEG = eeg_eegrej( EEG, [4157 4257;13054 13125;13391 13542]);

%pop_eegplot( EEG, 1, 1, 1);

[n,m,l] = size(EEG.data);
Segment_length = 500;       % 2 seconds
Start_point = 1;
Nepochs = floor(m/Segment_length)-1;
EEG_Seg = zeros(n,Segment_length,Nepochs);
for j=1:Nepochs
	Segment_start = Start_point+(j-1)*Segment_length;
	Segment_end=j*Segment_length;
	EEG_Seg(:,:,j)=EEG.data(:,Segment_start:Segment_end);
end

EEG = pop_rmbase( EEG, [],[]);
EEG = eeg_checkset( EEG );
pop_eegplot( EEG, 1, 1, 1);

save('data1.set','EEG_Seg')
%save('E:\1 About University\Projects\Signal Processing\Data\Data3\data1.set','EEG_Seg')
% A = importdata('./data1.set')
