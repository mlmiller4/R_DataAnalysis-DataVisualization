# Matthew L. Miller
# mmiller319

# 1. Professional Education by State
# box plot for state vs. percprof
ggplot(midwest, aes(state, percprof)) + geom_boxplot() + xlab("State") + ylab("% pop. w/ professional education")

# Bar chart showing combined mean of percprof by state:
midwest_percprof_ag <- aggregate(percprof ~ state, midwest, mean)
ggplot(midwest_percprof_ag, aes(x=state, y=percprof)) + geom_bar(stat="identity") + 
  coord_cartesian(ylim=c(4,5.1)) + xlab("State") + ylab("% pop. w/ professional education")


# 2. School and College Education by State
# Create midwest_edu data frame with needed columns:
mycols <- c("PID", "county", "state", "perchsd", "percollege")
midwest_edu <- midwest[mycols]

# Create box plots for state vs. perchsd:
ggplot(midwest_edu, aes(state, perchsd)) + geom_boxplot() + xlab("State") + ylab("% pop. w/ high school diploma")

# Create box plot for state vs. percollege:
ggplot(midwest_edu, aes(state, percollege)) + geom_boxplot() + xlab("State") + ylab("% pop. w/ college degree")

# Create scatter plot for perchsd vs. percollege:
qplot(perchsd, percollege, data=midwest_edu, main="Educational Attainment: High School vs. College",
      xlab="% pop. w/ high school diploma", ylab="% pop. w/ college degree") + 
  stat_smooth(method = "loess", method.args = list(degree=0), span = 0.2, se=FALSE, color="red", size=2)

# Create pair-wise plot for state, perchsd, percollege:
ggpairs(midwest_edu, columns = c("state", "perchsd", "percollege"))


# 4. Random Scatterplots
# Create scatterplots with N=10 to N=5000 at intervals of 500:
set1 <- runif(10)
set2 <- runif(10)
qplot(set1, set2)

set1 <- runif(500)
set2 <- runif(500)
qplot(set1, set2)

set1 <- runif(1000)
set2 <- runif(1000)
qplot(set1, set2)

set1 <- runif(1500)
set2 <- runif(1500)
qplot(set1, set2)

set1 <- runif(2000)
set2 <- runif(2000)
qplot(set1, set2)

set1 <- runif(2500)
set2 <- runif(2500)
qplot(set1, set2)

set1 <- runif(3000)
set2 <- runif(3000)
qplot(set1, set2)

set1 <- runif(3500)
set2 <- runif(3500)
qplot(set1, set2)

set1 <- runif(4000)
set2 <- runif(4000)
qplot(set1, set2)

set1 <- runif(4500)
set2 <- runif(4500)
qplot(set1, set2)

set1 <- runif(5000)
set2 <- runif(5000)
qplot(set1, set2)

# Create data frame with file sizes for saved scatter plots and melt based on "n":
n <- c(10, 500, 100, 1500, 2000, 2500, 3000, 3500, 4000, 4500, 5000)
pdf <- c(5, 34, 63, 92, 121, 150, 179, 207, 236, 265, 294)
jpg <- c(35, 122, 181, 219, 251, 273, 290, 305, 314, 320, 325)
png <- c(5, 9, 13, 16, 18, 20, 21, 22, 24, 24, 25)
eps <- c(9, 21, 34, 46, 58, 70, 82, 94, 106, 118, 130)
scatterplot_size <- data.frame(n, pdf, png, jpg, eps)
scatterplot_size_melt <- melt(scatterplot_size, id="n")

# Plot relationship between N and file sizes:
ggplot(scatterplot_size_melt, aes(x=n, y=value, color=variable)) + geom_line() + xlab("N") +
  ylab("Image Size in Kilobytes") + labs(color="File Format")


# 5. Diamonds
# Create histogram for color:
ggplot(diamonds, aes(x=color)) + geom_histogram(binwidth = 1, stat="count")

# Create histogram for carat:
ggplot(diamonds, aes(x=carat)) + geom_histogram(binwidth = 0.1)

# Create histogram for price:
ggplot(diamonds, aes(x=price)) + geom_histogram(binwidth = 10)

# Create pairwise plot for color, carat, price:
ggpairs(diamonds, columns = c("color", "carat", "price"))





