#' Partisympati efter standard för svensk yrkesklassificering (SSYK 2012) bland sysselsatta.
#'
#' @import pxweb
#' @export
#'
ps_e_yrkesklassifisering <- function( ) {
  
  pxweb_query_list <- 
    list("YrkKlassSSYK2012"=c("01","02","03","04","05","06","07","08","10"),
         "Partisympati"=c("m","c","l","kd","nyd","mp","s","v","SD","övr"),
         "ContentsCode"=c("000005GM","000005GL"),
         "Tid"=c("2021M05"))
  
  
  px_data <- 
    pxweb_get(url = "http://api.scb.se/OV0104/v1/doris/sv/ssd/ME/ME0201/ME0201B/Partisympati21",
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