function[child1,child2]= recombinate( parent1 , parent2 , Pc , cross_over_type )

    switch cross_over_type
        case 'single'
            gene_length = length( parent1.gene );
            upper_bound = gene_length - 1;
            lower_bound = 1;

            cross_p= round(( upper_bound - lower_bound ) * rand() + lower_bound);

            child1.gene=[ parent1.gene(1:cross_p) , parent2.gene( cross_p+1 : gene_length )];

            child2.gene=[parent2.gene(1:cross_p),parent2.gene(cross_p+1:gene_length)];

        case 'double'
            gene_length = length(parent1.gene);
            upper_bound = gene_length - 1;
            lower_bound = 1;

            cross_p= round(( upper_bound - lower_bound ) * rand() + lower_bound);
            cross_p2=cross_p;

            while  cross_p2==cross_p
               cross_p2 = round(( upper_bound - lower_bound ) * rand() + lower_bound);
            end

            if cross_p > cross_p2
                temp = cross_p;
                cross_p = cross_p2;
                cross_p2 = temp;
            end

            child1.gene = [parent1.gene(1:cross_p),parent2.gene(cross_p + 1 : cross_p2),parent1.gene(cross_p2 + 1 : end)];
            child2.gene = [parent2.gene(1:cross_p),parent1.gene(cross_p + 1 : cross_p2),parent2.gene(cross_p2 + 1 : end)];
    end


    R1 = rand();

    if R1 <= Pc
        child1 = child1;
    else
        child1 = parent1;
    end

    R2 = rand();

    if R2 <= Pc
        child2 = child2;
    else
        child2 = parent2;
    end

end
