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
  geom_bar(alpha = 0.2, position = "identity")

myplot7c + theme_bw()

#' Statistical transformations
#' 
myplot8 <- ggplot(data = diamonds) +
  stat_summary(mapping = aes(x = diamonds$cut,
                             y = diamonds$depth),
               fun.ymin = min,
               fun.ymax = max,
               fun.y = median
               )

myplot8 + theme_bw()

#' (9) What determines a price of a diamond?
#' Scatterplots price by carat, price by clarity, price by color
#' 
#' (9a)
myplot9a <- ggplot(data = filter(diamonds,
                                 clarity == "IF"),
                  mapping = aes(x = carat,
                                y = price)
                  )

myplot9a +
  geom_point() +
  geom_smooth(color = "red") +
  theme_bw()

#' (9b)
myplot9b <- ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = diamonds$price), color = "red")

myplot9b


#' (9c)
myplot9c <- ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = diamonds$color,
                         fill = diamonds$clarity)
           )

myplot9c

#' (9d)
myplot9d <- ggplot(data = filter(diamonds,
                                 diamonds$clarity == "IF")) +
  stat_summary(
    mapping = aes(x = color, y = price),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

myplot9d + theme_bw()

#' (9e)
#' Filtering data on clarity (top) and cut (Ideal)
f1 <- filter(diamonds, clarity == "IF", cut == "Ideal", carat > 0.95)

#' Plotting price by carat, highlighting color
myplot9e <- ggplot(data = f1,
                   mapping = aes(x = carat,
                                 y = price,
                                 color = color)
                   ) +
  geom_point() +
  #geom_abline(color = "red") + # not as expected
  scale_color_brewer(palette = 4, direction = 1)
            

myplot9e + theme_bw()
