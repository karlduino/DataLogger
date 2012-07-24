library(timeDate)
fridge <- read.csv("fridge_log.csv", as.is=TRUE)
fridge$timedate <- timeDate(paste(fridge$date, fridge$time), format="%m/%d/%Y %H:%M:%S", FinCenter="Chicago")

light.threshold <- 200
on <- fridge$light > light.threshold
wenton <- fridge$timedate[-1][on[-1] & !on[-length(on)]]
wentoff <- fridge$timedate[-1][!on[-1] & on[-length(on)]]
wentoff <- wentoff[-1]


png("fridge_temp.png", height=750, width=1000, pointsize=18)
plot(fridge$timedate, fridge$temp, type="n", ylab="Temperature", xlab="Time", las=1,
     main="Refridgerator temperature", ylim=c(27, 50), yaxs="i", xaxs="i")
abline(h=c(40,32), col="green", lty=2)
lines(fridge$timedate, fridge$temp)
u <- par("usr")
thecol <- rep("slateblue", length(wenton))
thecol[wentoff - wenton > 10] <- "darkred"
points(wenton, u[3] + (((1:length(wenton)) %% 5)+1)*diff(u[3:4])*0.01, pch=16, col=thecol)
legend("topright", pch=16, col=c("slateblue", "darkred"), c("door opened", "open \u2265 10 sec"))
dev.off()


######################################################################

rm(list=ls())

fridge <- read.csv("fridge_log_2b.csv", as.is=TRUE)
fridge$timedate <- timeDate(paste(fridge$date, fridge$time), format="%m/%d/%Y %H:%M:%S", FinCenter="Chicago")

light.threshold <- 200
on <- fridge$light > light.threshold
wenton <- fridge$timedate[-1][on[-1] & !on[-length(on)]]
wentoff <- fridge$timedate[-1][!on[-1] & on[-length(on)]]
wentoff <- wentoff[-1]


png("fridge_temp_2.png", height=750, width=1000, pointsize=18)
plot(fridge$timedate, fridge$temp, type="n", ylab="Temperature", xlab="Time", las=1,
     main="Refridgerator temperature", ylim=c(27, 50), yaxs="i", xaxs="i")
abline(h=c(40,32), col="green", lty=2)
lines(fridge$timedate, fridge$temp)
u <- par("usr")
thecol <- rep("slateblue", length(wenton))
thecol[wentoff - wenton > 10] <- "darkred"
points(wenton, u[3] + (((1:length(wenton)) %% 5)+1)*diff(u[3:4])*0.01, pch=16, col=thecol)
legend("topright", pch=16, col=c("slateblue", "darkred"), c("door opened", "open \u2265 10 sec"))
dev.off()
