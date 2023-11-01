## The Evolution of Evolvability ##

Summary of the orginal article by Richard Dawkins "The Evolution of Evolvability", that shall summarize the points relevant for the implementation of the biomorphs in the ipython notebook. 

### Conditions: ###
#### First Condition ####

The first condition is the condition of replicator-entities that can self-replicate like DNA molecules. 

#### Second Condition ####

The second condition is the main concern as the replicators must be able to represent the fundamental principle of embryology in real life. Only the genes are passed from one generation to the next one, and the genotype influences the phenotype. 

The definition and differentiation between genotype and phenotype is important for the understanding of the article:
- Genotype: The genetic information of an organism, that is passed from one generation to the next one.
  - Definition: Genotype refers to the genetic composition of an organism. It is the set of specific genes and alleles that an individual inherits from its parents
  - Components: The genotype is composed of two alleles (gene variants) for each gene, one inherited from the mother and one from the father.
  - Unobservable: The genotype is not directly observable and is often hidden within an organism's cells.
- Phenotype: 
  - Definition: The physical appearance of an organism, that is influenced by the genotype. Phenotype refers to the observable physical and physiological traits of an organism. It includes characteristics like an individual's height, eye color, blood type, hair texture, and susceptibility to certain diseases.
  - Determined by Genotype: The phenotype is influenced by the genotype but is not solely determined by it. It is the result of the interaction between an organism's genetic makeup and its environment.
  - Observable: The phenotype is readily observable through visual examination, measurements, and other forms of observation.

The success of the phenotype determines whether or not the genotype is passed on to the next generation; this is in general referred to as "natural selection". Failed phenotyes does not pass on their genes to the next generation.
The phenotype is the result of the interaction between the genotype and the environment.


### Implementation ###

 In this implementation there are 9 biomorphs: 1 parent in the center and its 8 children surrounding it. The children's genes are identical to its parent's genes except for a single mutation which changes its appearance slightly. You can select which child you want to become the parent in the next generation by clicking on it. By repeating this process, you can see how the biomorphs evolve over time.

If you'd like to guide your biomorphs towards some goal, pick a simple animal in your head ("I want to evolve a lobster") and keep choosing the child that most closely resembles that objective.

The appearance of each biomorph is determined by 9 genes: 3 that influence its width, 5 that influence its height, and 1 that influences its branching depth. You can directly modify the parent biomorph's genes by clicking on its DNA icon and tinkering with the 9 sliders. These 9 genes can be used to generate more than 118 billion different biomorphs. Humans, for comparison, have about 20,000 to 25,000 protein-coding genes.
The gradual change in the biomorphs' appearance in each generation serves as a simple model of biological evolution. Each biomorph is nearly identical to its parent, but after many generations the appearance of the biomorph can diverge wildly from the original. Biological evolution works in a similar way, though on a much longer time scale. For example, you closely resemble your parents, your parents closely resemble their parents, and so on, but if you go back tens of thousands of generations your distant ancestors would only bear a slight resemblance to you.

