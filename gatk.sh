#!/bin/bash
#SBATCH --job-name=gatkfinal_group1
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/Project2_Resources/Group1/err_out/%x.out
#SBATCH --error=/shared/Project2_Resources/Group1/err_out/%x.err

#Activation of the Conda environment
source $HOME/.bash_profile
conda activate /shared/apps/conda/bio

#Filter the relevant genes by using GATK SelectVariants tool

gatk SelectVariants \
-R /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta \
-V /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/UK_scan_dips.vcf --restrict-alleles-to BIALLELIC -select "AF>0.5" \
-L Cexcelsa_scaf_2:4113454-4114535 -L Cexcelsa_scaf_2:4117100-4117330 -L Cexcelsa_scaf_2:4117593-4117809 \
-O /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g40302.vcf

gatk SelectVariants \
-R /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta \
-V /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/UK_scan_dips.vcf --restrict-alleles-to BIALLELIC -select "AF>0.5" \
-L Cexcelsa_scaf_3:6912760-6916296 \
-O /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g32580.vcf

gatk SelectVariants \
-R /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta \
-V /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/UK_scan_dips.vcf --restrict-alleles-to BIALLELIC -select "AF>0.5" \
-L Cexcelsa_scaf_4:27471771-27471836 -L Cexcelsa_scaf_4:27471978-27472061 -L Cexcelsa_scaf_4:27472160-27472288 -L Cexcelsa_scaf_4:27472382-27472450 -L Cexcelsa_scaf_4:27472531-27472611 -L Cexcelsa_scaf_4:27472700-27472804 -L Cexcelsa_scaf_4:27472891-27473121 -L Cexcelsa_scaf_4:27473210-27474400 -L Cexcelsa_scaf_4:27474735-27475839 -L Cexcelsa_scaf_4:27475929-27476050 -L Cexcelsa_scaf_4:27476143-27476292 -L Cexcelsa_scaf_4:27476446-27476607 -L Cexcelsa_scaf_4:27476687-27476845 -L Cexcelsa_scaf_4:27476939-27477055 -L Cexcelsa_scaf_4:27477147-27477257 -L Cexcelsa_scaf_4:27477347-27477979 \
-O /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g5766.vcf

gatk SelectVariants \
-R /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta \
-V /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/UK_scan_tets.vcf --restrict-alleles-to BIALLELIC -select "AF>0.5" \
-L Cexcelsa_scaf_2:4113454-4114535 -L Cexcelsa_scaf_2:4117100-4117330 -L Cexcelsa_scaf_2:4117593-4117809 \
-O /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g40302.vcf

gatk SelectVariants \
-R /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta \
-V /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/UK_scan_tets.vcf --restrict-alleles-to BIALLELIC -select "AF>0.5" \
-L Cexcelsa_scaf_3:6912760-6916296 \
-O /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g32580.vcf

gatk SelectVariants \
-R /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta \
-V /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/UK_scan_tets.vcf --restrict-alleles-to BIALLELIC -select "AF>0.5" \
-L Cexcelsa_scaf_4:27471771-27471836 -L Cexcelsa_scaf_4:27471978-27472061 -L Cexcelsa_scaf_4:27472160-27472288 -L Cexcelsa_scaf_4:27472382-27472450 -L Cexcelsa_scaf_4:27472531-27472611 -L Cexcelsa_scaf_4:27472700-27472804 -L Cexcelsa_scaf_4:27472891-27473121 -L Cexcelsa_scaf_4:27473210-27474400 -L Cexcelsa_scaf_4:27474735-27475839 -L Cexcelsa_scaf_4:27475929-27476050 -L Cexcelsa_scaf_4:27476143-27476292 -L Cexcelsa_scaf_4:27476446-27476607 -L Cexcelsa_scaf_4:27476687-27476845 -L Cexcelsa_scaf_4:27476939-27477055 -L Cexcelsa_scaf_4:27477147-27477257 -L Cexcelsa_scaf_4:27477347-27477979 \
