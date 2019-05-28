if (!require("pacman")) install.packages("pacman")
pacman::p_load(
  data.table,
  devtools,
  caret,
  rJava,
  RJDBC,
  assertthat,
  aws.s3,
  logging,
  tidyr,
  stringdist,
  zoo,
  aws.s3,
  stringr,
  foreach,
  doParallel,
  dplyr,
  dbplyr,
  futile.logger
)

devtools::install_github("zacharyrsmith/RSnowflake")
devtools::install_github('carrothealth/carrothealth_r_package')
 #                        , ref = '79a48df005f6a4a993415c48e86f1c54b568cf61')
library(carrothealth)

options(scipen=999)

tapply_to_dataframe <- function(dataset, valuename, keyname) {
  dataset <- as.data.frame(dataset, stringsAsFactors=F)
  colnames(dataset) <- valuename
  dataset$bogus <- row.names(dataset)
  colnames(dataset)[which(colnames(dataset)=="bogus")] <- keyname
  for(yopp in 1:ncol(dataset)){
    dataset[,yopp] <- as.vector(dataset[,yopp])
  }
  return(dataset)
}

stall <- function(){
  bogus <- foreach(qqq=1:1000000000, .combine = "c") %do% {
    exp(log(qqq))/qqq
  }
}


