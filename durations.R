
colors <- c("steelblue3", "springgreen2", "yellow1", "tomato1", "darkorange")


source("read_prepare_data.R")

# just output on console
task1.a.median
task1.b.median
task2.1.a.median
task2.1.c.median
task2.1.d.median
task2.2.a.median
task2.2.c.median
task2.2.d.median
task3.2.a.median
task3.2.b.median
# build a matrix of the data we want to plot
task1.matrix <- cbind(task1.a$duration, task1.a$duration_fs, task1.b$duration, task1.b$duration_fs)
colnames(task1.matrix) <- c("file + ERB", "file + ERB (fs)", "Elektra", "Elektra (fs)")
rownames(task1.matrix) <- task1.a$user

# transpo matrix -> barplot requires the data in colums, we have it in rows
t(task1.matrix)

# do the plot
#barplot(t(task1.matrix), beside=T,
#	ylab="duration sec.", col=colors,
#	ylim=c(0,2800), las=0,
#	cex.names=0.8,
#	legend.text=rownames(t(task1.matrix))
#)


task1.script_runs <- cbind(task1.a$test_runs, task1.a$puppet_runs,
                           task1.b$test_runs, task1.b$puppet_runs
			  )
colnames(task1.script_runs) <- c("file + ERB run_test", "file + ERB run_puppet",
				 "Elektra run_test", "Elektra run_puppet")
rownames(task1.script_runs) <- task1.a$user

#barplot(t(task1.script_runs), beside=T,
#	ylab="script runs", col=colors,
#	las=0,
#	cex.names=0.8,
#	legend.text=rownames(t(task1.script_runs)),
#	args.legend=list(x="topleft", bty="n")
#)

# usability ratings

usability.task1.a.median <- median(ub.task1[which(ub.task1$method == "methodA" & ub.task1$rating > 0),]$rating)
usability.task1.b.median <- median(ub.task1[which(ub.task1$method == "methodB" & ub.task1$rating > 0),]$rating)

usability.task2.1.a.median <- median(ub.task2.1[which(ub.task2.1$method == "methodA" & ub.task2.1$rating > 0),]$rating)
usability.task2.1.c.median <- median(ub.task2.1[which(ub.task2.1$method == "methodC" & ub.task2.1$rating > 0),]$rating)
usability.task2.1.d.median <- median(ub.task2.1[which(ub.task2.1$method == "methodD" & ub.task2.1$rating > 0),]$rating)

usability.task2.2.a.median <- median(ub.task2.2[which(ub.task2.2$method == "methodA" & ub.task2.2$rating > 0),]$rating)
usability.task2.2.c.median <- median(ub.task2.2[which(ub.task2.2$method == "methodC" & ub.task2.2$rating > 0),]$rating)
usability.task2.2.d.median <- median(ub.task2.2[which(ub.task2.2$method == "methodD" & ub.task2.2$rating > 0),]$rating)

usability.task3.2.a.median <- median(ub.task3.2[which(ub.task3.2$method == "methodA" & ub.task3.2$rating > 0),]$rating)
usability.task3.2.b.median <- median(ub.task3.2[which(ub.task3.2$method == "methodB" & ub.task3.2$rating > 0),]$rating)

usability.task1.a.median
usability.task1.b.median

usability.task2.1.a.median
usability.task2.1.c.median
usability.task2.1.d.median

usability.task2.2.a.median
usability.task2.2.c.median
usability.task2.2.d.median

usability.task3.2.a.median
usability.task3.2.b.median

# Solution with lattice barchart
require(lattice)

pdf(file="graphics/task_durations.pdf", 
    #paper="a4", 
	width=14,
    title="Task durations")

#par(mfrow=c(5,1))

