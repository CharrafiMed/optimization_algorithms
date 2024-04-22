function [parent1,parent2]=selector(population)

    M = length(population.chromosomes(:));

    %%
    if any( [population.chromosomes(:).fitness ]<0)
        % fitness scaling
        b=abs(min( [ population.chromosomes(:).fitness ] ));
        scaled_fitness=[population.chromosomes(:).fitness]+b;
        normalized_fitness=[scaled_fitness]./sum([scaled_fitness]);

    else
        normalized_fitness=[population.chromosomes(:).fitness]./sum([population.chromosomes(:).fitness]);
    end
    %%
    [~ ,sorted_idx]=sort(normalized_fitness,'descend');



    for i = 1 : M
        temp_population.chromosomes(i).gene = population.chromosomes(sorted_idx(i)).gene;
        temp_population.chromosomes(i).fitness = population.chromosomes(sorted_idx(i)).fitness;
        temp_population.chromosomes(i).normalized_fitness = normalized_fitness(sorted_idx(i));
    end
    cumulative_sum = zeros(1 , M);

    for i = 1 : M
        for j = i : M
            cumulative_sum(i) = cumulative_sum(i) + temp_population.chromosomes(j).normalized_fitness;
        end
    end
   R = rand(); % in [0,1]
parent1_idx = M;
for i = 1: length(cumulative_sum)
    if R > cumulative_sum(i)
        parent1_idx = i - 1;
        break;
    end
end

parent2_idx = parent1_idx;

while parent2_idx == parent1_idx
    R = rand(); % in [0,1]

    for i = 1: length(cumulative_sum)
        if R > cumulative_sum(i)
            parent2_idx = i - 1;
            break;
        end
    end
end
parent1 = temp_population.chromosomes(parent1_idx);
parent2 = temp_population.chromosomes(parent2_idx);
end

