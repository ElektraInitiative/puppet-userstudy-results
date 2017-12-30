
# read data
data <- read.csv("data/merged.csv", header=TRUE)

upper_timelimit = 4500
data$duration <- pmin(data$duration, upper_timelimit)

# filter task1 data
task1 <- data[which(data$task=="task1"),]
task2.1 <- data[which(data$task=="task2.1"),]
task2.2 <- data[which(data$task=="task2.2"),]
task2 <- data[which(data$task=="task2.1" | data$task=="task2.2"),]
task3.2 <- data[which(data$task=="task3.2"),]

task1$duration = pmin(task1$duration, upper_timelimit)
task2.1$duration = pmin(task2.1$duration, upper_timelimit)
task2.2$duration = pmin(task2.2$duration, upper_timelimit)
task2$duration = pmin(task2$duration, upper_timelimit)
task3.2$duration = pmin(task3.2$duration, upper_timelimit)

# filter task1 per method
task1.a <- task1[which(task1$method=="method_A"),]
task1.b <- task1[which(task1$method=="method_B"),]

task1.a.success <- task1.a[which(task1.a$success=="true"),]
task1.b.success <- task1.b[which(task1.b$success=="true"),]

task2.1.a <- task2.1[which(task2.1$method=="method_A"),]
task2.1.c <- task2.1[which(task2.1$method=="method_C"),]
task2.1.d <- task2.1[which(task2.1$method=="method_D"),]

task2.2.a <- task2.2[which(task2.2$method=="method_A"),]
task2.2.c <- task2.2[which(task2.2$method=="method_C"),]
task2.2.d <- task2.2[which(task2.2$method=="method_D"),]

task2.a <- task2[which(task2$method=="method_A"),]
task2.c <- task2[which(task2$method=="method_C"),]
task2.d <- task2[which(task2$method=="method_D"),]

task3.2.a <- task3.2[which(task3.2$method=="method_A"),]
task3.2.b <- task3.2[which(task3.2$method=="method_B"),]

task1.a.median <- median(task1.a[which(task1.a$success=="true"),]$duration)
task1.b.median <- median(task1.b[which(task1.b$success=="true"),]$duration)

task2.1.a.median <- median(task2.1.a[which(task2.1.a$success=="true"),]$duration)
task2.1.c.median <- median(task2.1.c[which(task2.1.c$success=="true"),]$duration)
task2.1.d.median <- median(task2.1.d[which(task2.1.d$success=="true"),]$duration)

task2.2.a.median <- median(task2.2.a[which(task2.2.a$success=="true"),]$duration)
task2.2.c.median <- median(task2.2.c[which(task2.2.c$success=="true"),]$duration)
task2.2.d.median <- median(task2.2.d[which(task2.2.d$success=="true"),]$duration)

task3.2.a.median <- median(task3.2.a[which(task3.2.a$success=="true"),]$duration)
task3.2.b.median <- median(task3.2.b[which(task3.2.b$success=="true"),]$duration)

task3.2.ga <- task3.2[which(task3.2$group == "g1" | task3.2$group == "g3"),]
task3.2.gb <- task3.2[which(task3.2$group == "g2" | task3.2$group == "g4"),]

task3.2.ga.a <- task3.2.ga[which(task3.2.ga$method=="method_A"),]
task3.2.ga.b <- task3.2.ga[which(task3.2.ga$method=="method_B"),]
task3.2.gb.a <- task3.2.gb[which(task3.2.gb$method=="method_A"),]
task3.2.gb.b <- task3.2.gb[which(task3.2.gb$method=="method_B"),]


# usability ratings

usability <- read.csv("data/usability.csv", header=TRUE)

ub.task1   <- usability[which(usability$task=="task1"),]
ub.task2.1 <- usability[which(usability$task=="task2.1"),]
ub.task2.2 <- usability[which(usability$task=="task2.2"),]
ub.task2   <- usability[which(usability$task=="task2.1" | data$task=="task2.2"),]
ub.task3.2 <- usability[which(usability$task=="task3"),]

ub.task1.a <- ub.task1[which(ub.task1$method=="methodA"),]
ub.task1.b <- ub.task1[which(ub.task1$method=="methodB"),]

ub.task2.1.a <- ub.task2.1[which(ub.task2.1$method=="methodA"),]
ub.task2.1.c <- ub.task2.1[which(ub.task2.1$method=="methodC"),]
ub.task2.1.d <- ub.task2.1[which(ub.task2.1$method=="methodD"),]

ub.task2.2.a <- ub.task2.2[which(ub.task2.2$method=="methodA"),]
ub.task2.2.c <- ub.task2.2[which(ub.task2.2$method=="methodC"),]
ub.task2.2.d <- ub.task2.2[which(ub.task2.2$method=="methodD"),]

ub.task2.a <- ub.task2[which(ub.task2$method=="methodA"),]
ub.task2.c <- ub.task2[which(ub.task2$method=="methodC"),]
ub.task2.d <- ub.task2[which(ub.task2$method=="methodD"),]

ub.task3.2.a <- ub.task3.2[which(ub.task3.2$method=="methodA"),]
ub.task3.2.b <- ub.task3.2[which(ub.task3.2$method=="methodB"),]