c1 <- barchart(duration ~ user, data=task1,
	       groups=factor(method, labels=c("file+ERB","kdb")),
	       auto.key=list(columns=2),
	       main="Task1 (JSON app) duration (sec)",
	       ylim=c(0,4500),
	       #ylab="duration (sec)",
	       panel = function(...) {
		       panel.lines(c(0,11), c(task1.a.median, task1.a.median), col="gray", lwd=1)
		       panel.text(lab="Med A",x = 0.50, y = task1.a.median + 10, adj=c(0.4, 0), cex=0.4)
		       panel.lines(c(0,11), c(task1.b.median, task1.b.median), col="gray", lwd=1)
		       panel.text(lab="Med B",x = 0.50, y = task1.b.median + 10, adj=c(0.4, 0), cex=0.4)
		       panel.barchart(...)
	       }
)
c2.1 <- barchart(duration ~ user,
		 data=task2.1,
		 groups=factor(method, labels=c("hosts", "augeas", "kdb")),
		 auto.key=list(columns=2),
		 main="Task2.1 (hosts file) duration (sec)",
		 ylim=c(0,4500),
		 #ylab="duration (sec)",
	       panel = function(...) {
		       panel.lines(c(0,11), c(task2.1.a.median, task2.1.a.median), col="gray", lwd=1)
		       panel.text(lab="Med A",x = 0.50, y = task2.1.a.median + 10, adj=c(0.4, 0), cex=0.4)
		       panel.lines(c(0,11), c(task2.1.c.median, task2.1.c.median), col="gray", lwd=1)
		       panel.text(lab="Med C",x = 0.50, y = task2.1.c.median + 10, adj=c(0.4, 0), cex=0.4)
		       panel.lines(c(0,11), c(task2.1.d.median, task2.1.d.median), col="gray", lwd=1)
		       panel.text(lab="Med D",x = 0.50, y = task2.1.d.median + 10, adj=c(0.4, 0), cex=0.4)
		       panel.barchart(...)
	       }
)
c2.2 <- barchart(duration ~ user,
		 data=task2.2,
		 groups=factor(method, labels=c("ini_setting", "augeas", "kdb")),
		 auto.key=list(columns=2),
		 main="Task2.2 (Samba) duration (sec)",
		 ylim=c(0,4500),
		 #ylab="duration (sec)",
	       panel = function(...) {
		       panel.lines(c(0,11), c(task2.2.a.median, task2.2.a.median), col="gray", lwd=1)
		       panel.text(lab="Med A",x = 0.50, y = task2.2.a.median + 10, adj=c(0.4, 0), cex=0.4)
		       panel.lines(c(0,11), c(task2.2.c.median, task2.2.c.median), col="gray", lwd=1)
		       panel.text(lab="Med C",x = 0.50, y = task2.2.c.median + 10, adj=c(0.4, 0), cex=0.4)
		       panel.lines(c(0,11), c(task2.2.d.median, task2.2.d.median), col="gray", lwd=1)
		       panel.text(lab="Med D",x = 0.50, y = task2.2.d.median + 10, adj=c(0.4, 0), cex=0.4)
		       panel.barchart(...)
	       }
)
c3.2 <- barchart(duration ~ user,
		 data=task3.2,
		 groups=factor(method, labels=c("file+ERB", "kdb")),
		 auto.key=list(columns=2),
		 main="Task3.2 (extend rubyhttp) duration (sec)",
	         ylim=c(0,4500),
		 #ylab="duration (sec)",
	       panel = function(...) {
		       panel.lines(c(0,11), c(task3.2.a.median, task3.2.a.median), col="gray", lwd=1)
		       panel.text(lab="Med A",x = 0.50, y = task3.2.a.median + 10, adj=c(0.4, 0), cex=0.4)
		       panel.lines(c(0,11), c(task3.2.b.median, task3.2.b.median), col="gray", lwd=1)
		       panel.text(lab="Med B",x = 0.50, y = task3.2.b.median + 10, adj=c(0.4, 0), cex=0.4)
		       panel.barchart(...)
	       }
)

print(c1,   split=c(1,1,1,2), more=T)
print(c3.2, split=c(1,2,1,2), more=F)
print(c2.1, split=c(1,1,1,2), more=T)
print(c2.2, split=c(1,2,1,2), more=F)

