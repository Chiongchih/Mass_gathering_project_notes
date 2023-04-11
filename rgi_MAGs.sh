#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J rgi-ha
#SBATCH -o %x.%J.out
#SBATCH -e %x.%J.err
#SBATCH --mail-user=changzhi.wang@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=3-00:00:00
#SBATCH --mem=30G
#SBATCH -c 16

#run the application:
#filename="062720"
#module load gtdb-tk/1.0.2/python3.6
module load miniconda3/4.7.12.1
source activate rgi
rgi load --card_json /home/wangc0c/Tools/CARD_rgi_3.2.5_r/card.json --local
for folder in A220710_ha_metawrap_refine_results
do
cd "$folder"/metawrap_70_10_bins/
for i in *.fa
do
cd ../../
rgi main --input_sequence "$folder"/metawrap_70_10_bins/"$i" --output_file ./bins_RGI_results/ha_results/"$folder"_"$i".rgi.output --input_type contig --clean -n 16 --include_nudge --local
cd "$folder"/metawrap_70_10_bins/ 
done
done

