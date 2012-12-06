f1s = zeros(3,6,10);

%load f1s

alpha = 0.05/3;

hyp = zeros(3);

for emotion = 1:6
    for structure_1 = 1:3
        for structure_2 = structure_1 + 1:3
            x = f1s(structure_1,emotion,:);
            y = f1s(structure_2,emotion,:);
            h = ttest(x, y, alpha);
            hyp(structure_1, structure_2) = h;
            hyp(structure_2, structure_1) = h;
        end
    end
end