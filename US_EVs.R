library(ggplot2)
library(tidyverse)
library(readxl)
library(usmap)

EV <- read_excel("EV.xlsx")
View(EV)

EV$fips <- statepop$fips
EV$abbr <- statepop$abbr

plot_usmap(data = EV,
           values = "Registration",
           labels = FALSE,
           label_color = "black",
           ) + 
  labs(title = "EV sales in the U.S. States",
       subtitle = "This is a map of registered EVs in the United States.") +
  scale_fill_continuous(low = "white",
                        high = "green",
                        breaks = c(100000, 200000, 300000, 400000),
                        labels = c("100k", "200k", "300k", "400k"))
ggsave(filename = "EVsalesUSA.png")
      
