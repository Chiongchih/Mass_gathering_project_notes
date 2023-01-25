#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J Checkm_0427
#SBATCH -o Checkm_0615.%J.out
#SBATCH -e Checkm_0615.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=12:00:00
#SBATCH --mem=50G

#run the application:
#module load megahit/1.2.9
module load checkm/1.0.9/anaconda2-2.5.0
filename="042720"
checkm lineage_wf -x fa ./EJH_MT_"$filename"_summary/bin_by_bin/Genome_bins_"$filename" ./Check_results_"filename"
#megahit --12 e01i.fq -o ../../Assembled/e01i_megahit_asm
#megahit --12 e01e.fq -o ../../Assembled/e01e_megahit_asm
#megahit --12 e02i.fq -o ../../Assembled/e02i_megahit_asm
#megahit --12 e03i.fq -o ../../Assembled/e03i_megahit_asm
#megahit --12 e03e.fq -o ../../Assembled/e03e_megahit_asm
#megahit --12 e04i.fq -o ../../Assembled/e04i_megahit_asm
#megahit --12 e05i.fq -o ../../Assembled/e05i_megahit_asm
#megahit --12 e05e.fq -o ../../Assembled/e05e_megahit_asm
#megahit --12 e06i.fq -o ../../Assembled/e06i_megahit_asm
#megahit --12 e06e.fq -o ../../Assembled/e06e_megahit_asm
#megahit --12 e07i.fq -o ../../Assembled/e07i_megahit_asm
#megahit --12 e07e.fq -o ../../Assembled/e07e_megahit_asm
#megahit --12 e08i.fq -o ../../Assembled/e08i_megahit_asm
#megahit --12 e08c.fq -o ../../Assembled/e08c_megahit_asm
#megahit --12 e09i.fq -o ../../Assembled/e09i_megahit_asm
#megahit --12 e09e.fq -o ../../Assembled/e09e_megahit_asm
#megahit --12 e10i.fq -o ../../Assembled/e10i_megahit_asm
#megahit --12 e10e.fq -o ../../Assembled/e10e_megahit_asm
#megahit --12 e10c.fq -o ../../Assembled/e10c_megahit_asm
#megahit --12 e11i.fq -o ../../Assembled/e11i_megahit_asm
#megahit --12 e11e.fq -o ../../Assembled/e11e_megahit_asm
#megahit --12 e11c.fq -o ../../Assembled/e11c_megahit_asm
#megahit --12 e12i.fq -o ../../Assembled/e12i_megahit_asm
#megahit --12 e12e.fq -o ../../Assembled/e12e_megahit_asm
#megahit --12 e12c.fq -o ../../Assembled/e12c_megahit_asm
