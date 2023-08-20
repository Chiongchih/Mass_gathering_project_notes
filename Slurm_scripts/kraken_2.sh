#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J kraken_colony
#SBATCH -o %x.%J.out
#SBATCH -e %x.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=03:00:00
#SBATCH --mem=50G

#run the application:
module load kraken2/2.1.3/gnu-6.4.0
kraken2 --db $KRAKEN2_DB_PATH --threads 4 --gzip-compressed --report kraken2_colony_report_A220402M1.txt A220402M1_ONT_genome.fna.gz
#./kraken2-master/kraken2 --db ./kraken2-master/df_db/ --threads 4 --gzip-compressed  --report kraken2_report.txt --output 

