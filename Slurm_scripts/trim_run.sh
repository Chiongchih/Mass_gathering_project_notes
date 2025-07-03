#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J t3
#SBATCH -o t3.%J.out
#SBATCH -e t3.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=3-00:00:00
#SBATCH --mem=30G
#SBATCH -c 16

#run the application:
#filename="062720"
#module load gtdb-tk/1.0.2/python3.6
module load miniconda3/4.7.12.1
module load trimmomatic/0.38

for Date in $(cat name_listr3.txt)
do
trimmomatic PE -phred33 \
M-22-*_"$Date"_*_R1*.fastq.gz \
M-22-*_"$Date"_*_R2*.fastq.gz \
"$Date"_R1_paired.fastq.gz "$Date"_R1_unpaired.fastq.gz \
"$Date"_R2_paired.fastq.gz "$Date"_R2_unpaired.fastq.gz \
ILLUMINACLIP:adapters_2.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
done
