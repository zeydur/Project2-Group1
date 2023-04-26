#!/bin/bash
#SBATCH --job-name=samss_group1
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

# Generate consensus with bcftools
samtools faidx /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta Cexcelsa_scaf_2:4113454-4114535 Cexcelsa_scaf_2:4117100-4117330 Cexcelsa_scaf_2:4117593-4117809 | bcftools consensus /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g40302.vcf.gz -o g40302_dips.fasta /shared/Project2_Resources/Group1/consensus/
samtools faidx /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta Cexcelsa_scaf_3:6912760-6916296 | bcftools consensus /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g32580.vcf.gz -o g32580_dips.fasta /shared/Project2_Resources/Group1/consensus/
samtools faidx /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta Cexcelsa_scaf_4:27471771-27471836 Cexcelsa_scaf_4:27471978-27472061 Cexcelsa_scaf_4:27472160-27472288 Cexcelsa_scaf_4:27472382-27472450 Cexcelsa_scaf_4:27472531-27472611 Cexcelsa_scaf_4:27472700-27472804 Cexcelsa_scaf_4:27472891-27473121 Cexcelsa_scaf_4:27473210-27474400 Cexcelsa_scaf_4:27474735-27475839 Cexcelsa_scaf_4:27475929-27476050 Cexcelsa_scaf_4:27476143-27476292 Cexcelsa_scaf_4:27476446-27476607 Cexcelsa_scaf_4:27476687-27476845 Cexcelsa_scaf_4:27476939-27477055 Cexcelsa_scaf_4:27477147-27477257 Cexcelsa_scaf_4:27477347-27477979 | bcftools consensus /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g5766.vcf.gz -o g5766_dips.fasta /shared/Project2_Resources/Group1/consensus/
samtools faidx /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta Cexcelsa_scaf_2:4113454-4114535 Cexcelsa_scaf_2:4117100-4117330 Cexcelsa_scaf_2:4117593-4117809 | bcftools consensus /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g40302.vcf.gz -o tetras_g40302.fasta /shared/Project2_Resources/Group1/consensus/
samtools faidx /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta Cexcelsa_scaf_3:6912760-6916296| bcftools consensus /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g32580.vcf.gz -o tetras_g32580.fasta /shared/Project2_Resources/Group1/consensus/
samtools faidx /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta Cexcelsa_scaf_4:27471771-27471836 Cexcelsa_scaf_4:27471978-27472061 Cexcelsa_scaf_4:27472160-27472288 Cexcelsa_scaf_4:27472382-27472450 Cexcelsa_scaf_4:27472531-27472611 Cexcelsa_scaf_4:27472700-27472804 Cexcelsa_scaf_4:27472891-27473121 Cexcelsa_scaf_4:27473210-27474400 Cexcelsa_scaf_4:27474735-27475839 Cexcelsa_scaf_4:27475929-27476050 Cexcelsa_scaf_4:27476143-27476292 Cexcelsa_scaf_4:27476446-27476607 Cexcelsa_scaf_4:27476687-27476845 Cexcelsa_scaf_4:27476939-27477055 Cexcelsa_scaf_4:27477147-27477257 Cexcelsa_scaf_4:27477347-27477979 | bcftools consensus /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g5766.vcf.gz -o tetras_g5766.fasta /shared/Project2_Resources/Group1/consensus/
