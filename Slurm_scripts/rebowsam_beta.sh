#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J MAGbt_DNA
#SBATCH -o MAGbt_DNA.%J.out
#SBATCH -e MAGbt_DNA.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=24:00:00
#SBATCH --mem=200G


#run the application:
module load samtools/1.8
module load bowtie2/2.3.5

MAG_name="042220"
#anvi-script-reformat-fasta final.contigs.fa -o EJH-MT-061720.reformat_contigs.fa -l 1000 --simplify-names
#bowtie2-build EJH-MT-061720.reformat_contigs.fa EJH-MT-061720.reformat_contigs.bowtie.db -p 4
filename="070920"
bowtie2 -x ./MAG_bowtie_db/EJH_MT_"$MAG_name".bowtie.db -q -1 ../Trimmomatic_output/DNA_datasets/EJH-MT-"$filename"-DNA_R1_paired.fastq.gz -2 ../Trimmomatic_output/DNA_datasets/EJH-MT-"$filename"-DNA_R2_paired.fastq.gz --no-unal -p 8 -S EJH_"$MAG_name"_"$filename".sam
samtools view -b -o EJH_"$MAG_name"_"$filename".raw.bam EJH_"$MAG_name"_"$filename".sam
rm EJH_"$MAG_name"_"$filename".sam
samtools sort -o EJH_"$MAG_name"_"$filename".bam EJH_"$MAG_name"_"$filename".raw.bam
rm EJH_"$MAG_name"_"$filename".raw.bam
samtools index EJH_"$MAG_name"_"$filename".bam


