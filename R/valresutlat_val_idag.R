#' Valresultat om det varit val idag (PSU).
#'
#' @import pxweb
#' @export
#'



valresutlat_val_idag <- function(tid) {
  pxweb_query_list <- 
    list("Parti"=c("c","l","m","kd","nyd","s","v","mp","SD","övr","c+fp+m+kd","s+v+mp","borgerligt block","socialistiskt block"),
         "ContentsCode"=c("ME0201B1","ME0201B2","ME0201B3","ME0201B4"),
         "Tid"= tid)
  
  
  px_data <-
    pxweb::pxweb_get(url = "http://api.scb.se/OV0104/v1/doris/sv/ssd/ME/ME0201/ME0201A/Vid10",
              query = pxweb_query_list)
  
  # Convert to data.frame
  px_data_frame <-
    as.data.frame(px_data,
                  column.name.type = "text",
                  variable.value.type = "text")
  
  # Get pxweb data comments
  # px_data_comments <- pxweb_data_comments(px_data)
  # px_data_comments_df <- as.data.frame(px_data_comments)
  
  # Cite the data as
  # pxweb_cite(px_data)
  
  # px_data_frame %>%
  #   filter(substr(`2 ggr/år`, start = 1, stop = 4) == '2021') %>%
  #   filter(!is.na(`Val idag, procent`)) %>%
  #   pivot_wider(
  #     names_from = `2 ggr/år`,
  #     values_from = c(`Val idag, procent`, `Felmarginal, ±`)
  #   ) %>%
  #   View
  # 
  # px_data_frame$`2 ggr/år`
  # px_data_frame$`Val idag, procent`
  # px_data_frame$`Felmarginal, ±`
  
  px_data_frame
  
}