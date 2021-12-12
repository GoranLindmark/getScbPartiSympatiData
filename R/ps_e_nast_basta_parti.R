#' Väljarkåren (svarsfördelning PSU) efter partisympati, näst bästa parti
#'
#' @import pxweb
#' @export
#'
ps_e_nast_basta_parti <- function( ) {
  
  pxweb_query_list <- 
    list("Psymp"=c("m","c","l","kd","mp","s","v","SD","övr","ingen sympati/vet ej","hela väljarkåren"),
         "Nastbastaparti"=c("m","c","l","kd","mp","s","v","SD","övr","inget parti","vet ej"),
         "ContentsCode"=c("000001IU","000001IT"),
         "Tid"=c("2010M11","2011M05","2011M11","2012M05","2012M11","2013M05","2013M11","2014M05","2014M11","2015M05","2015M11","2016M05","2016M11","2017M05","2017M11","2018M05","2018M11","2019M05","2019M11","2020M05","2020M11","2021M05"))
  
  
  
  px_data <- 
    pxweb_get(url = "http://api.scb.se/OV0104/v1/doris/sv/ssd/ME/ME0201/ME0201D/Nastbastaparti190",
              query = pxweb_query_list)
  
  # Convert to data.frame
  px_data_frame <-
    as.data.frame(px_data,
                  column.name.type = "text",
                  variable.value.type = "text")
  
  # # Get pxweb data comments
  # px_data_comments <- pxweb_data_comments(px_data)
  # px_data_comments_df <- as.data.frame(px_data_comments)
  
  # Cite the data as
  # pxweb_cite(px_data)
  
  px_data_frame
  
}