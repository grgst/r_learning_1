#' Learning R, Part 1
#' Based on r4ds
require(tidyverse)
require(lintr)

mpg

#' (1) Plot
#' 
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

  
