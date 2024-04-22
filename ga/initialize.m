function [population] = initialize(chromosomes_nb,genes_nb)
    for i=1:chromosomes_nb
        for j=1:genes_nb
            population.chromosomes(i).gene(j)=[round(rand())];
        end
    end
end
