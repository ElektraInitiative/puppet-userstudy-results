
# box plots

# preparation

task1.duration_matrix <- cbind(task1.a$duration, task1.b$duration)
colnames(task1.duration_matrix) <- c('ERB', 'KDB')
rownames(task1.duration_matrix) <- task1.a$user

task2.1.duration_matrix <- cbind(task2.1.a$duration, task2.1.c$duration, task2.1.d$duration)
colnames(task2.1.duration_matrix) <- c('HOST', 'AUG', 'KDB')
rownames(task2.1.duration_matrix) <- task2.1.a$user

task2.2.duration_matrix <- cbind(task2.2.a$duration, task2.2.c$duration, task2.2.d$duration)
colnames(task2.2.duration_matrix) <- c('INI', 'AUG', 'KDB')
rownames(task2.2.duration_matrix) <- task2.2.a$user


task2.duration_matrix <- cbind(task2.a$duration, task2.c$duration, task2.d$duration)
colnames(task2.duration_matrix) <- c('H/I', 'AUG', 'KDB')
rownames(task2.duration_matrix) <- task2.a$user


task3.duration_matrix <- cbind(task3.2.a$duration, task3.2.b$duration)
colnames(task3.duration_matrix) <- c('ERB', 'KDB')
rownames(task3.duration_matrix) <- task3.2.a$user


pdf(file="graphics/task1_boxplot.pdf", width=10, height=2.5)
# las=2 rotate the lables
boxplot(task1.duration_matrix, xlab="duration (sec)", horizontal=T, las=1, boxwex=0.7)
dev.off()

pdf(file="graphics/task2_boxplot.pdf", width=10, height=6)
par(mfrow=c(3,1))
boxplot(task2.1.duration_matrix, xlab="duration (sec)", horizontal=T, main="Task 2.1", las=1, boxwex=0.7)
boxplot(task2.2.duration_matrix, xlab="duration (sec)", horizontal=T, main="Task 2.2", las=1, boxwex=0.7)

boxplot(task2.duration_matrix, xlab="duration (sec)", horizontal=T, main="Task 2.1 + 2.2", las=1, boxwex=0.7)
par(mfrow=c(1,1))
dev.off()

pdf(file="graphics/task3_boxplot.pdf", width=10, height=2.5)
boxplot(task3.duration_matrix, xlab="duration (sec)", horizontal=T, las=1, boxwex=0.7)
dev.off()


# task 3 with groups
task3.2.group_method_matrix <- cbind(task3.2.ga.a$duration, task3.2.ga.b$duration, task3.2.gb.a$duration, task3.2.gb.b$duration)
colnames(task3.2.group_method_matrix) <- c('Group A ERB', 'Group A KDB', 'Group B ERB', 'Group B KDB')

pdf(file="graphics/task3_boxplot_per_group.pdf", width=10, height=4)
par(mar=c(5,6.2,2,2))
boxplot(task3.2.group_method_matrix, xlab="duration (sec)", horizontal=T, las=1, boxwex=0.7)
dev.off()



# Usability ratings
#

ub_matrix <- cbind(ub.task1.a$rating, ub.task1.b$rating,
		   ub.task2.1.a$rating, ub.task2.1.c$rating, ub.task2.1.d$rating,
		   ub.task2.2.a$rating, ub.task2.2.c$rating, ub.task2.2.d$rating,
		   ub.task3.2.a$rating, ub.task3.2.b$rating)

ub.method_ERB <- c(ub_matrix[,1], ub_matrix[,9])
ub.method_KDB <- c(ub_matrix[,2], ub_matrix[,5], ub_matrix[,8], ub_matrix[,10])
ub.method_HOST <- ub.task2.1.a$rating
ub.method_AUG <- c(ub_matrix[,4], ub_matrix[,7])
ub.method_INI <- ub.task2.2.a$rating

ub_method_matrix <- cbind(ub.method_ERB,
			  ub.method_KDB,
			  ub.method_HOST,
			  ub.method_AUG,
			  ub.method_INI)
colnames(ub_method_matrix) <- c("ERB", "KDB", "HOST", "AUG", "INI")

colnames(ub_matrix) <- c("Task 1 ERB", "Task 1 KDB",
			 "Task 2.1 HOST", "Task 2.1 AUG", "Task 2.1 KDB",
			 "Task 2.2 INI", "Task 2.2 AUG", "Task 2.2 KDB",
			 "Task 3 ERB", "Task 3 KDB")

pdf(file="graphics/usability_boxplot.pdf", width=10, height=4)
par(mar=c(5,5,2,2))
#boxplot(ub_matrix, xlab="rating: 1 (good) ... 5 (bad)",
#       	horizontal=T, las=1, boxwex=0.7)

boxplot(ub_method_matrix, n=c(28,56,14,28,56,14,28,56,28,56),
	horizontal=T, las=1, boxwex=0.7,
	xlab="rating: 1 (very good) ... 5 (very bad)")
dev.off()

#pdf(file="graphics/usability_boxplot_sep.pdf", width=10, height=5)
#par(mar=c(5,7,2,2))
#par(mfrow=c(3,1))
#
#boxplot(ub.method_ERB, xlab="rating: 1 (good) ... 5 (bad)", horizontal=T, las=1,
#	boxwex=0.7, group=c("ERB"), 
#
#par(mfrow=c(1,1))
#dev.off()
