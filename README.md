# Restaurant Food Items Segmentation using K-Means Clustering

A machine learning and data analytics project written in R that simulates restaurant menu data and applies unsupervised learning to segment food items based on their nutritional profiles, pricing strategies, and consumer reception.

## 📌 Project Overview
This repository demonstrates an end-to-end unsupervised machine learning workflow. By generating a synthetic dataset of 300 menu items across multiple food groups, the project standardizes multi-dimensional features, applies the K-Means algorithm, and interprets the resulting market segments through data visualizations.

## 👤 Author
* **Feroz**

## 🎯 Core Objectives
1. **Synthetic Data Generation:** Simulate a balanced restaurant dataset containing prices, caloric values, and user ratings across distinct food categories.
2. **Data Preprocessing:** Standardize and scale numerical features to prepare data for distance-based clustering algorithms.
3. **Optimal Cluster Selection:** Apply the Elbow Method to evaluate Within-Cluster Sum of Squares (WSS) and locate the ideal cluster count.
4. **Customer/Product Segmentation:** Run K-Means clustering to classify food items into distinct profiles.
5. **Data Visualization:** Generate insightful plots using `ggplot2` to inspect the relationship between clusters, price points, calories, and categories.

## 🛠️ Tech Stack & Libraries
* **Language:** R
* **Data Manipulation:** `dplyr`, `tidyr`
* **Data Visualization:** `ggplot2`
* **Machine Learning Framework:** Base R (`kmeans`)

## ⚙️ Analytical Pipeline
1. **Simulation:** Creating 300 rows of food items with attributes bounded by realistic restaurant constraints (Prices: \$5–\$30, Calories: 100–800, Ratings: 1–5).
2. **Encoding & Scaling:** Label-encoding menu categories and applying Z-score standardization (`scale()`) to balance feature variances.
3. **Elbow Method optimization:** Iterating K-Means from $k=1$ to $k=10$ to find the optimal bend in the variance curve.
4. **Segmentation Analysis:** Profiling menu items into 4 clear organizational segments.

## 📊 Expected Visualizations
* **Elbow Method Curve:** Line plot tracking WSS to validate the selection of 4 cluster groups.
* **Price vs. Calories Scatter Plot:** A multi-colored visualization illustrating how the algorithm partitions food entries across pricing and health metrics.
* **Average Rating Bar Chart:** A side-by-side comparison displaying customer evaluation metrics grouped by cluster segment.
* **Category Distribution Stacked Bars:** A percentage-based breakdown highlighting which types of food items dominate each cluster.
*
