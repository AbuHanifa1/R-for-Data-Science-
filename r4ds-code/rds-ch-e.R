
library(tidyverse)
library(nycflights13)

# Chapter - 1

## Example Codes

# Using Mpg data set

mpg


#Simple scatterplot


ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))


# Scatterplot with respect to class presenting in different color


ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy, color = class))


#Scatterplot with respecct to class for different size

ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy, size = class))


# With respect to different alpha

# Top
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Bottom
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))


#Coloring all the point

ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")


# This is not same as before. It colored all the points but the previous one just color with respect to the class

## Excercises

# 1.  Colored is defined under the aesthetic function.
  

str(mpg)



ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy, color = cyl))


ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy, size = cyl))


ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy, alpha = cyl))


# This changes with respect to the magnitude of the cyl.



ggplot(data = mpg)+
  geom_point(mapping = aes(x = hwy, y = hwy, color = hwy))


# We get a straight line with respect to different color for different magnitude

  

ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy, stroke = cyl))


# It plots everything with respect to the size of the data point.


ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))


# It plots everything but colored the values for which the argument is false.

## Faceting

# Facet wrapping


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)


# Facet griding for two variable


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)


# Facet gridding without specifing any column


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)


## Exercise

1.  

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ cty, nrow = 2)


# It creates the plots for every values in the variable.

2.  

ggplot(data = mpg)+
  geom_point(mapping = aes(x = drv, y = cyl))+
  facet_grid(drv ~ cyl)



# The empty set is basically the cells contains the data points

3.  


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)


# First one facets the graph with respect to `drv` in a horizontal way. Others is the opposite and it facets the graph in the vertical way with corresponding to the values.

4.  



ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)


# First graph colors the point with respect to the class and the second one divide the graphs with respect to the class. For big data I would recomend using faceting.

## Geometric Objects


# left
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))
# right
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# right
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))



ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )



ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))



ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()



ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth()



ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(
    data = filter(mpg, class == "subcompact"),
    se = FALSE
  )


## Exercises

# This will create scattarplot and line with different class as a legend.


ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy, color = drv)
) +
  geom_point() +
  geom_smooth(se = FALSE)


# 3.  Does not show smooth lines legend as we said it to be false.


ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy, color = drv)
) +
  geom_point() +
  geom_smooth(se = FALSE, show.legend = F)


#4.  se argument creates confidence interval along the lines.

# 5.  They are the same two plots. First ones aesthetics are globally specified and the second is specified in locally.

# 6.  Skipped as I know how to do it.

## Statistical Transformation


ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds) +
  stat_count(mapping = aes(x = cut))


#They worked as same.

# For overriding the default count we can use stat identity to plot the y values the raw values. Example of this is given below.


demo <- tribble(
  ~a, ~b,
  "bar_1", 20,
  "bar_2", 30,
  "bar_3", 40
)

ggplot(data = demo) +
  geom_bar(
    mapping = aes(x = a, y = b), stat = "identity"
  )


# We can plot proportion instead of bar count or stat.

# Like this,


ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, y = after_stat(prop), group = 1)
  )


# or,


ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, y = ..prop.., group = 1)
  )


# To plot the summaries of the y values for unique x values we can use stat_summary,


ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )


# For avoid warning we can use


ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )


# ?stat_bin gives the description of the statistical work option.


ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = ..prop..))
#
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = color, y = ..prop..)
  )


# The difference is the later graph fills with color for different value in variable color in diamonds data set.

## Position adjustment


ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, color = cut))

#

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut))


## mapping the fill with respect to the another variable


ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))


## Exercise

1.  


ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point(position = "jitter")


# Should add jitter.

4.  


ggplot(data = mpg, mapping = aes(y = displ))+
  geom_boxplot()


# `coord_flip` switch the x and y axes.

# Flipping the axes for the bloxplot.


ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()

#

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot() +
  coord_flip()


# `coord_quickmap` sets the aspect ratio correctly for maps.


nz <- map_data("nz")

ggplot(data = nz, mapping = aes(x = long, y = lat, group = group))+
  geom_polygon(fill = "white", color = "black")



ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", color = "black") +
  coord_quickmap()


# `coord_ploar()` uses polar coordinates.


bar <- ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut, fill = cut),
           show.legend = F, width = 1)+
  theme(aspect.ratio = 1)+
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()


# Chapter - 3

# Loading the New York flight data.

# In the chapter everything seems to familiar for me so I skipped it.

## Exercise

1.  


# a

flights %>% 
  filter(arr_delay >= 2)

# b 

flights %>% 
  filter(dest == c("IAH", "HOU"))

# c

flights %>% 
  filter(carrier == c("UA", "AA", "DL"))

# d



# Using the `select()` command.


## Selecting using `contain()` argument.
flights %>% 
  filter(month %in% 7:9)

select(flights, contains("TIME"))

## Selecting using `oneof()` argument
vars <- c(
  "year", "month", "day", "dep_delay", "arr_delay"
)

select(flights, one_of(vars))



# We can create new variable using using `mutate()` and If we want to keep only the new variables we can use `transmutate()`

# Examples are given below:
  
  
flights_sml <- select(flights,
                      year:day,
                      ends_with("delay"),
                      distance,
                      air_time
)

# With mutate
mutate(flights_sml,
       gain = arr_delay - dep_delay,
       hours = air_time / 60,
       gain_per_hour = gain / hours
)

# With transmutate
transmute(flights,
          gain = arr_delay - dep_delay,
          hours = air_time / 60,
          gain_per_hour = gain / hours
)


## Exercises

2.  


comperison <- flights %>% 
  mutate(fly = arr_time - dep_time,
         com = fly - air_time) %>% 
  select(com)
comperison


## Group Summarise with `summarize()`


flights %>% 
  summarize(delay = mean(dep_delay, na.rm = T))


# Using `Leman` package for batting data summary.


batting <- as_tibble(Lahman::Batting)

batters <- batting %>% 
  group_by(playerID) %>% 
  summarise(ba = sum(H, na.rm = TRUE) / 
              sum(AB, na.rm = TRUE), 
            ab = sum(AB, na.rm = TRUE)) 

batters %>% 
  filter(ab > 100) %>% 
  ggplot(mapping = aes(x = ab, y = ba))+
  geom_point()+
  geom_smooth(se = F)





not_cancelled <- flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(
    # average delay:
    avg_delay1 = mean(arr_delay),
    # average positive delay:
    avg_delay2 = mean(arr_delay[arr_delay > 0])
  )

not_cancelled %>%
  group_by(dest) %>%
  summarize(distance_sd = sd(distance)) %>%
  arrange(desc(distance_sd))

not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(
    first = min(dep_time),
    last = max(dep_time)
  )

not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(
    first_dep = first(dep_time),
    last_dep = last(dep_time)
  )

not_cancelled %>%
  group_by(year, month, day) %>%
  mutate(r = min_rank(desc(dep_time))) %>%
  filter(r %in% range(r))

not_cancelled %>%
  count(tailnum, wt = distance)


not_cancelled %>% 
  group_by(year, month, day) %>%
  summarize(n_early = sum(dep_time < 500))




not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(hour_perc = mean(arr_delay > 60))

daily <- group_by(flights, year, month, day)
(per_day <- summarize(daily, flights = n()))

(per_month <- summarize(per_day, flights = sum(flights)))

(per_year <- summarize(per_month, flights = sum(flights)))


