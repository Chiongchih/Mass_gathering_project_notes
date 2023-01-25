#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J dRep_PhD_2
#SBATCH -o dRep_PhD_2.%J.out
#SBATCH -e dRep_PhD_2.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=6-00:00:00
#SBATCH --mem=100G
#SBATCH -c 16

#run the application:
module load drep/1.4.3/gnu6.4.0_python3.5
#dRep dereplicate ./i01e_dRep_confirmed_bins -g ./i01e_bins/*.fa
dRep dereplicate ./dRep_passed_MAGs -g ./checkm_passed_MAGs/*.fa -p 16
