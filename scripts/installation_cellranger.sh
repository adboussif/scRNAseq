#!/bin/bash

# Création des répertoires
mkdir -p data/ProbeSet data/Chromium data/Telemetry data/refdata data/Gemcode

# Téléchargement de Cell Ranger
wget -O cellranger-9.0.1.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-9.0.1.tar.gz?Expires=1741699305&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA&Signature=Q1r~NioAyD134OyBkvDgPsUVQhxEgmir3KEokX3uqsv5WwM1E8zM36B63c-nCgxHylyQDAlPeyLnbEWU7Ix04IddviPyPekun3h1DKxnTy6NXsjoohSsDDSUC0fxhlH2j~OANZ51ADbkftLE29bR2Ghjkgdb1TuPmRvh-KYP9eM4yquaDPg5In9YkZYbCATZM-tHRNJIESBX77Bg1oCPD~RbrZCL3e-~ctwv3Ul5IOcIffmxy6RfYkVsozIvQXkE5gcU8NmOqpjVhZjWZ~yX9kipkvJ7BII6-kHF7jHx1-qzD88~ZY0qRlTiHGXZOSDjXIBTsYEHPYa-gurhdBfw4g__"

# Téléchargement des références génomiques dans refdata
wget -P data/refdata "https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-2024-A.tar.gz"
wget -P data/refdata "https://cf.10xgenomics.com/supp/cell-vdj/refdata-cellranger-vdj-GRCh38-alts-ensembl-7.1.0.tar.gz"

# Téléchargement des fichiers ProbeSet
wget -P data/ProbeSet "https://cf.10xgenomics.com/supp/cell-exp/probeset/probe-barcodes-fixed-rna-profiling.txt"
wget -P data/ProbeSet "https://cf.10xgenomics.com/supp/cell-exp/probeset/Chromium_Human_Transcriptome_Probe_Set_v1.1.0_GRCh38-2024-A.csv"
wget -P data/ProbeSet "https://cf.10xgenomics.com/supp/cell-exp/probeset/Chromium_Human_Transcriptome_Probe_Set_v1.1.0_GRCh38-2024-A.bed"
wget -P data/ProbeSet "https://cf.10xgenomics.com/supp/cell-exp/probeset/Chromium_Human_Transcriptome_Probe_Set_v1.1.0_GRCh38-2024-A.offtarget.csv"

# Téléchargement des fichiers Chromium
wget -P data/Chromium "https://cf.10xgenomics.com/supp/cell-exp/chromium-shared-sample-indexes-plate.json"
wget -P data/Chromium "https://cf.10xgenomics.com/supp/cell-exp/chromium-shared-sample-indexes-plate.csv"
wget -P data/Chromium "https://cf.10xgenomics.com/supp/cell-vdj/Chromium-i7-Multiplex-Kit-N-Set-A-sample-indexes-plate.csv"
wget -P data/Chromium "https://cf.10xgenomics.com/supp/cell-vdj/Chromium-i7-Multiplex-Kit-N-Set-A-sample-indexes-plate.json"

# Téléchargement du fichier Telemetry
wget -P data/Telemetry "https://www.10xgenomics.com/support/software/cell-ranger/latest/tutorials/cr-pipeline-telemetry"

# Téléchargement des fichiers Gemcode
wget -P data/Gemcode "https://cf.10xgenomics.com/supp/cell-exp/gemcode-single-cell-sample-indexes-plate.csv"
wget -P data/Gemcode "https://cf.10xgenomics.com/supp/cell-exp/gemcode-single-cell-sample-indexes-plate.json"

# Extraction des archives
tar -xzvf cellranger-9.0.1.tar.gz

tar -xzvf data/refdata/refdata-gex-GRCh38-2024-A.tar.gz -C data/refdata
tar -xzvf data/refdata/refdata-cellranger-vdj-GRCh38-alts-ensembl-7.1.0.tar.gz -C data/refdata

# Mise à jour du PATH
cd cellranger-9.0.1
export PATH=$(pwd):$PATH
cellranger

echo "Installation terminée"
