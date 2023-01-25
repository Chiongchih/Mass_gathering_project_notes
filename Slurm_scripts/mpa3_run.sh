#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J A200801
#SBATCH -o A200801.%J.out
#SBATCH -e A200801.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=3:00:00
#SBATCH --mem=30G
#SBATCH -c 32

#run the application:
module load miniconda/171207
source activate mpa3
filename="A200801"
metaphlan --input_type fastq ../Trim_output/"$filename"_paired_1.fastq.gz,"$filename"_paired_2.fastq.gz \
--bowtie2out "$filename"_mpa.bowtie2.bz2 \
--nproc 32 \
-o "$filename"_mpa.txt
