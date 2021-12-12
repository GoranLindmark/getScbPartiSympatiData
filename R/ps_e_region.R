#' Partisympati efter region (Sverige, 10 grupper) (urvalsundersökning).
#'
#' @import pxweb
#' @export
#'
ps_e_region <- function( ) {
  
  pxweb_query_list <- 
    list("Sverige10grupper"=c("0030","0180","1480","SE01exkl0180","SE04exkl0030","SE06","SE07+SE08","SE09","SE0Aexkl1480","SE12","Z01"),
         "Partisympati"=c("m","c","l","kd","nyd","mp","s","v","SD","övr"),
         "ContentsCode"=c("ME0201A1","ME0201A2"),
         "Tid"=c("2006M05","2006M11","2007M05","2007M11","2008M05","2008M11","2009M05","2009M11","2010M05","2010M11","2011M05","2011M11","2012M05","2012M11","2013M05","2013M11","2014M05","2014M11","2015M05","2015M11","2016M05","2016M11","2017M05","2017M11","2018M05","2018M11","2019M05","2019M11","2020M05","2020M11","2021M05"))
  
  
  
  px_data <- 
    pxweb_get(url = "http://api.scb.se/OV0104/v1/doris/sv/ssd/ME/ME0201/ME0201B/Partisympati102",
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