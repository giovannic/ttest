%Load in clean data
load cleandata_students.mat;

%Create a row vector of attributes
attributes = 1:45;

predictions = cross_validate(x, y);



%confusion matrix
%classification_rate = length(predictions(~isnan(predictions))) / length(y) * 100;

lower = 0; upper = 0;
f1_for_each_fold = zeros(10, 6);

for j = 1:10
lower = (1 + ((j-1) * 100));
upper = (j * 100);
lower
upper
    
    
fold_preds   = predictions((1 + ((j-1) * 100)):(j * 100));
fold_targets = y((1 + ((j-1) * 100)):(j * 100));




    
%cm = CONFUSION_MATRIX(predictions, y);

cm = CONFUSION_MATRIX(fold_preds, fold_targets);

%recall rates, precision rates & f1
recall_rates = zeros(6,1);
precision_rates = zeros(6,1);
f1 = zeros(6,1);
%error_rate = length(predictions(predictions ~= y))/length(y);
error_rate = length(fold_preds(fold_preds ~= fold_targets))/length(fold_targets);
classification_rate = 1 - error_rate;
for emotion = 1:6,
    recall_rates(emotion) = cm(emotion,emotion) / sum(cm(emotion,:)) * 100;
    precision_rates(emotion) = cm(emotion,emotion) / sum(cm(:,emotion)) * 100;
    f1(emotion) = 2 * precision_rates(emotion) * recall_rates(emotion) / (precision_rates(emotion) + recall_rates(emotion));
end
%added in?
f1_for_each_fold(j, :) = f1;
end

%TOTAL F1

cm = CONFUSION_MATRIX(predictions, y(1:1000, :));


recall_rates = zeros(6,1);
precision_rates = zeros(6,1);
f1_total = zeros(6,1);
%error_rate = length(predictions(predictions ~= y))/length(y);
error_rate = length(predictions(predictions ~= y(1:1000, :)))/length(y(1:1000, :));
classification_rate = 1 - error_rate;

for emotion = 1:6
    recall_rates(emotion) = cm(emotion,emotion) / sum(cm(emotion,:)) * 100;
    precision_rates(emotion) = cm(emotion,emotion) / sum(cm(:,emotion)) * 100;
    f1_total(emotion) = 2 * precision_rates(emotion) * recall_rates(emotion) / (precision_rates(emotion) + recall_rates(emotion));
end





