#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J bbmerge_try
#SBATCH -o bbmerge_try.%J.out
#SBATCH -e bbmerge_try.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=72:00:00
#SBATCH --mem=50G
#SBATCH -c 16

module load miniconda3/4.7.12.1
source activate bowtie2+samtools
for name in $(cat EJH_MT_042420_19_MAGs_date.txt)
do
bowtie2 -x EJH_MT_042420_19-contigs.bowtie.db -q -1 ../DNA_datasets/"$name"-DNA_R1_paired.fastq.gz -2 ../DNA_datasets/"$name"-DNA_R2_paired.fastq.gz --no-unal -p 16 -S EJH_MT_042420_19_MAGs_"$name".sam
done

#run the application:
#module load centrifuge/1.0.3-beta
#for i in $(cat All_exDNA.txt)
#do
#centrifuge -f -x $index/nt "$i".gene_calls.fa -S ./reports/"$i"_centrifuge_hits.tsv --report-file ./reports/"$i"_centrifuge_report.txt -p 4
#done/ibex/scratch/wangc0c/PhD2/bbmap
#/ibex/scratch/wangc0c/My_Tools/bbmap/bbduk.sh in=EJH-062220-MT-R1_trimmedQ.fastq.gz in2=EJH-062220-MT-R2_trimmedQ.fastq.gz out=EJH-062220-MT-trimmedQ_merged.fastq.gz outu=EJH-062220-MT-trimmedQ_unmerged.fastq.gz ihist=EJH-062220-MT_ihist.txt ecct extend2=20 iterations=5