u1 <- barchart(rating ~ user, data=ub.task1,
	       groups=factor(method, labels=c("file+ERB", "kdb")),
	       auto.key=list(columns=2, title="A: file + ERB, B: Elektra"),
	       main="Task1 (INI and JSON app) usability rating",
	       ylab="rating (lower is better)",
	       ylim=c(0,5),
	       panel = function(...) {
		       panel.lines(c(0,7), c(usability.task1.a.median, usability.task1.a.median), col="gray", lwd=1)
		       panel.text(lab="Med A",x = 0.45, y = usability.task1.a.median + 0.01, adj=c(0.4, 0), cex=0.4)
		       panel.lines(c(0,7), c(usability.task1.b.median, usability.task1.b.median), col="gray", lwd=1)
		       panel.text(lab="Med B",x = 4.45, y = usability.task1.b.median + 0.01, adj=c(0.4, 0), cex=0.4)
		       panel.barchart(...)
	       }

)
u2.1 <- barchart(rating ~ user, data=ub.task2.1,
	       groups=factor(method, labels=c("hosts", "augeas", "kdb")),
	       auto.key=list(columns=2, title="A: host, B: file_line, C: augeas, D: Elektra"),
	       main="Task2.1 (hosts file) usability rating",
	       ylab="rating (lower is better)",
	       ylim=c(0,5),
	       panel = function(...) {
		       panel.lines(c(0,7), c(usability.task2.1.a.median, usability.task2.1.a.median), col="gray", lwd=1)
		       panel.text(lab="Med A",x = 0.45, y = usability.task2.1.a.median + 0.01, adj=c(0.4, 0), cex=0.4)
		       panel.lines(c(0,7), c(usability.task2.1.c.median, usability.task2.1.c.median), col="gray", lwd=1)
		       panel.text(lab="Med C",x = 4.45, y = usability.task2.1.c.median - 0.31, adj=c(0.4, 0), cex=0.4)
		       panel.lines(c(0,7), c(usability.task2.1.d.median, usability.task2.1.d.median), col="gray", lwd=1)
		       panel.text(lab="Med D",x = 4.45, y = usability.task2.1.d.median + 0.01, adj=c(0.4, 0), cex=0.4)
		       panel.barchart(...)
	       }

)
u2.2 <- barchart(rating ~ user, data=ub.task2.2,
	       groups=factor(method, labels=c("ini_setting", "augeas", "kdb")),
	       auto.key=list(columns=2, title="A: ini_setting, C: augeas, D: Elektra"),
	       main="Task2.2 (Samba config) usability rating",
	       ylab="rating (lower is better)",
	       ylim=c(0,5),
	       panel = function(...) {
		       panel.lines(c(0,7), c(usability.task2.2.a.median, usability.task2.2.a.median), col="gray", lwd=1)
		       panel.text(lab="Med A",x = 0.45, y = usability.task2.2.a.median + 0.01, adj=c(0.4, 0), cex=0.4)
		       panel.lines(c(0,7), c(usability.task2.2.c.median, usability.task2.2.c.median), col="gray", lwd=1)
		       panel.text(lab="Med C",x = 4.45, y = usability.task2.2.c.median + 0.01, adj=c(0.4, 0), cex=0.4)
		       panel.lines(c(0,7), c(usability.task2.2.d.median, usability.task2.2.d.median), col="gray", lwd=1)
		       panel.text(lab="Med D",x = 4.45, y = usability.task2.2.d.median + 0.01, adj=c(0.4, 0), cex=0.4)
		       panel.barchart(...)
	       }

)
u3.2 <- barchart(rating ~ user, data=ub.task3.2,
	       groups=factor(method, labels=c("file+ERB", "kdb")),
	       auto.key=list(columns=2, title="A: file + ERB, B: Elektra"),
	       main="Task3.2 (extend rubyhttp) usability rating",
	       ylab="rating (lower is better)",
	       ylim=c(0,5),
	       panel = function(...) {
		       panel.lines(c(0,7), c(usability.task3.2.a.median, usability.task3.2.a.median), col="gray", lwd=1)
		       panel.text(lab="Med A",x = 0.45, y = usability.task3.2.a.median + 0.01, adj=c(0.4, 0), cex=0.4)
		       panel.lines(c(0,7), c(usability.task3.2.b.median, usability.task3.2.b.median), col="gray", lwd=1)
		       panel.text(lab="Med B",x = 4.45, y = usability.task3.2.b.median + 0.01, adj=c(0.4, 0), cex=0.4)
		       panel.barchart(...)
	       }

)

print(u1,   split=c(1,1,1,2), more=T)
print(u3.2, split=c(1,2,1,2), more=F)
print(u2.1, split=c(1,1,1,2), more=T)
print(u2.2, split=c(1,2,1,2), more=F)


dev.off()


