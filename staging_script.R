source('scripts/load_libraries.R')
source('scripts/meg_utility_functions.R')


# Read in file created by GUI notebook
file <- read.csv(paste(getwd(), "/metagenome_analysis_vars.csv", sep = ""),
                 colClasses = "character",
                 header = FALSE,
                 col.names = c("V1", "V2", "V3","V4"))

sample_column_id              <- file[1,2]
graph_output_dir              <- file[2,2]
stats_output_dir              <- file[3,2]
amr_count_matrix_filepath     <- file[4,2]
amr_metadata_filepath         <- file[5,2]
megares_annotation_filename   <- file[6,2]
biom_file                     <- file[7,2]
tre_file                      <- file[8,2]
tax_fasta                     <- file[9,2]
taxa_file                     <- file[10,2]
microbiome_temp_metadata_file <- file[11,2]

# Creates a list of all the AMR variables, and is dependent on the number inputed in the previous script
AMR_exploratory_analyses <- list()
for (i in 1:(which(file$V1 == "microbiome_exploratory_analyses") - 13)){
  subset_list = eval(parse(text=file[(12+i),2]))
  AMR_exploratory_analyses <- append(AMR_exploratory_analyses, 
                                     list(list(name = file[(12+i),1],
                                               subsets = subset_list,
                                               exploratory_var = file[(12+i),3],
                                               order = file[(12+i),4])))
}


y <- which(file$V1 == "microbiome_exploratory_analyses")
microbiome_exploratory_analyses <- list()
for (i in 1:(nrow(file) - y)){
  subset_list = eval(parse(text=file[(y+i),2]))
  microbiome_exploratory_analyses <- append(microbiome_exploratory_analyses, 
                                     list(list(name = file[(y+i),1],
                                               subsets = subset_list,
                                               exploratory_var = file[(y+i),3],
                                               order = file[(y+i),4])))
}


# Eventually, we need to replace this and add the option of a GUI data entry too


# Each analyses you wish to perform should have its own list in the following
# statistical_analyses list.  A template is provided to get you started.
# Multiple analyses, subsets, and contrasts are valid, but only one random
# effect can be used per analysis.  The contrasts of interest must have their
# parent variable in the model matrix equation.  Contrasts are named by
# parent variable then child variable without a space inbetween, for example:
# PVar1Cvar1 where the model matrix equation is ~ 0 + Pvar1.
AMR_statistical_analyses = list(
  # Analysis 1
  # Description: 
  list(
    name = 'Treatment',
    subsets = list(),
    model_matrix = '~ 0 + Treatment ',
    contrasts = list('TreatmentCONV - TreatmentRWA'),
    random_effect = NA
  )
)

microbiome_statistical_analyses = list(
  # Analysis 1
  # Description: 
  list(
    name = 'Treatment',
    subsets = list(),
    model_matrix = '~ 0 + Treatment ',
    contrasts = list('TreatmentCONV - TreatmentRWA'),
    random_effect = NA
  )
)


####### END OF USER CONTROLS ######

## Pick the correct script that handles resistome data and/or microbiome data.
#### If shotgun microbiome and megares analysis, run:
#source('scripts/metagenomeSeq_megares_kraken.R')

#### If 16S microbiome and megares analysis, run:
source('scripts/metagenomeSeq_megares_qiime.R')

######## THEN print figures #

# After running this script, these are the useful objects that contain all the data aggregated to different levels
# The metagenomeSeq objects are contained in these lists "AMR_analytic_data" and "microbiome_analytic_data"
# Melted counts are contained in these data.table objects "amr_melted_analytic" "microbiome_melted_analytic"

## Run code to make some exploratory figures, zero inflated gaussian model, and output count matrices.
#suppressMessages(source('scripts/print_figures.R'))
