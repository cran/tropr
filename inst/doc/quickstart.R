## ---- echo = FALSE, message = FALSE--------------------------------------
library(tropr)
library(ggplot2)

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
plot(q)

