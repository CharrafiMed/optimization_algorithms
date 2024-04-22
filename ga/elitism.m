function[new_population]=elitism(population,Er)
    M=length(population.chromosomes);
    Elite_num = round(M * Er);
    [~,index]=sort([population.chromosomes(:).fitness],'descend');
   for k=1  : Elite_num
        new_population.chromosomes(k).gene  = population.chromosomes(index(k)).gene;
        new_population.chromosomes(k).fitness  = population.chromosomes(index(k)).fitness;
   end
   for k = Elite_num + 1  : length(population.chromosomes)

        new_population.chromosomes(k).gene  = population.chromosomes(index(k)).gene;
        new_population.chromosomes(k).fitness  = population.chromosomes(index(k)).fitness;

   end
end
