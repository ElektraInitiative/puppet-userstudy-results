sep = ' & '

# sum of each task method
sums <- aggregate(duration ~ method + task, data, sum)
print("sums of all programming tasks")
print(sums)
print(paste(sums$duration, collapse=sep))

# max of each task method
maxs <- aggregate(duration ~ method + task, data, max)
print("maximum of all programming tasks")
# print(sums)
print(paste(maxs$duration, collapse=sep))

# min of each task method
mins <- aggregate(duration ~ method + task, data, min)
print("minimum of all programming tasks")
# print(sums)
print(paste(mins$duration, collapse=sep))

# mean of each task method
means <- aggregate(duration ~ method + task, data, mean)
print("arith. mean of all programming tasks")
# print(sums)
print(paste(round(means$duration, digits=2), collapse=sep))

# mean of each task method
medians <- aggregate(duration ~ method + task, data, median)
print("median of all programming tasks")
# print(sums)
print(paste(medians$duration, collapse=sep))

# std dev. of each task method
sds <- aggregate(duration ~ method + task, data, sd)
print("std. dev. of all programming tasks")
# print(sums)
print(paste(round(sds$duration, digits=2), collapse=sep))


# diff of sums
task1.sumdiff <- sum( task1.a$duration) - sum(task1.b$duration)
# diff of means
task1.meandiff <- mean(task1.a$duration) - mean(task1.b$duration)
# number of subjects solving b faster than a
task1.difflesszero <- sum((task1.a$duration - task1.b$duration) < 0)

cat ("Task1, Delta sums: ", task1.sumdiff, "\n")
cat ("Task1, Delta means: ", task1.meandiff, "\n")
cat ("Task1, Diff < 0: ", task1.difflesszero, "\n")

# Task2.1
cat ("Task2.1, Dsum A-C: ", sum(task2.1.a$duration)-sum(task2.1.c$duration), "\n")
cat ("Task2.1, Dsum A-D: ", sum(task2.1.a$duration)-sum(task2.1.d$duration), "\n")
cat ("Task2.1, Dsum C-D: ", sum(task2.1.c$duration)-sum(task2.1.d$duration), "\n")

cat ("Task2.1, Dmean A-C: ", mean(task2.1.a$duration)-mean(task2.1.c$duration), "\n")
cat ("Task2.1, Dmean A-D: ", mean(task2.1.a$duration)-mean(task2.1.d$duration), "\n")
cat ("Task2.1, Dmean C-D: ", mean(task2.1.c$duration)-mean(task2.1.d$duration), "\n")

cat ("Task2.1, Dsum<0 A-C: ", sum((task2.1.a$duration-task2.1.c$duration) < 0), "\n")
cat ("Task2.1, Dsum<0 A-D: ", sum((task2.1.a$duration-task2.1.d$duration) < 0), "\n")
cat ("Task2.1, Dsum<0 C-D: ", sum((task2.1.c$duration-task2.1.d$duration) < 0), "\n")

# Task2.2
cat ("Task2.2, Dsum A-C: ", sum(task2.2.a$duration)-sum(task2.2.c$duration), "\n")
cat ("Task2.2, Dsum A-D: ", sum(task2.2.a$duration)-sum(task2.2.d$duration), "\n")
cat ("Task2.2, Dsum C-D: ", sum(task2.2.c$duration)-sum(task2.2.d$duration), "\n")

cat ("Task2.2, Dmean A-C: ", mean(task2.2.a$duration)-mean(task2.2.c$duration), "\n")
cat ("Task2.2, Dmean A-D: ", mean(task2.2.a$duration)-mean(task2.2.d$duration), "\n")
cat ("Task2.2, Dmean C-D: ", mean(task2.2.c$duration)-mean(task2.2.d$duration), "\n")

cat ("Task2.2, Dsum<0 A-C: ", sum((task2.2.a$duration-task2.2.c$duration) < 0), "\n")
cat ("Task2.2, Dsum<0 A-D: ", sum((task2.2.a$duration-task2.2.d$duration) < 0), "\n")
cat ("Task2.2, Dsum<0 C-D: ", sum((task2.2.c$duration-task2.2.d$duration) < 0), "\n")

# Task3.2
cat ("Task3.2, Dsum A-C: ", sum(task3.2.a$duration)-sum(task3.2.b$duration), "\n")
cat ("Task3.2, Dmean A-C: ", mean(task3.2.a$duration)-mean(task3.2.b$duration), "\n")
cat ("Task3.2, Dsum<0 A-C: ", sum((task3.2.a$duration-task3.2.b$duration) < 0), "\n")

## # sum of all tasks
## sum    (task3.2.a$duration)
## # mean and median
## summary(task3.2.a$duration)
## # standard deviation
## sd     (task3.2.a$duration)
## 
## # sum of all tasks
## sum    (task3.2.b$duration)
## # mean and median
## summary(task3.2.b$duration)
## # standard deviation
## sd     (task3.2.b$duration)
## 
## # diff of sums
## sum( task3.2.a$duration) - sum(task3.2.b$duration)
## # diff of means
## mean(task3.2.a$duration) - mean(task3.2.b$duration)
## # number of subjects solving b faster than a
## sum((task3.2.a$duration - task3.2.b$duration) < 0)
