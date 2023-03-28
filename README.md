# Project 2: Structure Homology Modelling and Functional Predictions
## Group Members: Zeynep Durak (Coding), Alexandra Baousi - Yash Bhagat (Interpretation - Analysis), Ryan Dimmock (Presentation)

## Aim
This repository aims to clearly show and explain the methods, documents and code used throughout the project. The aim of the project can be regarded as generation of structural and functional predictions of the relevant genes (g46214, g40302, g32580 and g5766) to compare the contrasting conditions as diploidy and tetraploidy. 

## Documentation
In order to reach out the files the given directory as /shared/Project2_Resources was used on the HPC. There were bam files for 2 individualas as diploid (genes_for_students_Nent30_D10_purged_toExcelsa.bam) and tetraploid (genes_for_students_Rot26_D10_purged_toExcelsa.bam). VCF files were also available for diploids (UK_scan_dips.vcf) and tetraploids (UK_scan_tets.vcf). Moreover, the reference genome (C_excelsa_V5.fasta) and annotation (C_excelsa_V5_braker2_wRseq.gff3) files were used for different purposes.

## Methodology

## First Step
The initial step requires the making of the consensus sequences for diploids and tetraploids individually. In order to make consensus files, 3 different batch files were prepared. 
The first part of the code emloyed the GATK tool for variant selection and the piece of code shown below:
Initially the required Conda environment must be activated, then the assigned genes (g46214, g40302, g32580 and g5766) to the Group 1 were filtered by GATK tool. For that purpose, -R command refers the reference genome, -V command refers the VCF files that contain the variants, -L command refers genomic intervals which must be employed and -O command refers the output file that the variants to be written.
````
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
-L Cexcelsa_scaf_2:36768726-36768935 -L Cexcelsa_scaf_2:36769070-36769459 -L Cexcelsa_scaf_2:36769937-36770296 \
-O /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g46214.vcf

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
-L Cexcelsa_scaf_2:36768726-36768935 -L Cexcelsa_scaf_2:36769070-36769459 -L Cexcelsa_scaf_2:36769937-36770296  \
-O /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g46214.vcf

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
-O /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g5766.vcf
````
## Second Step 
The second step requires activation of Conda environment as well. After that, generated output files converted to the .gz extension and also index files were created by using bgzip and tabix command orderly. The code can be seen below:

````
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
bgzip /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g46214.vcf
tabix -f -p vcf /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g46214.vcf.gz

bgzip /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g40302.vcf
tabix -f -p vcf /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g40302.vcf.gz

bgzip /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g32580.vcf
tabix -f -p vcf /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g32580.vcf.gz

bgzip /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g5766.vcf
tabix -f -p vcf /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g5766.vcf.gz

bgzip /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g46214.vcf
tabix -f -p vcf /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g46214.vcf.gz

bgzip /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g40302.vcf
tabix -f -p vcf /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g40302.vcf.gz

bgzip /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g32580.vcf
tabix -f -p vcf /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g32580.vcf.gz

