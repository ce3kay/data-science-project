## Practice plotting with your dataset

ggplot(data = movie_data, aes(x = length, y = year)) +
  geom_point()

ggplot(data = movie_data, aes(x = studio, fill = Main_Genre)) +
  geom_bar() +
  labs(title = "Genre of Blockbusters by Studio",
       x = "Studio",
       y = "Number of Movies")

ggplot(data = movie_data, aes(x = imdb_rating, fill = studio)) + 
  geom_histogram(bins = 40) +
  labs(title = "Best Movies by Studio and Genre",
       x = "Rating",
       y = "Number of Movies")

## Practice subsetting data
# use a combination of
# filter, select, mutate, arrange, summarize, group_by, sample, and/or slice
# create a visualization using your new subject of data

View(movie_data)
names(movie_data)

# filter data based on one or more variable
filter(movie_data, studio %in% c("Pixar", "Walt Disney Pictures"))

# smaller dataset with a subset of variables
animated_movies <- filter(movie_data, Main_Genre == "Animation"
                          | Genre_2 == "Animation"
                          | Genre_3 == "Animation")
View(animated_movies)

# 2 new columns using mutate()
mutate(movie_data, mean_rating = mean(imdb_rating, na.rm = T))
mutate(movie_data, mean_length = mean(length, na.rm = T))

# data frame of grouped summaries with one numeric by one categorical
studio_rating <- summarize(group_by(movie_data, studio),
                            mean_studio_rating = mean(imdb_rating, na.rm = T))
arrange(studio_rating, desc(mean_studio_rating))
arrange(studio_rating)

# one new visualization using "animated_movies"
ggplot(data = animated_movies, aes(x = studio, fill = studio)) + 
  geom_bar() +
  labs(title="Top Grossing Animated Movies by Studio",
       x ="Studios", y = "Number of Movies", fill = "Studios") +
  theme(axis.text.x = element_text(angle = 70, color = "black"))





