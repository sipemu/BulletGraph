ytd2005 <- data.frame(
  measure=c("Revenue", "Profit", "Avg Order Size", "New Customers", "Cust Satisfaction"),
  units=c("U.S. $ (1,000s)", "%", "U.S. $", "Count", "Top Rating of 5"),
  low=c(150, 20, 350, 1400, 3.5), 
  mean=c(225, 25, 500, 2000, 4.25),
  high=c(300, 30, 600, 2500, 5),
  target=c(250, 26, 550, 2100, 4.2),
  value=c(275, 22.5, 310, 1700, 4.5)
)

nticks <- c(7, 7, 7, 6, 7)
format <- c("s", "p", "s", "k", "s")

col1 <- c("#a5a7a9", "#c5c6c8", "#e6e6e7")
png("BulletGraphz_h_grey.png", width=1500, height=500)
gridBulletGraph(ytd2005, nticks=nticks, format=format, bcol=col1)
dev.off()

png("BulletGraphz_v_grey.png", width=1500, height=500)
gridBulletGraphV(ytd2005, nticks=nticks, format=format, bcol=col1)
dev.off()
