#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J INTbt_DNA
#SBATCH -o INTbt_DNA.%J.out
#SBATCH -e INTbt_DNA.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=30:00:00
#SBATCH --mem=200G


#run the application:
#module load megahit/1.2.9
#megahit -1 EJH-MT-060220-DNA_R1_paired.fastq.gz -2 EJH-MT-051120-DNA_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-051120_asm_8 -t 8
#megahit -1 EJH-MT-060220-DNA_R1_paired.fastq.gz -2 EJH-MT-051020-DNA_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-051020_asm2_8 -t 8
#megahit -1 EJH-MT-060220-DNA_R1_paired.fastq.gz -2 EJH-MT-050520-DNA_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-050520_asm2_8 -t 8
#megahit -1 EJH-MT-060220-DNA_R1_paired.fastq.gz -2 EJH-MT-050420-DNA_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-050420_asm2_8 -t 8
#megahit -1 EJH-MT-050320-DNA_R1_paired.fastq.gz -2 EJH-MT-050320-DNA_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-050320_asm2_8 -t 8
#megahit -1 EJH-MT-070920-DNA_R1_paired.fastq.gz -2 EJH-MT-070920-DNA_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-070920_asm2_16 -t 16 
#module load samtools/1.8
#module load bowtie2/2.3.5
#module load miniconda3/4.7.12.1
#source activate anvio-7

module load miniconda3/4.7.12.1
source activate bowtie2+samtools

MAG_name="INTI1_sequence"
#anvi-script-reformat-fasta final.contigs.fa -o EJH-MT-061720.reformat_contigs.fa -l 1000 --simplify-names
#bowtie2-build EJH-MT-061720.reformat_contigs.fa EJH-MT-061720.reformat_contigs.bowtie.db -p 4
for filename in $(cat "June2_EJH.txt")
do
bowtie2 -x ./MAG_bowtie_db/"$MAG_name".bowtie.db -q -1 ../Trimmomatic_output/DNA_datasets/EJH-MT-"$filename"-DNA_R1_paired.fastq.gz -2 ../Trimmomatic_output/DNA_datasets/EJH-MT-"$filename"-DNA_R2_paired.fastq.gz --no-unal -p 8 -S EJH_"$MAG_name"_"$filename".sam
samtools view -b -o EJH_"$MAG_name"_"$filename".raw.bam EJH_"$MAG_name"_"$filename".sam
rm EJH_"$MAG_name"_"$filename".sam
samtools sort -o EJH_"$MAG_name"_"$filename".bam EJH_"$MAG_name"_"$filename".raw.bam
rm EJH_"$MAG_name"_"$filename".raw.bam
samtools index EJH_"$MAG_name"_"$filename".bam
done

#megahit -1 EJH-MT-042420_R1_paired.fastq.gz -2 EJH-MT-042420_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-042420_asm_r -t 4
#megahit -1 EJH-MT-042820_R1_paired.fastq.gz -2 EJH-MT-042820_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-042820_asm_r -t 4
#megahit -1 EJH-MT-051220_R1_paired.fastq.gz -2 EJH-MT-051220_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-051220_asm_r -t 4
#megahit -1 EJH-MT-052720_R1_paired.fastq.gz -2 EJH-MT-052720_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-052720_asm_r -t 4
#megahit -1 EJH-MT-061520_R1_paired.fastq.gz -2 EJH-MT-061520_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-061520_asm_r -t 4
#megahit -1 EJH-MT-062220_R1_paired.fastq.gz -2 EJH-MT-062220_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-062220_asm_r -t 4
#megahit -1 EJH-MT-070320_R1_paired.fastq.gz -2 EJH-MT-070320_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-070320_asm_16 -t 16
#megahit -1 EJH-MT-070820_R1_paired.fastq.gz -2 EJH-MT-070820_R2_paired.fastq.gz -o ../DNA_contigs/EJH-MT-070820_asm_16 -t 16

