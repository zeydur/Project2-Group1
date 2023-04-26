#!/bin/bash
#SBATCH --job-name=tabix_group1
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/Project2_Resources/Group1/err_out/%x.out
#SBATCH --error=/shared/Project2_Resources/Group1/err_out/%x.err

# Activation of Conda environment
source $HOME/.bash_profile
conda activate /shared/apps/conda/bio

# Convert vcfs to bgzipped files and create an index

bgzip /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g40302.vcf
tabix -f -p vcf /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g40302.vcf.gz

bgzip /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g32580.vcf
tabix -f -p vcf /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g32580.vcf.gz

bgzip /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g5766.vcf
tabix -f -p vcf /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g5766.vcf.gz

bgzip /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g40302.vcf
tabix -f -p vcf /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g40302.vcf.gz

bgzip /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g32580.vcf
tabix -f -p vcf /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g32580.vcf.gz

bgzip /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g5766.vcf
tabix -f -p vcf /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g5766.vcf.gz
