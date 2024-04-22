function[child] = mutate(child,Pm)
    gene_length = length(child.gene);
    for k = 1: gene_length
        R = rand();
        if R < Pm
            child.gene(k) = ~ child.gene(k);
        end
    end
end
