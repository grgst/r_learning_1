#' Learning R, Part 1
#' Based on r4ds (http://r4ds.had.co.nz/), Chapter 3
#' 
#' Dataset: mpg
#' Popular cars' fuel efficiency (in mpg) from 1999 and 2008
require(tidyverse)
require(lintr)

#' Load dara
mpg <-  mpg

#' Explore data'
summary(mpg)
?mpg

#' (1) Plot
#' 
myplot1 <- ggplot(data = mpg) +
  geom_point(mapping = aes(x = mpg$displ, y = mpg$hwy))

myplot1 + theme_bw()
myplot1 + theme_light()
myplot1 + theme_dark()
myplot1 + theme_minimal()

#' (1a) Add jitter to combat overplotting
#' 2nd graph overlaid to show the difference
myplot1a <- ggplot(data = mpg) +
  geom_point(mapping = aes(x = mpg$displ, y = mpg$hwy), alpha = 1/2) +
  geom_point(mapping = aes(x = mpg$displ, y = mpg$hwy),
             position = "jitter", color = "red", alpha = 1/4)

myplot1a + theme_bw()

#' Have cars improved in fuel efficiency from 1999 to 2008?
#' Color cars from 1999 in red, from 2008 in green
#' //TODO: refactor, only works with short variables 
#' (without data frame name prefixed)

myplot1x <-  ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(data = filter(mpg, year == "1999"), color = "red") +
  geom_point(data = filter(mpg, year == "2008"), color = "green")

#' Add labels...
myplot1x[["labels"]][["x"]] <- "Engine displacement (l)"
myplot1x[["labels"]][["y"]] <- "Fuel efficiency highway (mpg)"

myplot1x + theme_bw()

#' How do cars city and highway fuel efficiency rates compare?
#' City (red) vs. highway (blue)
myplot1y <-  ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue") +
  geom_point(mapping = aes(x = displ, y = cty), color = "red")

myplot1y + theme_bw()


#' (2) Plot with color
myplot2 <-  ggplot(data = mpg) +
  geom_point(mapping = aes(x = mpg$displ,
                           y = mpg$hwy,
                           color = mpg$class)
             )

myplot2
myplot2 + theme_classic()


#' (3) PLot
#' 
myplot3 <- ggplot(data = mpg) +
  geom_point(mapping = aes(x = mpg$displ,
                           y = mpg$hwy,
                           color = mpg$manufacturer)
             )

#' Change Labels by saving plots in variables, and edit in RStudio
myplot3[["labels"]][["x"]] <- "Displacement"
myplot3[["labels"]][["y"]] <- "Fuel Consumption Highway (mpg)"
myplot3[["labels"]][["colour"]] <- "Manufacturer"

myplot3 + theme_classic()

#' (4) Plot with facets
#' Grouped by drivetrain (drv)
#' 
myplot4 <-  ggplot(data = mpg) +
  geom_point(mapping = aes(x = mpg$displ, y = mpg$hwy)) +
  facet_grid(mpg$drv ~ .)

myplot4 + theme_classic()

#' (5) PLot with Facets, Part 2
#' Grouped by cylinders (cyl)
#' 
myplot5 <- ggplot(data = mpg) +
  geom_point(mapping = aes(x = mpg$displ, y = mpg$hwy)) +
  facet_grid(. ~ mpg$cyl)

#' Assign custom labels...
myplot5[["labels"]][["x"]] <- "Displacement"
myplot5[["labels"]][["y"]] <- "Fuel Consumption Highway (mpg)"

myplot5 + theme_linedraw()
myplot5 + theme_light()

#' (6) PLot 
#' 
myplot6 <- ggplot(data = mpg) +
  geom_point(mapping = aes(x = mpg$displ, y = mpg$hwy)) +
  geom_smooth(mapping = aes(x = mpg$displ,
                            y = mpg$hwy,
                            color = mpg$drv
                            )
              )

#' Assign custom labels... 
#' //TODO: refactor
myplot6[["labels"]][["x"]] <- "Displacement"
myplot6[["labels"]][["y"]] <- "Fuel Consumption Highway (mpg)"

myplot6 + theme_light()

