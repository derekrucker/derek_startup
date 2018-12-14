if (!require("pacman")) install.packages("pacman")
pacman::p_load(
  data.table,
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
  dplyr
)

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
