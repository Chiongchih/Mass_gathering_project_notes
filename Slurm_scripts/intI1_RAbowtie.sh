#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J IRB1
#SBATCH -o %x.%J.out
#SBATCH -e %x.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=08:00:00
#SBATCH --mem=30G
#SBATCH -c 16

#run the application:
#filename="062720"
#module load gtdb-tk/1.0.2/python3.6
module load miniconda3/4.7.12.1
#module load trimmomatic/0.38
source activate bowtie2+samtools


cd ../../Trim_output/
for Date in $(cat Trim_list.txt)
do
bowtie2 -x /ibex/scratch/projects/c2190/Changzhi/PhD3/Database_center/INTI1_sequence.bowtie.db \
-q -1 "$Date"_paired_1.fastq.gz \
-2 "$Date"_paired_2.fastq.gz \
-S /ibex/scratch/projects/c2190/Changzhi/PhD3/small_analysis/intI1_RA/"$Date".intI1.sam \
--no-unal -p 16
done

