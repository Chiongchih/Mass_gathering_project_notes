#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J OPERAMS
#SBATCH -o %x.%J.out
#SBATCH -e %x.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=1-00:00:00
#SBATCH --mem=30G

#run the application:
module load miniconda3/4.7.12.1
source activate operams
cd /home/wangc0c/Tools/OPERAMS/OPERA-MS/test_files
perl ../OPERA-MS.pl \
--contig-file contigs.fasta \
--short-read1 R1.fastq.gz \
--short-read2 R2.fastq.gz \
--long-read long_read.fastq \
--no-ref-clustering \
--out-dir RESULTS2 2> log2.err












