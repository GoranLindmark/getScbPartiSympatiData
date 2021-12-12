#' Valresultat om det varit val idag (PSU) efter kön.
#'
#' @import pxweb
#' @export
#'
valresultat_val_idag_kon <- function(tid) {
  
  pxweb_query_list <- 
    list("Kon"=c("1","2","1+2"),
         "Parti"=c("m","c","l","kd","nyd","mp","s","v","SD","övr"),
         "ContentsCode"=c("000001YG","000001YD"),
         "Tid"=tid)
  
  
  
  px_data <-
    pxweb::pxweb_get(url = "http://api.scb.se/OV0104/v1/doris/sv/ssd/ME/ME0201/ME0201A/Vid11",
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