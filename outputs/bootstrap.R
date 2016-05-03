## Graphical descriptions of MTO bootstrap analyses

library(rms)
library(lattice)

orci <- read.delim("orci.tab")

## 1. Convert mi_seed and pr_seed to *factors*
orci <- upData(orci
             , pr_seed = factor(pr_seed)
             , mi_seed = factor(mi_seed)
               )

## 2. Subset to select just the integer imods 1..10 into 'orci',
##    and the alt-specification results into 'alt.orci'
orci <- subset(orci, imod %in% as.character(1:10) & voucher=='RA_GRP_EXP')

## 2. Convert imod back to integer in 'orci', and introduce
##    suitable 'JAMA repro' indicators in each subset:
orci <- upData(orci
             , imod = as.integer(as.character(imod))
             , jama = pr_seed==1234567 & mi_seed==524232 & imod==1
               )

## 2. Plot imod-bootstrapped OR, CI by pr_seed, mi_seed
p <- xYplot(Cbind(log_or, log_lowor, log_upor) ~ imod | mi_seed * pr_seed, group=jama,
            data=orci, layout=c(10,5), aspect=0.8, ylim=log(c(0.8,10)),
            ylab="Estimated Experimental Voucher Effect (OR [95% CI])",
            xlab="PTSD Imputation Model Resample No.",
            scales=list(
                x=list(
                    cex=0.7,
                    at=c(1,3,5,7,9)
                ),
                y=list(
                    cex=0.7,
                    at=log(1:9),
                    labels=c("1","2","","4","","","","8","")
                )
            ),
            par.strip.text=list(cex=0.5),
            panel=function(...){
                panel.refline(h=0.0)
                panel.xYplot(...)
            })

pdf("bootstrap.pdf")
print(p)
dev.off()

alt.orci <- read.delim("alt_orci.tab")
alt.orci <- subset(alt.orci, voucher=='RA_GRP_EXP')
alt.orci <- upData(alt.orci
                 , pr_seed = factor(pr_seed)
                 , mi_seed = factor(mi_seed)
                 , jama = (pr_seed==1234567 & mi_seed==524232 & imod=='A1R1S99')
                   )

q <- dotplot(Cbind(log_or, log_lowor, log_upor) ~ imod | mi_seed * pr_seed, group=jama,
             data=alt.orci,
             layout=c(10,5),
             aspect=0.8,
             ylim=log(c(0.8,10)),
             ylab="Estimated Experimental Voucher Effect (OR [95% CI])",
             xlab="PTSD Imputation Model Specification",
             scales=list(
                 x=list(cex=0.35, rot=60),
                 y=list(
                     cex=0.7,
                     at=log(1:9),
                     labels=c("1","2","","4","","","","8","")
                 )
             ),
             par.strip.text=list(cex=0.5),
             panel=function(...){
                 panel.refline(h=0.0)
                 panel.xYplot(...)
             })

pdf("alt-bootstrap.pdf")
print(q)
dev.off()
