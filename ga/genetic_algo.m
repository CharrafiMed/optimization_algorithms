function [best_chromosome]=genetic_algo(M,N,MaxGen,Pc,Pm,Er,closure)

    %% initialization
    [ population ] = initialize(M, N);
    for i = 1 : M
        population.chromosomes(i).fitness = closure( population.chromosomes(i).gene(:) );
    end

    g=1;

    disp(['generation#',num2str(g)]);

    % main loop
    for g=2:MaxGen

        disp(['generation#',num2str(g)]);

        % evaluation

        for i=1:M
            population.chromosomes(i).fitness=closure(population.chromosomes(i).gene(:));
        end
        % selection

        for k=1:2:M
            [parent1,parent2]=selector(population);
        end

        % recombination

        [child1,child2]=recombinate(parent1,parent2,Pc,'double');
        % mutation

        child1 = mutate(child1,Pm);
        child2 = mutate(child2,Pm);

        new_population.chromosomes(k).gene = child1.gene;
        new_population.chromosomes(k+1).gene = child2.gene;
        % evaluation

        for i = 1 : M
            new_population.chromosomes(i).fitness = closure( new_population.chromosomes(i).gene(:) );
        end
        population=elitism(new_population,Er);
    end
    for i=1:M
        population.chromosomes(i).fitness=closure(population.chromosomes(i).gene(:));
    end

    [~,index] = sort([population.chromosomes(i).fitness],'descend');

    best_chromosome.gene = population.chromosomes(index(1)).gene;
    best_chromosome.fitness = population.chromosomes(index(1)).fitness;
end

