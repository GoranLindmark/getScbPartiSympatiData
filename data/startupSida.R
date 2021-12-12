
# library(scbPartiSympati)
Tid = c("2014M05","2014M11","2015M05","2015M11","2016M05","2016M11","2017M05","2017M11",
        "2018M05","2018M11","2019M05","2019M11","2020M05","2020M11","2021M05","2021M11")

Tid2 = c("2014M05","2014M11","2015M05","2015M11","2016M05","2016M11","2017M05","2017M11",
         "2018M05","2018M11","2019M05","2019M11","2020M05","2020M11","2021M05")

#' Title
#'
#' @return
#' @export
#' @import magritter
#' 
generate_graphs <- function() {
  ps_e_kon_alder_graf <- function() {
    ps_e_kon_alder() %>%
      dplyr::filter(`2 ggr/?r` == "2021M05") %>%
      dplyr::filter(k?n == "m?n och kvinnor totalt") %>%
      dplyr::group_by(?lder, parti) %>%
      dplyr::summarize(antal = sum(`Svarsf?rdelning, procent`),
                .groups = "drop") %>%
      dplyr::filter(?lder != "totalt 18+ ?r") %>%
      ggplot2::ggplot(aes(x =   ?lder, y = antal)) +
      ggplot2::facet_wrap( ~ parti) +
      ggplot2::geom_col()
  }
  
  ps_e_kon_alder_7klasser_graf <- function() {
    ps_e_kon_alder_7klasser() %>%
      dplyr::filter(`2 ggr/?r` == "2021M05") %>%
      dplyr::filter(k?n == "m?n och kvinnor totalt") %>%
      dplyr::group_by(?lder, parti) %>%
      dplyr::summarize(antal = sum(`Svarsf?rdelning, procent`),
                .groups = "drop") %>%
      dplyr::filter(?lder != "totalt 18+ ?r") %>%
      ggplot2::ggplot(aes(x =   ?lder, y = antal)) +
      ggplot2::facet_wrap( ~ parti) +
      ggplot2::geom_col() +
      ggplot2::coord_flip()
  }
  
  ps_e_kon_bostadstyp_graf <- function() {
    ps_e_kon_bostadstyp() %>%
      dplyr::filter(`2 ggr/?r` == "2021M05") %>%
      dplyr::filter(bostadstyp != " totalt, bostadstyp") %>%
      dplyr::group_by(bostadstyp, partisympati) %>%
      dplyr::summarize(antal = sum(`Svarsf?rdelning, procent`),
                .groups = "drop") %>%
      ggplot2::ggplot(aes(x =  bostadstyp, y = antal)) +
      ggplot2::facet_wrap( ~ partisympati) +
      ggplot2::geom_col() +
      ggplot2::coord_flip()
  }
  
  ps_e_kon_civilst?nd_graf <- function() {
    ps_e_kon_civilstand() %>%
      dplyr::filter(`2 ggr/?r` == "2021M05") %>%
      dplyr::filter(civilst?nd != "totalt, ogifta och gifta") %>%
      dplyr::group_by(civilst?nd, partisympati) %>%
      dplyr::summarize(antal = sum(`Svarsf?rdelning, procent`),
                .groups = "drop") %>%
      ggplot2::ggplot(aes(x =  civilst?nd, y = antal)) +
      ggplot2::facet_wrap( ~ partisympati) +
      ggplot2::geom_col()
  }
  
  ps_e_kon_socioekonomiskindelning_graf <- function() {
    ps_e_kon_socioekonomiskIndelning() %>%
      dplyr::filter(`2 ggr/?r` == "2021M05") %>%
      dplyr::filter(`socioekonomisk indelning SEI82` != "summa arbetare") %>%
      dplyr::filter(`socioekonomisk indelning SEI82` != "summa tj?nstem?n") %>%
      dplyr::filter(`socioekonomisk indelning SEI82` != "summa f?retagare (inklusive lantbrukare)") %>%
      dplyr::filter(`socioekonomisk indelning SEI82` != "hela v?ljark?ren") %>%
      dplyr::group_by(`socioekonomisk indelning SEI82`, partisympati) %>%
      dplyr::summarize(antal = sum(`Svarsf?rdelning, procent`),
                .groups = "drop") %>%
      ggplot2::ggplot(aes(x = `socioekonomisk indelning SEI82`, y = antal)) +
      ggplot2::facet_wrap( ~ partisympati) +
      ggplot2::geom_col() +
      ggplot2::coord_flip()
  }
  
  ps_e_kon_utbildning_graf <- function() {
    x = ps_e_kon_utbildning()
    x$`Utbildningsniv? SUN 2000`
    ps_e_kon_utbildning() %>%
      dplyr::filter(`2 ggr/?r` == "2021M05") %>%
      dplyr::filter(`Utbildningsniv? SUN 2000`  != "totalt") %>%
      dplyr::group_by(`Utbildningsniv? SUN 2000`, partisympati) %>%
      dplyr::summarize(antal = sum(`Svarsf?rdelning, procent`),
                .groups = "drop") %>%
      ggplot2::ggplot(aes(x =  `Utbildningsniv? SUN 2000`, y = antal)) +
      ggplot2::facet_wrap( ~ partisympati) +
      ggplot2::geom_col() +
      ggplot2::coord_flip()
  }
  
  ps_e_kon_utrikes_inrikes_bakgrund_graf <- function() {
    ps_e_kon_utrikes_inrikes_bakgrund() %>%
      dplyr::filter(`2 ggr/?r` == "2021M05") %>%
      dplyr::filter(`utl?ndsk/svensk bakgrund`  != "totalt, utl?ndsk/svensk bakgrund") %>%
      dplyr::group_by(`utl?ndsk/svensk bakgrund`, partisympati) %>%
      dplyr::summarize(antal = sum(`Svarsf?rdelning, procent`),
                .groups = "drop") %>%
      ggplot2::ggplot(aes(x =  `utl?ndsk/svensk bakgrund`, y = antal)) +
      ggplot2::facet_wrap( ~ partisympati) +
      ggplot2::geom_col() +
      ggplot2::coord_flip()
  }
  
  ps_e_kon_alder_graf()
  ps_e_kon_alder_7klasser_graf()
  ps_e_kon_bostadstyp_graf()
  ps_e_kon_civilst?nd_graf()
  ps_e_kon_socioekonomiskindelning_graf()
  ps_e_kon_utbildning_graf()
  ps_e_kon_utrikes_inrikes_bakgrund_graf()
}

generate_graphs()
