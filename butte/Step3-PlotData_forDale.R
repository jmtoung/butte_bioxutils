library('ggplot2')

# get covariate file
cov_file <- '/Users/jmtoung/Butte/Projects/PTB-Genetics/Data/allG1G2-1000G-HRS/step3-PCA/step4-OmniDataFromSuyash-Phase3/1000G-as-controls/exclude-CG-AT-snps/exclude-141/step13-SNPRelate/allG1G2-HRS-1000G_exRelatedsMissings_exCG-AT-SNPs_ex141_filtered_ld.cov'
cov_data <- read.table(cov_file,header=TRUE)

cov_data$dataset <- factor(cov_data$dataset)
levels(cov_data$dataset) <- c('1000 Genomes Controls','March of Dimes Cases','Health and Retirement Controls')

# plot old PC1 vs PC2 and PC1 vs PC3 (coloured by bpd status)
p <- ggplot(cov_data[cov_data$dataset=="1000 Genomes Controls",], aes(ev1, ev2, colour=SuperPopulation)) + geom_point(alpha=I(1/3)) +
  labs(colour="1000G Population") + 
  xlab("\nPrincipal Component 1") + 
  ylab("Principal Component 2\n") +
  labs(title='Principal Components 1 vs 2 of Genetic Ancestry\n1000 Genomes Project Control Individuals') +
  theme(legend.direction="horizontal", legend.position="top")
ggsave(p, filename = '1000G-Controls-pc1-vs-pc2.pdf',width=8,height=7,dpi=300)

p <- ggplot(cov_data[cov_data$dataset=="1000 Genomes Controls",], aes(ev1, ev3, colour=SuperPopulation)) + geom_point(alpha=I(1/3)) +
  labs(colour="1000G Population") + 
  xlab("\nPrincipal Component 1") + 
  ylab("Principal Component 3\n") +
  labs(title='Principal Components 1 vs 3 of Genetic Ancestry\n1000 Genomes Project Control Individuals') +
  theme(legend.direction="horizontal", legend.position="top")
ggsave(p, filename = '1000G-Controls-pc1-vs-pc3.pdf',width=8,height=7,dpi=300)


p <- ggplot(cov_data, aes(ev1, ev2, colour=dataset)) + geom_point(alpha=I(1/5)) +
  labs(colour="Dataset") + 
  xlab("\nPrincipal Component 1") + 
  ylab("Principal Component 2\n") +
  labs(title='Principal Components 1 vs 2 of Genetic Ancestry') +
  theme(legend.direction="horizontal", legend.position="top")
ggsave(p, filename = 'all-pc1-vs-pc2.pdf',width=8,height=7,dpi=300)

p <- ggplot(cov_data, aes(ev1, ev3, colour=dataset)) + geom_point(alpha=I(1/5)) +
  labs(colour="Dataset") + 
  xlab("\nPrincipal Component 1") + 
  ylab("Principal Component 3\n") +
  labs(title='Principal Components 1 vs 3 of Genetic Ancestry') +
  theme(legend.direction="horizontal", legend.position="top")
ggsave(p, filename = 'all-pc1-vs-pc3.pdf',width=8,height=7,dpi=300)

