##!/bin/bash

#trim nanopore reads using porechop
#porechop -i data/P7741_minion.fastq -o trimmed_reads/P7741_minion.fastq --format fastq -t 4

mkdir trimmed_reads
read1=data/P7741_R1.fastq.gz
read2=data/P7741_R2.fastq.gz
OutputForwardPaired=trimmed_reads/P7741_R1.fastq.gz    
OutputForwardUnpaired=trimmed_reads/P7741_unpaired_R1.fastq.gz
OutputReversePaired=trimmed_reads/P7741_R2.fastq.gz
OutputReverseUnpaired=trimmed_reads/P7741_unpaired_R2.fastq.gz
threads=4

trimmomatic PE -threads $threads $read1 $read2 \
$OutputForwardPaired $OutputForwardUnpaired \
$OutputReversePaired $OutputReverseUnpaired \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:8:true HEADCROP:3 TRAILING:10 MINLEN:25

mkdir trimmed_reads

#trim illumina reads using sickle
sickle pe -g -f data/P7741_R1.fastq.gz -r data/P7741_R2.fastq.gz -t sanger -o trimmed_reads/P7741_R1.fastq.gz -p trimmed_reads/P7741_R2.fastq.gz -s trimmed_reads/P7741_S.fastq.gz -q 20 -l 20


#trim nanopore reads using porechop
#porechop -i data/P7741_minion.fastq -o trimmed_reads/P7741_minion.fastq --format fastq -t 4


