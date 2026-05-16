library(dplyr)
library(tidyr)
library(ggplot2)

set.seed(123)

#  Create artificial restaurant food items dataset
n <- 300
food_data <- data.frame(
  item_id = 1:n,
  category = sample(c("Appetizer", "Main Course", "Dessert", "Beverage"), n, replace = TRUE, prob = c(0.25, 0.4, 0.25, 0.1)),
  price = round(runif(n, 5, 30), 2),                # price in dollars
  calories = round(runif(n, 100, 800)),             # calories per serving
  rating = round(runif(n, 1, 5), 1)                 # customer rating out of 5
)

# Numeric encoding for category
food_data <- food_data %>%
  mutate(category_num = as.numeric(factor(category, levels = c("Appetizer", "Main Course", "Dessert", "Beverage"))))

# Select numerical features for clustering
food_features <- food_data %>%
  select(price, calories, rating, category_num)

# Scale the data
food_scaled <- scale(food_features)

# Determine optimal number of clusters (Elbow method)
wss <- sapply(1:10, function(k){
  kmeans(food_scaled, centers = k, nstart = 25)$tot.withinss
})
plot(1:10, wss, type = "b", main = "Elbow Method", xlab = "Number of Clusters", ylab = "WSS")


#  Clustering 
set.seed(123)
kmeans_food <- kmeans(food_scaled, centers = 4, nstart = 25)
food_data$segment <- as.factor(kmeans_food$cluster)

#  Visualizations

# Visualization 1: Price vs Calories colored by cluster
p1 <- ggplot(food_data, aes(x = price, y = calories, color = segment)) +
  geom_point(alpha = 0.7, size = 3) +
  labs(title = "Food Items Clusters: Price vs Calories",
       x = "Price ($)",
       y = "Calories",
       color = "Segment") +
  theme_minimal()

# Visualization 2: Average rating by category, colored by cluster
p2 <- food_data %>%
  group_by(category, segment) %>%
  summarise(avg_rating = mean(rating), count = n(), .groups = "drop") %>%
  ggplot(aes(x = category, y = avg_rating, fill = segment)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(title = "Average Rating by Food Category and Segment",
       x = "Category",
       y = "Average Rating",
       fill = "Segment") +
  theme_minimal()

# Visualization 3: Distribution of categories per cluster 
p3 <- food_data %>%
  count(segment, category) %>%
  group_by(segment) %>%
  mutate(freq = n / sum(n)) %>%
  ggplot(aes(x = segment, y = freq, fill = category)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(title = "Category Distribution per Cluster Segment",
       x = "Cluster Segment",
       y = "Percentage",
       fill = "Category") +
  theme_minimal()

# Print plots*-*
print(p1)
print(p2)
print(p3)