# box plots
task1.duration_matrix <- cbind(task1.a$duration, task1.b$duration)
colnames(task1.duration_matrix) <- c('file+ERB', 'kdb')
rownames(task1.duration_matrix) <- task1.a$user

task2.1.duration_matrix <- cbind(task2.1.a$duration, task2.1.c$duration, task2.1.d$duration)
colnames(task2.1.duration_matrix) <- c('host', 'augeas', 'kdb')
rownames(task2.1.duration_matrix) <- task2.1.a$user

task2.2.duration_matrix <- cbind(task2.2.a$duration, task2.2.c$duration, task2.2.d$duration)
colnames(task2.2.duration_matrix) <- c('ini_setting', 'augeas', 'kdb')
rownames(task2.2.duration_matrix) <- task2.2.a$user

task3.duration_matrix <- cbind(task3.2.a$duration, task3.2.b$duration)
colnames(task3.duration_matrix) <- c('file+ERB', 'kdb')
rownames(task3.duration_matrix) <- task3.2.a$user

pdf(file="graphics/boxplots.pdf")

par(mfrow=c(2,2))
boxplot(task1.duration_matrix, ylab="duration (sec)", main="task 1 (merged)")
boxplot(task3.duration_matrix, ylab="duration (sec)", main="task 3")
boxplot(task2.1.duration_matrix, ylab="duration (sec)", main="task 2.1")
boxplot(task2.2.duration_matrix, ylab="duration (sec)", main="task 2.2")
par(mfrow=c(1,1))
dev.off()



pdf(file="graphics/task1_durations.pdf", height=4)
print(c1)
dev.off()

pdf(file="graphics/task2.1_durations.pdf", height=4)
print(c2.1)
dev.off()

pdf(file="graphics/task2.2_durations.pdf", height=4)
print(c2.2)
dev.off()

pdf(file="graphics/task3_durations.pdf", height=4)
print(c3.2)
dev.off()

pdf(file="graphics/task1_3_durations.pdf", height=9, width=10)
print(c1,   split=c(1,1,1,2), more=T)
print(c3.2, split=c(1,2,1,2), more=F)
dev.off()


pdf(file="graphics/task2_x_durations.pdf", height=9, width=10)
print(c2.1, split=c(1,1,1,2), more=T)
print(c2.2, split=c(1,2,1,2), more=F)
dev.off()

sum(task1.a$duration)
sum(task1.b$duration)

task2.1.a_sum = sum(task2.1.a$duration)
task2.1.a_sum
task2.1.c_sum = sum(task2.1.c$duration)
task2.1.c_sum
task2.1.d_sum = sum(task2.1.d$duration)
task2.1.d_sum


task2.1.c_sum / task2.1.d_sum

task2.2.a_sum = sum(task2.2.a$duration)
task2.2.a_sum
task2.2.c_sum = sum(task2.2.c$duration)
task2.2.c_sum
task2.2.d_sum = sum(task2.2.d$duration)
task2.2.d_sum

task2.2.c_sum / task2.2.d_sum

sum(task3.2.a$duration)
sum(task3.2.b$duration)

library(coin)

# Tests:
# test for normal distribution: https://de.wikibooks.org/wiki/GNU_R:_shapiro.test
# p < 0.05 => keine Normalverteilung

shapiro.test(task1.a$duration)
shapiro.test(task1.b$duration)

# paired t-test, due to intra-subject testing
# precondition: normal distribution and similar variances
# https://www.r-bloggers.com/paired-students-t-test/, if p < 0.5 H0 verwerfen, averages are NOT equal
t.test(task1.a$duration, task1.b$duration, paired=T)

# alternative, if not normal distributed: Wilcoxon-Mann-Whitney Test
# p < 0.5: H0 verwerfen => signifikanter Unterschied
wilcox_test(duration~method, data=task1)


# test for normal distribution: https://de.wikibooks.org/wiki/GNU_R:_shapiro.test
# p < 0.05 => keine Normalverteilung
shapiro.test(task3.2.a$duration)
shapiro.test(task3.2.b$duration)

# paired t-test, due to intra-subject testing
# precondition: normal distribution and similar variances
# https://www.r-bloggers.com/paired-students-t-test/, if p < 0.5 H0 verwerfen, averages are NOT equal
t.test(task3.2.a$duration, task3.2.b$duration, paired=T)

