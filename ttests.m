alpha = 0.05/3;

hyps = {};
hyp = zeros(3);

for emotion = 1:6
    for structure_1 = 1:3
        for structure_2 = structure_1 + 1:3
            x = algorithms{structure_1}.cs(emotion,:);
            y = algorithms{structure_2}.cs(emotion,:);
            h = ttest(x, y, alpha);
            hyp(structure_1, structure_2) = h;
            hyp(structure_2, structure_1) = h;
        end
    end
    hyps{emotion} = hyp;
end