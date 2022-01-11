**Calculations**
  
  ```r
---
  title: "Introduction to R Syntax"
output: html_notebook
---
  ```{r}
25 * 4 + 9 / 3
```
```

**Comments**
  
  ```r
---
  title: "Introduction to R Syntax"
output: html_notebook
---
  ```{r}
# 3 * 3 * 3

```
```

**Data Types**
  
  ```r
---
  title: "Introduction to R Syntax"
output: html_notebook
---
  ```{r}
print(23) #numeric
```
```

**Variables**
  
  ```r
---
  title: "Introduction to R Syntax"
output: html_notebook
---
  ```{r}
name <- "Mavis"
age <- numeric(23)
print(age)
```
```

**Vectors**
  
  ```r
---
  title: "Introduction to R Syntax"
output: html_notebook
---
  ```{r}
phone <- c(984,261,5565)

```
```

**Conditionals**
  
  ```r
```{r}
#message <- "I change based on a condition."

if(TRUE){
  message <- "I execute this when true!"
}else{
  message <- "I execute this when false!"
}

print(message);
```
```

**Comparison Operators**
  
  ```r
---
  title: "Introduction to R Syntax"
output: html_notebook
---
  ```{r}
56 >= 129

56 != 129
```
```

**Logical Operators**
  
  ```r
---
  title: "Introduction to R Syntax"
output: html_notebook
---
  ```{r}

message <- 'Should I pack an umbrella?'
weather <- 'cloudy'
high_chance_of_rain <- TRUE

if(weather == 'cloudy'){
  high_chance_of_rain = TRUE
  message <- "Pack umbrella!"
}else{
  message <- "No need for umbrella!"
}

```
```

**Calling a Function**
  
  ```r
sort(c(2,4,10,5,1)); # Outputs c(1,2,4,5,10)
length(c(2,4,10,5,1)); # Outputs 5
sum(5,15,10) #Outputs 30
```

- On the first line, the `sort()` function is called with a parameter of the vector `c(2,4,10,5,1)`. The result is a sorted vector `c(1,2,4,5,10)` with the values in ascending order.
- On the second line, we called a function we’ve seen before: `length()` and it returned the value 5 because there were five items in the vector.
- On the third line, we called a function `sum()` which added up all of the arguments we passed to it.

```r
---
  title: "Introduction to R Syntax"
output: html_notebook
---
  ```{r}
data <- c(120,22,22,31,15,120)
unique_vals <- unique(data)
print(unique_vals)

solution <- sqrt(49)

round_down <- floor(3.14)
round_up <- ceiling(3.14)

print(round_down)
print(round_up)

```
```

**Importing Packages**
  
  To import a package you simply:
  
  ```r
library(package-name)
```

```r
---
  title: "Introduction to R Syntax"
output: html_notebook
---
  ```{r}
# load libraries
library(readr)
library(dplyr)
```
```{r}
# load data frame
artists <- read_csv('artists.csv')
```
```{r}
# inspect data frame
artists
head(artists)
summary(artists)
```
```{r}
artists %>%
  select(-country,-year_founded,-albums) %>%
  filter(spotify_monthly_listeners > 20000000, genre != 'Hip Hop') %>%
  arrange(desc(youtube_subscribers))
```
```