# Learning R, Part 2
#' Based on r4ds (http://r4ds.had.co.nz/), Chapter 3
# 
# Dataset: diamonds
# Part of ggplot2 sample data
# 54,000 diamonds classified by 4 Cs (cut, carat, clarity, color), 
# dimensions and price

require(tidyverse)

#' Load dataset (not necessary, for convenience)
diamonds <- diamonds

#' Explore dataset
summary(diamonds)
?diamonds

#' (7) Bar chart
#' Grouped by cut, bars colored (fill) by cut
myplot7 <- ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = diamonds$cut, 
                         fill = diamonds$cut)
  )

#' Assign labels
#' //TODD: refactor
myplot7[["labels"]][["x"]] <- "Diamonds by Cut"
myplot7[["labels"]][["y"]] <- "Count"
myplot7[["labels"]][["fill"]] <- "Cut"

myplot7 + theme_bw()

#' (7a) Variant with adjacent bars (dodge)
myplot7a <-  ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = diamonds$cut, 
                         fill = diamonds$clarity), 
           position = "dodge")

#' Assign labels
#' //TODD: refactor
myplot7a[["labels"]][["x"]] <- "Diamonds by Cut"
myplot7a[["labels"]][["y"]] <- "Count"
myplot7a[["labels"]][["fill"]] <- "Clarity"

myplot7a + theme_bw()

#' (7b) Variant with bars stacked
myplot7b <-  ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = diamonds$cut, 
                         fill = diamonds$clarity))

#' Assign labels
#' //TODD: refactor
#' //TODO: reverse order that best (IF) go on top
myplot7b[["labels"]][["x"]] <- "Diamonds by Cut"
myplot7b[["labels"]][["y"]] <- "Count"
myplot7b[["labels"]][["fill"]] <- "Clarity"

myplot7b + theme_bw()

# (7c) Variant with stacked bars 
# with identity and Alpha channel transparency

myplot7c <-  ggplot(data = diamonds, 
                    mapping = aes(x = diamonds$cut, 
                                  fill = diamonds$clarity)
) + 
  geom_bar(alpha = 1/5, position = "identity")

myplot7c + theme_bw()

#' Statistical transformations
#' 
myplot8 <-  ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = diamonds$cut, y = diamonds$depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

myplot8 + theme_bw()

#' Scatterplot Carat by Clarity
#' 
myplot9 <- ggplot(data = diamonds, 
                  mapping = aes(x = diamonds$carat,
                                y = diamonds$clarity,
                                color = diamonds$cut)
                  ) + 
  geom_point()

myplot9 + theme_bw()

