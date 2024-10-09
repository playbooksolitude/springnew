#

#plotly

# Install and load plotly
#install.packages("plotly")
library(plotly)

# Basic scatter plot
data <- data.frame(x = rnorm(100), y = rnorm(100))
plot_ly(data, x = ~x, y = ~y, type = 'scatter', mode = 'markers')

# Install and load ggplot2 if not already installed
#install.packages("ggplot2")
library(ggplot2)

# Basic ggplot
p <- ggplot(data, aes(x = x, y = y)) + geom_point()
# Convert to interactive plot
ggplotly(p)


# Bar Chart ----
bar_data <- data.frame(category = c("A", "B", "C"), value = c(10, 20, 30))
plot_ly(bar_data, x = ~category, y = ~value, type = 'bar')

# Histogram
plot_ly(data, x = ~x, type = 'histogram')

# Box Plot
plot_ly(data, y = ~y, type = 'box')

# Heatmap
heatmap_data <- matrix(rnorm(100), nrow = 10)
plot_ly(z = ~heatmap_data, type = 'heatmap')

# 3D Surface Plot
z <- matrix(runif(100), nrow = 10)
plot_ly(z = ~z, type = 'surface')

# Multiple plots in one view
p1 <- plot_ly(data, x = ~x, y = ~y, type = 'scatter', mode = 'markers')
p2 <- plot_ly(bar_data, x = ~category, y = ~value, type = 'bar')
subplot(p1, p2)


# Customizing layout
plot_ly(data, x = ~x, y = ~y, type = 'scatter', mode = 'markers') %>%
  layout(title = "Customized Scatter Plot",
         xaxis = list(title = "X Axis Title"),
         yaxis = list(title = "Y Axis Title"))

#
# Animated scatter plot
anim_data <- data.frame(
  x = rnorm(100),
  y = rnorm(100),
  time = rep(1:10, each = 10))
plot_ly(anim_data, x = ~x, y = ~y, frame = ~time, type = 'scatter', mode = 'markers')

# Choropleth Map
map_data <- data.frame(
  location = c("USA", "CAN", "MEX"),
  value = c(100, 200, 150))
plot_ly(map_data, locations = ~location, z = ~value, type = 'choropleth')

#
# 3D Scatter Plot
plot_ly(data, x = ~x, y = ~y, z = ~rnorm(100), type = 'scatter3d', mode = 'markers')

# ----
# Install and load plotly
install.packages("plotly")
library(plotly)

# Creating a scatter plot with Zooming and Hover Information
data <- data.frame(x = rnorm(100), y = rnorm(100), label = paste("Point", 1:100))

# Scatter plot with hover information
plot <- plot_ly(
  data,
  x = ~x,
  y = ~y,
  type = 'scatter',
  mode = 'markers',
  text = ~label,   # Hover information,
  hoverinfo = 'text'  # Display only the text when hovering
)

# Display the plot (Zooming is enabled by default)
plot
