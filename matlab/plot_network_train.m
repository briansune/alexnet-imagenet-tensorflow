%plot the neural network training result
close all;
clc;
clear;
set(0,'DefaultTextInterpreter','none');


% enter the file path to ###########################
file_path = '###########################\alexnet_train.log';
fid = fopen(file_path, 'r');
[filepath,name,ext] = fileparts(file_path);
tline = fgetl(fid);  

iteration_Array = [];
lossArray = [];
train_accuracy_Array =[];
validation_Array =[];

str = '';

Net_name = name;

%record the last line  
lastLine = '';

%Seek the words from log
str_index_iteration = ' Step/Batch: ';
str_index_loss = ' --- Loss: ';
str_index_acc1 = ' Training accuracy: ';
str_index_validation = 'Validation accuracy: ';
str_index_lr = ' LR: ';

%read line  
while ischar(tline)
	
	%%%%%%%%%%%%%% the accuracy line %%%%%%%%%%%%%%  
	k = strfind(tline, str_index_iteration);
	k1 = strfind(tline, str_index_loss);
	k2 = strfind(tline, str_index_acc1);
	k4 = strfind(tline, str_index_lr);
	k3 = strfind(tline, str_index_validation);
	
	indexEnd = size(tline);
	
	if(~isempty(k) && ~isempty(k1) && ~isempty(k2) && ~isempty(k4))
		if(~isempty(k) && ~isempty(k1))
			indexStart = k + length(str_index_iteration);
			str = tline(indexStart : k1);
			iteration_Array = [iteration_Array, str2double(str)];
		end
		
		if(~isempty(k1))
			indexStart = k1 + length(str_index_loss);
			str = tline(indexStart : k2);
			lossArray = [lossArray, str2double(str)];
		end
		
		if(~isempty(k2))
			indexStart = k2 + length(str_index_acc1);
			str = tline(indexStart : k4);
			train_accuracy_Array = [train_accuracy_Array, str2double(str)];
		end
	else
		if(~isempty(k3))
			indexStart = k3 + length(str_index_validation);
			str = tline(indexStart : indexEnd(2));
			validation_Array = [validation_Array, str2double(str)];
		end
	end
	
	lastLine = tline;
	tline = fgetl(fid);
end

%draw figure
h = figure('Position', [100, 100, 800, 800]);

subplot(2,1,1);
plot(iteration_Array, train_accuracy_Array, 'r');
hold on
plot(iteration_Array, smooth(train_accuracy_Array,0.25,'rloess'), 'b');
hold off
lgd = legend('Accuracy','Location','northwest');
title([Net_name ': Accuracy vs Iteration']);

subplot(2,1,2);
plot(iteration_Array, lossArray, 'k');
hold on
plot(iteration_Array, smooth(lossArray,0.25,'rloess'), 'y');
hold off
lgd = legend('Loss','Location','northwest');
title([Net_name ': Loss vs Iteration']);


%save the figure as jpg
saveas(h, fullfile(filepath, [Net_name '_result']), 'png');

