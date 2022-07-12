# Load in cs file ---------------------------------------------------------
movie_data <- read.csv("data/blockbusters.csv")
View(movie_data)

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

