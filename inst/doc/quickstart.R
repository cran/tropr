## ---- echo = FALSE, message = FALSE--------------------------------------
library(tropr, warn.conflicts = F)
library(dplyr, warn.conflicts = F)
library(ggplot2, warn.conflicts = F)

## ---- eval = F-----------------------------------------------------------
#  install.packages("tropr")

## ---- eval = F-----------------------------------------------------------
#  devtools::install_github("zedoul/tropr")

## ---- eval = F-----------------------------------------------------------
#  library(tropr)

## ------------------------------------------------------------------------
library(tropr)

.url <- "http://tvtropes.org/pmwiki/pmwiki.php/Main/SenseiChan"
content <- trope_content(.url)
.df <- as.data.frame(content)
head(.df[, c("category", "link")])

## ------------------------------------------------------------------------
library(ggplot2)
q <- ggplot(.df, aes(category)) + geom_bar() +
       coord_flip() + ylab("Freq") + xlab("")

## ---- fig.width=7,fig.height=6-------------------------------------------
plot(q)

## ---- eval = F-----------------------------------------------------------
#  library(tropr)
#  
#  .urls <- c("http://tvtropes.org/pmwiki/pmwiki.php/Main/SenseiChan")
#  res <- trope_cache(.urls, depth = 3, filter_pattern = "/Main/")

## ------------------------------------------------------------------------
library(tropr)
library(ggplot2)
library(dplyr)

.url <- "http://tvtropes.org/pmwiki/pmwiki.php/Characters/LittleWitchAcademia"
hist_content <- trope_history(.url)
.data <- aggr_history_daily_count(hist_content)
.resolution <- "1 week"

# In this case, we are interested in history only after the TV release, and
# before the episode 23
.data <- .data[c(47:169), ]

q <- ggplot(.data, aes(x = date, y = count)) +
    geom_line(size= .8) +
    theme(axis.text.x = element_text(angle = 50, hjust = 1, vjust = 1, size = 8),
          plot.title = element_text(hjust = 0.5)) +
    scale_x_date(date_breaks = .resolution) +
    ggtitle("Edits on Little Witch Academia Main Page in TV Tropes") +
    xlab("") + ylab("#edit")

## ---- fig.width=7,fig.height=6-------------------------------------------
plot(q)

## ------------------------------------------------------------------------
library(tropr)
library(ggplot2)
library(magrittr)

impacts <- .data %>% group_by(date = cut(date, "week")) %>% summarise(impact = sum(count))
impacts$date <- paste0("7 days from ", as.character(impacts$date), " (", paste("Episode", rep(1:22)), ")")

q <- ggplot(impacts, aes(x = reorder(date, impact),
                       y = impact,
                       fill = impact)) +
       geom_bar(stat= "identity") +
       theme(axis.text.y = element_text(size = 6)) +
       coord_flip() + ggtitle("Weekly edits on Little Witch Academia Characters Page in TV Tropes") +
       ylab("") + xlab("")

## ---- fig.width=7,fig.height=6-------------------------------------------
plot(q)

## ------------------------------------------------------------------------
.data <- aggr_history_editor_count(hist_content)

q <- ggplot(.data, aes(x = reorder(editor, count),
                       y = count,
                       fill = count)) +
       geom_bar(stat= "identity") +
       theme(axis.text.y = element_text(size = 3)) +
       coord_flip() + ggtitle("Editors on Little Witch Academia Characters Page in TV Tropes\n",
                              paste("from", tail(hist_content)[5, "datetime"],
                                    "to", head(hist_content[1, "datetime"]))) +
       ylab("") + xlab("")

## ---- fig.width=7,fig.height=6-------------------------------------------
plot(q)

