#' Röstningssympati (parti man skulle rösta på) efter partisympati (bästa parti).
#'
#' @import pxweb
#' @export
#'
sympati_basta_parti <- function(tid) {
  
  pxweb_query_list <- 
    list("Psymp"=c("m","c","l","kd","mp","s","v","SD","övr","ingen sympati/vet ej","hela väljarkåren"),
         "Pvalnu"=c("m","c","l","kd","mp","s","v","SD","övr","blankt","vet ej"),
         "ContentsCode"=c("000001IS","000001IR"),
         "Tid"= tid)
  
  
  px_data <-
    pxweb::pxweb_get(url = "http://api.scb.se/OV0104/v1/doris/sv/ssd/ME/ME0201/ME0201A/Rostningssympati170",
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