# alternative, if not normal distributed: Wilcoxon-Mann-Whitney Test
# p < 0.5: H0 verwerfen => signifikanter Unterschied
wilcox_test(duration~method, data=task3.2)




# test for normal distribution: https://de.wikibooks.org/wiki/GNU_R:_shapiro.test
# p < 0.05 => keine Normalverteilung
shapiro.test(task2.1.a$duration)
shapiro.test(task2.1.c$duration)
shapiro.test(task2.1.d$duration)

# paired t-test, due to intra-subject testing
# precondition: normal distribution and similar variances
# https://www.r-bloggers.com/paired-students-t-test/, if p < 0.5 H0 verwerfen, averages are NOT equal
t.test(task2.1.a$duration, task2.1.c$duration, paired=T)
t.test(task2.1.a$duration, task2.1.d$duration, paired=T)
t.test(task2.1.c$duration, task2.1.d$duration, paired=T)

# alternative, if not normal distributed: Wilcoxon-Mann-Whitney Test
# p < 0.5: H0 verwerfen => signifikanter Unterschied
wilcox_test(duration~method, data=task2.1[which(task2.1$method!="method_D"),])
wilcox_test(duration~method, data=task2.1[which(task2.1$method!="method_C"),])
wilcox_test(duration~method, data=task2.1[which(task2.1$method!="method_A"),])



# test for normal distribution: https://de.wikibooks.org/wiki/GNU_R:_shapiro.test
# p < 0.05 => keine Normalverteilung
shapiro.test(task2.2.a$duration)
shapiro.test(task2.2.c$duration)
shapiro.test(task2.2.d$duration)

# paired t-test, due to intra-subject testing
# precondition: normal distribution and similar variances
# https://www.r-bloggers.com/paired-students-t-test/, if p < 0.5 H0 verwerfen, averages are NOT equal
t.test(task2.2.a$duration, task2.2.c$duration, paired=T)
t.test(task2.2.a$duration, task2.2.d$duration, paired=T)
t.test(task2.2.c$duration, task2.2.d$duration, paired=T)

# alternative, if not normal distributed: Wilcoxon-Mann-Whitney Test
# p < 0.5: H0 verwerfen => signifikanter Unterschied
wilcox_test(duration~method, data=task2.2[which(task2.2$method!="method_D"),])
wilcox_test(duration~method, data=task2.2[which(task2.2$method!="method_C"),])
wilcox_test(duration~method, data=task2.2[which(task2.2$method!="method_A"),])

# some statistics

# varianz analyse zwischen verschiedenen Stichproben
# taken from https://www.beratung-statistik.de/statistik-beratung-infos/r-tutorial/r-varianzanalyse-post-hoc/
summary(aov(task2.1$duration~task2.1$method))
# -> zwischen den Gruppen gibt es signifikante unterschiede
# aber zwischen welchen gruppen ???
# -> dh. Post Hoc Test (Tukey HSD) zum direkten Vergleich der Stichproben (tasks methods)
TukeyHSD(aov(task2.1$duration~task2.1$method))
# -> p <= 0.05 dh. zw A und C, zw C und D aber nicht zwischen A und D ist der
# Unterschied signifikant
# Konfidenzniveau alpha = 0.05

# Task 2.2
summary(aov(task2.2$duration~task2.2$method))
TukeyHSD(aov(task2.2$duration~task2.2$method))

# Task 1
summary(aov(task1$duration~task1$method))
TukeyHSD(aov(task1$duration~task1$method))

var.test(task1.a$duration, task1.b$duration)


# so, wenn wir nun auch davon ausgehen, dass alle Grundgesamtheiten normal
# verteilt sind und auch gleiche varianz haben, koennen wir den t-test
# anwenden, um 2 unabhaengige Stichproben miteinander zu vergleichen
# (sind diese unabhaengig oder muss der reihenfolgeeffekt beruecksichtigt
# werden?)
t.test(task2.1.c$duration, task2.1.d$duration, var.equal=TRUE, paried=FALSE)
t.test(task2.1.c$duration, task2.1.d$duration, var.equal=F, paried=FALSE)


t.test(task2.2.c$duration, task2.2.d$duration, var.equal=TRUE, paried=FALSE)


# varianz test?
var.test(task2.1.d$duration, task2.1.c$duration)
var.test(task2.2.c$duration, task2.2.d$duration)


