#' Partisympati efter kön och ålder, 4 åldersklasser (urvalsundersökning).
#'
#' @import pxweb
#' @export
#'
ps_e_kon_alder <- function( ) {
  
  pxweb_query_list <- 
    list("Kon"=c("1","2","TOT"),
         "Alder"=c("18-29","30-49","50-64","65+","tot18+"),
         "Parti"=c("m","c","l","kd","nyd","mp","s","v","SD","övr"),
         "ContentsCode"=c("ME0201CM","ME0201CN"),
         "Tid"=c("1972M11","1973M02","1973M05","1973M11","1974M05","1974M11","1975M05","1975M11","1976M02","1976M05","1976M11","1977M05","1977M11","1978M05","1978M11","1979M02","1979M05","1979M11","1980M05","1980M11","1981M05","1984M05","1984M11","1985M05","1985M11","1986M05","1986M11","1987M05","1987M11","1988M02","1988M05","1988M11","1989M05","1989M11","1990M05","1990M11","1991M05","1991M11","1992M05","1992M11","1993M05","1993M11","1994M05","1994M11","1995M05","1995M11","1996M05","1996M11","1997M05","1997M11","1998M05","1998M11","1999M05","1999M11","2000M05","2000M11","2001M05","2001M11","2002M05","2002M11","2003M05","2003M11","2004M05","2004M11","2005M05","2005M11","2006M05","2006M11","2007M05","2007M11","2008M05","2008M11","2009M05","2009M11","2010M05","2010M11","2011M05","2011M11","2012M05","2012M11","2013M05","2013M11","2014M05","2014M11","2015M05","2015M11","2016M05","2016M11","2017M05","2017M11","2018M05","2018M11","2019M05","2019M11","2020M05","2020M11","2021M05"))
  
  
  
  px_data <- 
    pxweb_get(url = "http://api.scb.se/OV0104/v1/doris/sv/ssd/ME/ME0201/ME0201B/Partisympati051",
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