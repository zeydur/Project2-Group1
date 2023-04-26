# Project 2: Structure Homology Modelling and Functional Predictions
## Group Members: Zeynep Durak (Coding), Alexandra Baousi - Yash Bhagat (Interpretation - Analysis), Ryan Dimmock (Presentation)

## Aim
This repository aims to clearly show and explain the methods, documents and code used throughout the project. The aim of the project can be regarded as generation of structural and functional predictions of the relevant genes (g40302, g32580 and g5766) to compare the contrasting conditions as diploidy and tetraploidy. 

## Documentation
In order to reach out the files the given directory as /shared/Project2_Resources was used on the HPC. There were bam files for 2 individualas as diploid (genes_for_students_Nent30_D10_purged_toExcelsa.bam) and tetraploid (genes_for_students_Rot26_D10_purged_toExcelsa.bam). VCF files were also available for diploids (UK_scan_dips.vcf) and tetraploids (UK_scan_tets.vcf). Moreover, the reference genome (C_excelsa_V5.fasta) and annotation (C_excelsa_V5_braker2_wRseq.gff3) files were used for different purposes.

## Methodology

## First Step
The initial step requires the making of the consensus sequences for diploids and tetraploids individually. In order to make consensus files, 3 different batch files were prepared. 
The first part of the code emloyed the GATK tool for variant selection and the piece of code shown in gatk.sh file:
Initially the required Conda environment must be activated, then the assigned genes (g40302, g32580 and g5766) to the Group 1 were filtered by GATK tool. For that purpose, -R command refers the reference genome, -V command refers the VCF files that contain the variants, -L command refers genomic intervals which must be employed and -O command refers the output file that the variants to be written.

## Second Step 
The second step requires activation of Conda environment as well. After that, generated output files converted to the .gz extension and also index files were created by using bgzip and tabix command orderly. The code can be accessible in tabix.sh file:

## Third Step
The third step is employed to generate the consensus file by using samtools and bcftools. The relevant code can be reached out in samtools.sh file.

## Fourth Step
After generation of consensus files, in order to create structural homology models several steps had been applied. The initial step was to translate the consensus files from Nucleotide sequence to Protein sequence by using the Expasy Translation tool (https://web.expasy.org/translate/). Then the translated sequences were uploaded to the Swiss Model tool (https://swissmodel.expasy.org) to obtain the structural models and PDB files which can be intrepreted by PyMOL further. The structural models were selected with considering the best GMQE and sequence identity values. Additionally, to obtain the multiple sequence alingments, JalView tool has been used and the differences between tetraploid and diploid sequences were detected. According to these differences the effect in the protein changes can be interpreted.


