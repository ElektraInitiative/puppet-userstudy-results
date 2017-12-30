

library(coin)

# Tests:
# test for normal distribution: https://de.wikibooks.org/wiki/GNU_R:_shapiro.test
# p < 0.05 => keine Normalverteilung
# the differences should be normal-distributed!
task1.diffs <-task1.a$duration - task1.b$duration
shapiro.test(task1.diffs)

ks.test(task1.diffs, "pnorm", mean=mean(task1.diffs), sd=sd(task1.diffs)) 

# paired t-test, due to intra-subject testing
# precondition: normal distribution and similar variances
# https://www.r-bloggers.com/paired-students-t-test/, if p < 0.5 H0 verwerfen, averages are NOT equal
t.test(task1.a$duration, task1.b$duration, paired=T)

# alternative, if not normal distributed: Wilcoxon-Mann-Whitney Test
# p < 0.5: H0 verwerfen => signifikanter Unterschied
wilcox_test(duration~method, data=task1)


# test for normal distribution: https://de.wikibooks.org/wiki/GNU_R:_shapiro.test
# p < 0.05 => keine Normalverteilung
shapiro.test(task3.2.a$duration - task3.2.b$duration)

# paired t-test, due to intra-subject testing
# precondition: normal distribution and similar variances
# https://www.r-bloggers.com/paired-students-t-test/, if p < 0.5 H0 verwerfen, averages are NOT equal
t.test(task3.2.a$duration, task3.2.b$duration, paired=T)

# alternative, if not normal distributed: Wilcoxon-Mann-Whitney Test
# p < 0.5: H0 verwerfen => signifikanter Unterschied
wilcox_test(duration~method, data=task3.2)




# test for normal distribution: https://de.wikibooks.org/wiki/GNU_R:_shapiro.test
# p < 0.05 => keine Normalverteilung
shapiro.test(task2.1.a$duration - task2.1.c$duration)
shapiro.test(task2.1.a$duration - task2.1.d$duration)
shapiro.test(task2.1.c$duration - task2.1.d$duration)

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
shapiro.test(task2.2.a$duration - task2.2.c$duration)
shapiro.test(task2.2.a$duration - task2.2.d$duration)
shapiro.test(task2.2.c$duration - task2.2.d$duration)

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
