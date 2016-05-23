valiData::comma_broken_report(valiData::vf_comma_broken("~/Desktop/fake/Academic_terms.csv")

                         l<-     dir("~/Desktop/fake",full.names = T, pattern = ".csv")
                         x<-     lapply(l,valiData:::vf_csv_broken)
                         cat(valiData:::comma_broken_report(x) )
                         valiData:::print.valiData()
      valiData::vf_csv_broken("~/Desktop/fake")

      valiData:::print.validate_file(x[2])
make_ex_csv <- function(broken=TRUE){

  x <- c("tes1, test2",
  writeLines()
}

loc <- file.path(tempdir(), 'temp.csv')
cat(
  paste(c(",x,y", "1, the dog, wen,1", "2,door,2"), collapse="\n"),
  file=file.path(tempdir(), 'temp.csv')
)
vf_csv_broken(loc)