bgzip /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g5766.vcf
tabix -f -p vcf /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g5766.vcf.gz
````
## Third Step
The third step is employed to generate the consensus file by using samtools and bcftools.
````
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
samtools faidx /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta Cexcelsa_scaf_2:36768726-36768935 Cexcelsa_scaf_2:36769070-36769459 Cexcelsa_scaf_2:36769937-36770296 | bcftools consensus /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g46214.vcf.gz -o g46214_dips.fasta /shared/Project2_Resources/Group1/consensus/
samtools faidx /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta Cexcelsa_scaf_2:4113454-4114535 Cexcelsa_scaf_2:4117100-4117330 Cexcelsa_scaf_2:4117593-4117809 | bcftools consensus /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g40302.vcf.gz -o g40302_dips.fasta /shared/Project2_Resources/Group1/consensus/
samtools faidx /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta Cexcelsa_scaf_3:6912760-6916296 | bcftools consensus /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g32580.vcf.gz -o g32580_dips.fasta /shared/Project2_Resources/Group1/consensus/
samtools faidx /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta Cexcelsa_scaf_4:27471771-27471836 Cexcelsa_scaf_4:27471978-27472061 Cexcelsa_scaf_4:27472160-27472288 Cexcelsa_scaf_4:27472382-27472450 Cexcelsa_scaf_4:27472531-27472611 Cexcelsa_scaf_4:27472700-27472804 Cexcelsa_scaf_4:27472891-27473121 Cexcelsa_scaf_4:27473210-27474400 Cexcelsa_scaf_4:27474735-27475839 Cexcelsa_scaf_4:27475929-27476050 Cexcelsa_scaf_4:27476143-27476292 Cexcelsa_scaf_4:27476446-27476607 Cexcelsa_scaf_4:27476687-27476845 Cexcelsa_scaf_4:27476939-27477055 Cexcelsa_scaf_4:27477147-27477257 Cexcelsa_scaf_4:27477347-27477979 | bcftools consensus /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/diploids/output_dips_g5766.vcf.gz -o g5766_dips.fasta /shared/Project2_Resources/Group1/consensus/
samtools faidx /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta Cexcelsa_scaf_2:36768726-36768935 Cexcelsa_scaf_2:36769070-36769459 Cexcelsa_scaf_2:36769937-36770296 | bcftools consensus /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g46214.vcf.gz -o tetras_g46214.fasta /shared/Project2_Resources/Group1/consensus/
samtools faidx /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta Cexcelsa_scaf_2:4113454-4114535 Cexcelsa_scaf_2:4117100-4117330 Cexcelsa_scaf_2:4117593-4117809 | bcftools consensus /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g40302.vcf.gz -o tetras_g40302.fasta /shared/Project2_Resources/Group1/consensus/
samtools faidx /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta Cexcelsa_scaf_3:6912760-6916296| bcftools consensus /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g32580.vcf.gz -o tetras_g32580.fasta /shared/Project2_Resources/Group1/consensus/
samtools faidx /shared/Project2_Resources/Group1/HPC/Reference_Genome/C_excelsa_V5.fasta Cexcelsa_scaf_4:27471771-27471836 Cexcelsa_scaf_4:27471978-27472061 Cexcelsa_scaf_4:27472160-27472288 Cexcelsa_scaf_4:27472382-27472450 Cexcelsa_scaf_4:27472531-27472611 Cexcelsa_scaf_4:27472700-27472804 Cexcelsa_scaf_4:27472891-27473121 Cexcelsa_scaf_4:27473210-27474400 Cexcelsa_scaf_4:27474735-27475839 Cexcelsa_scaf_4:27475929-27476050 Cexcelsa_scaf_4:27476143-27476292 Cexcelsa_scaf_4:27476446-27476607 Cexcelsa_scaf_4:27476687-27476845 Cexcelsa_scaf_4:27476939-27477055 Cexcelsa_scaf_4:27477147-27477257 Cexcelsa_scaf_4:27477347-27477979 | bcftools consensus /shared/Project2_Resources/Group1/HPC/VCFs/For_Students_2023/tetraploids/output_tetras_g5766.vcf.gz -o tetras_g5766.fasta /shared/Project2_Resources/Group1/consensus/
````
## Fourth Step
After generation of consensus files, in order to create structural homology models several steps had been applied. The initial step was to translate the consensus files from Nucleotide sequence to Protein sequence by using the Expasy Translation tool (https://web.expasy.org/translate/). Then the translated sequences were uploaded to the Swiss Model tool (https://swissmodel.expasy.org) to obtain the structural models and PDB files which can be intrepreted by PyMOL further. The structural models were selected with considering the best GMQE and sequence identity values. Additionally, to obtain the multiple sequence alingments, JalView tool has been used and the differences between tetraploid and diploid sequences were detected. According to these differences the effect in the protein changes can be interpreted.


