#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J RBSQ210220
#SBATCH -o RBSQ210220.%J.out
#SBATCH -e RBSQ210220.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=99:00:00
#SBATCH --mem=200G
#SBATCH -c 8


#run the application:
module load samtools/1.8
module load bowtie2/2.3.5
module load miniconda3/4.7.12.1
source activate anvio-7

filename="Q210220"
anvi-script-reformat-fasta final.contigs.fa -o "$filename".reformat_contigs.fa -l 1000 --simplify-names
bowtie2-build "$filename".reformat_contigs.fa "$filename".reformat_contigs.bowtie.db -p 8
bowtie2 -x "$filename".reformat_contigs.bowtie.db -q -1 ../../Trim_output/"$filename"_R1_paired.fastq.gz -2 ../../Trim_output/"$filename"_R2_paired.fastq.gz --no-unal -p 8 -S "$filename"_anvio.sam
samtools view -b -o "$filename"_anvio.raw.bam "$filename"_anvio.sam
rm "$filename"_anvio.sam
samtools sort -o "$filename"_anvio.bam "$filename"_anvio.raw.bam
rm "$filename"_anvio.raw.bam
samtools index "$filename"_anvio.bam



