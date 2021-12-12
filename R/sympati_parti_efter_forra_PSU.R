#' Röstningssympati nu (parti man skulle rösta på) efter röstningssympati i förra PSU.
#'
#' @import pxweb
#' @export
#'
sympati_parti_efter_forra_PSU <- function( tid ) {
  
  pxweb_query_list <- 
    list("Rpsfu"=c("m","c","l","kd","mp","s","v","SD","övr","vet ej","hela väljarkåren"),
         "Pvalnu"=c("m","c","l","kd","mp","s","v","SD","övr","vet ej"),
         "ContentsCode"=c("000004JN","000001IZ","000001IY"),
         "Tid"= tid)
  
  
  px_data <-
    pxweb::pxweb_get(url = "http://api.scb.se/OV0104/v1/doris/sv/ssd/ME/ME0201/ME0201A/Rostningssympati2000",
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