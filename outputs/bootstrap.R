## Graphical descriptions of MTO bootstrap analyses

library(rms)
library(lattice)

orci <- read.delim("orci.tab")

## 1. Subset to select just the integer imods 1..10,
##    thereby excluding the alt-specification outputs
orci <- subset(orci, imod %in% as.character(1:10) & voucher=='RA_GRP_EXP')

## 2. Convert mi_seed and pr_seed to *factors*, and imod back to integer!
orci <- upData(orci,
               pr_seed = factor(pr_seed),
               mi_seed = factor(mi_seed),
               imod = as.integer(as.character(imod)),
               jama = pr_seed==1234567 & mi_seed==524232 & imod==1)

## 2. Plot imod-bootstrapped OR, CI by pr_seed, mi_seed
p <- xYplot(Cbind(log_or, log_lowor, log_upor) ~ imod | mi_seed * pr_seed, group=jama,
            data=orci, layout=c(10,2), ylim=log(c(0.8,10)),
            ylab="Estimated Experimental Voucher Effect (OR [95% CI])",
            xlab="PTSD Imputation Model Resample No.",
            scales=list(
                y=list(
                    at=log(1:9),
                    labels=as.character(1:9)
                )
            ),
            par.strip.text=list(cex=0.6),
            panel=function(...){
                panel.refline(h=0.0)
                panel.xYplot(...)
            })

pdf("bootstrap.pdf")
print(p)
dev.off()

png("bootstrap.png", width=800, height=600)
print(p)
dev.off()
