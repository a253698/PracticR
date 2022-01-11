**Introduction**
  
  ```r
---
  title: "Introduction to Data Frames"
output: html_notebook
---
  
  ```{r message=FALSE, warning=FALSE}
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
# select columns, filter and arrange rows of artists
artists_manipulated <- artists %>% 
  select(-country,-year_founded,-albums) %>% 
  filter(spotify_monthly_listeners > 20000000, genre != 'Hip Hop') %>% 
  arrange(desc(youtube_subscribers))
artists_manipulated
```
```

**What is a Data Frame?**
  
  ```r
---
  title: "Introduction to Data Frames in R"
output: html_notebook
---
  
  ```{r message=FALSE, warning=FALSE}
# load libraries
library(readr)
library(dplyr)
```

```{r}
# load data frame
songs <- read_csv('songs.csv')
```

```{r}
songs
```
```

**CSVs (comma-separated values)**
  
  ```r
name,cake_flavor,frosting_flavor,topping
Red Velvet Cake,chocolate,cream cheese,strawberries
Birthday Cake,vanilla,vanilla,rainbow sprinkles
Carrot Cake,carrot,cream cheese,almonds
```

**Loading and Saving CSVs**
  
  When you have data in a CSV, you can load it into a data frame in R using `readr`‘s `read_csv()` function:
  
  ```r
df <- read_csv('my_csv_file.csv')
```

- In the example above, the `read_csv()` function is called
- The CSV file `my_csv_file.csv` is passed in as an argument
- A data frame containing the data from `my_csv_file.csv` is returned

You can also save data from a data frame to a CSV using `readr`‘s `write_csv()` function:
  
  ```r
write_csv(df,'new_csv_file.csv')
```

In the example above, `write_csv()` takes two arguments:
  
  - `df`, which represents a data frame object
- `new_csv_file.csv`, the name of the CSV file that will hold the data from the data frame

By default, this method will save the CSV file to your current directory.

```r
---
  title: "Introduction to Data Frames in R"
output: html_notebook
---
  
  ```{r message=FALSE, warning=FALSE}
# load libraries
library(readr)
library(dplyr)
```

```{r}
# load data frame

artists <- read_csv('artists.csv')
```
```

**Inspecting Data Frames**
  
  When you load a new data frame from a CSV, you want to get an understanding of what the data looks like.

If the data frame is small, you can display it by typing its name `df`. If the data frame is larger, it can be helpful to inspect a few rows of the data frame without having to look at the rest of it.

The `head()` function returns the first 6 rows of a data frame. If you want to see more rows, you can pass an additional argument `n` to `head()`. For example, `head(df,8)` will show the first `8` rows.

The function `summary()` will return summary statistics such as mean, median, minimum and maximum for each numeric column while providing class and length information for non-numeric columns.

```r
---
  title: "Introduction to Data Frames in R"
output: html_notebook
---
  
  ```{r message=FALSE, warning=FALSE}
# load libraries
library(readr)
library(dplyr)
```

```{r message=FALSE}
# load data frame
artists <- read_csv('artists.csv')
```

```{r}
# inspect data frame
artists
head(artists)
summary(artists)

```
```

**Piping**
  
  One of the most appealing aspects of dplyr is the ability to easily manipulate data frames. Each of the dplyr functions you will explore takes a data frame as its first argument.

The *pipe operator*, or `%>%`, helps increase the readability of data frame code by piping the value on its left into the first argument of the function that follows it. For example:
  
  ```r
df %>%
  head()
```

pipes the data frame `df` into the first argument of `head()`, becoming

```r
head(df)
```

