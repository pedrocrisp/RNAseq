setwd("/home/pete/workspace/playground/DEseq/")

dge1_1 <- read.delim("1_1_accepted_hits.counts", header = FALSE)
dge1_2 <- read.delim("1_2_accepted_hits.counts", header = FALSE)
dge1_3 <- read.delim("1_3_accepted_hits.counts", header = FALSE)
dge2_1 <- read.delim("2_1_accepted_hits.counts", header = FALSE)
dge2_2 <- read.delim("2_2_accepted_hits.counts", header = FALSE)
dge2_3 <- read.delim("2_3_accepted_hits.counts", header = FALSE)

dge <- data.frame(dge1_1$V1,dge1_1$V2,dge1_2$V2,dge1_3$V2,dge2_1$V2,dge2_2$V2,dge2_3$V2)

names(dge) <- c("AGI", "LL_1", "LL_2", "LL_3", "HL30_1", "HL30_2", "HL30_3")

conditions <- factor(c("Control", "Control","Control", "HL30", "HL30", "HL30"))
agis <- dge[,1]
dge<-dge[,2:7]
row.names(dge) <- agis

source("http://bioconductor.org/biocLite.R")
biocLite("DESeq")
library("DESeq")

cds <- newCountDataSet(dge,conditions)

cds_s1 <- estimateSizeFactors(cds)
cds <- estimateDispersions(cds_s1)
res <- nbinomTest(cds, "Control", "HL30")
write.csv(res,"deseq_all.csv")
###filtering and graphing

sig <- res[which(res$padj < 0.05),]
sig$countChange <- abs(sig$baseMeanA-sig$baseMeanB)
write.csv(sig,"deseq.csv")

hist(log(sig$countChange))
res$countChange <- abs(res$baseMeanA-res$baseMeanB)
plot(log(res$baseMean), log(res$countChange),pch=".")
plot(log(sig$baseMean), log(sig$countChange),pch=".")
dev.new()