The true power of pipes comes from the ability to link multiple function calls together. Once you learn some of dplyr’s functions, we’ll revisit pipes and see how they are so useful!
  
  Note: the pipe operator is *not* a part of base R. It comes from the `magrittr` package, but do not worry about loading magrittr in your code. Any time you load a package from the tidyverse, like dplyr, `%>%` will automatically be loaded!
  
  [https://medium.com/rolandohsu/r的學習日常-2-pipeline-管線-824836e274ae](https://medium.com/rolandohsu/r%E7%9A%84%E5%AD%B8%E7%BF%92%E6%97%A5%E5%B8%B8-2-pipeline-%E7%AE%A1%E7%B7%9A-824836e274ae)

**Selecting Columns**
  
  ```r
---
  title: "Introduction to Data Frames in R"
output: html_notebook
---
  
  ```{r message=FALSE, warning=FALSE}
# load libraries
library(readr)
library(dplyr)
```

```{r message=FALSE}
# load data frame
artists <- read_csv('artists.csv')
```

```{r}
# select one column
artist_groups <- artists %>%
  select(group)

artist_groups
```

```{r}
# select multiple columns
group_info <- artists %>%
  select(group,spotify_monthly_listeners, year_founded)

group_info
```
```

**Excluding Columns**
  
  ```r
---
  title: "Introduction to Data Frames in R"
output: html_notebook
---
  
  ```{r message=FALSE, warning=FALSE}
# load libraries
library(readr)
library(dplyr)
```

```{r message=FALSE}
# load data frame
artists <- read_csv('artists.csv')
```

```{r}
# select all columns except one
no_albums <- artists %>%
  select(-albums)

no_albums
```

```{r}
# select all columns except a set
df_cols_removed <- artists %>%
  select(-genre, -spotify_monthly_listeners, -year_founded)

df_cols_removed
```
```

**Filtering Rows with Logic I**
  
  ```r
---
  title: "Introduction to Data Frames in R"
output: html_notebook
---
  
  ```{r message=FALSE, warning=FALSE}
# load libraries
library(readr)
library(dplyr)
```

```{r message=FALSE}
# load data frame
artists <- read_csv('artists.csv')
```

```{r}
# filter rows one condition

rock_groups <- artists %>%
  filter(genre == 'Rock')

rock_groups
```

```{r}
# filter rows multiple conditions
popular_rock_groups <- artists %>%
  filter(genre == 'Rock', spotify_monthly_listeners > 20000000)

popular_rock_groups
```
```

**Filtering Rows with Logic II**
  
  ```r
---
  title: "Introduction to Data Frames in R"
output: html_notebook
---
  
  ```{r message=FALSE, warning=FALSE}
# load libraries
library(readr)
library(dplyr)
```

```{r message=FALSE}
# load data frame
artists <- read_csv('artists.csv')
```

```{r}
# filter rows with or
korea_or_before_2000 <- artists %>%
  filter(country == 'South Korea' | year_founded < 2000)

korea_or_before_2000
```

```{r}
# filter rows with not !
not_rock_groups <- artists %>%
  filter(!(genre == 'Rock'))

not_rock_groups

```
```

**Arranging Rows**
  
  To arrange the customers in ascending order by name:
  
  ```
customers %>%
  arrange(name)

```

- the `customers` data frame is piped into `arrange()`
- the column to order by, `name`, is given as an argument
- a new data frame is returned with rows in ascending order by `name`

`arrange()` can also order rows by descending order! To arrange the customers in descending order by age:
  
  ```r
customers %>%
  arrange(desc(age))
```

- the `customers` data frame is again piped into `arrange()`
- the column to order by, `age`, is given as an argument to `desc()`, which is then given as an argument to `arrange()`
- a new data frame is returned with rows in descending order by `age`

If multiple arguments are provided to `arrange()`, it will order the rows by the column given as the first argument and use the additional columns to break ties in the values of preceding columns.

```r
---
  title: "Introduction to Data Frames in R"
output: html_notebook
---
  
  ```{r message=FALSE, warning=FALSE}
# load libraries
library(readr)
library(dplyr)
```

```{r message=FALSE}
# load data frame
artists <- read_csv('artists.csv')
```

```{r}
# arrange rows in ascending order
group_asc <- artists %>%
  arrange(group)

group_asc
```

```{r}
# arrange rows in descending order

youtube_desc <- artists %>%
  arrange(desc(youtube_subscribers))

youtube_desc
```
```

Review

There you have it! With the power of readr and dplyr in your hands, you can now:
  
  - load data from a CSV into a data frame
- inspect the data frame with `head()` and `summary()`
- `select()` the columns you want to analyze
- `filter()` the rows with comparison and logical operators
- `arrange()` rows in ascending or descending order

You’ve also been exposed to the pipe `%>%`, a powerful tool for chaining function calls, as well as the general principles of data manipulation.

Now that you are well on your way to being a dplyr master, let’s combine what you have learned together to perform an analysis and see the true power of the pipe!
  
  ```r
---
  title: "Introduction to Data Frames in R"
output: html_notebook
---
  
  ```{r message=FALSE, warning=FALSE}
# load libraries
library(readr)
library(dplyr)
```

```{r message=FALSE}
# load data frame
artists <- read_csv('artists.csv')
```

```{r}
# select columns
chosen_cols <- artists %>% 
  select(-country,-year_founded,-albums)
head(chosen_cols)
```

```{r}
# filter rows
popular_not_hip_hop <- chosen_cols %>% 
  filter(spotify_monthly_listeners > 20000000, genre != 'Hip Hop') 
head(popular_not_hip_hop)
```

```{r}
# arrange rows
youtube_desc <- popular_not_hip_hop %>% 
  arrange(desc(youtube_subscribers))
head(youtube_desc)
```

```{r}
# select columns, filter and arrange rows

artists <- artists %>%
  select(-country,-year_founded,-albums) %>%
  filter(spotify_monthly_listeners > 20000000, genre != 'Hip Hop') %>%
  arrange(desc(youtube_subscribers)) 

head(artists)

```
```