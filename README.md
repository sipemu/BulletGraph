Bullet Graph in R
===========

Stephen Few designed the Bullet Graph as a way to display measurements vs. goals/other benchmarks or as a comparison of benchmarks. This R functions are guidelined from  <a href="http://www.perceptualedge.com/articles/misc/Bullet_Graph_Design_Spec.pdf" target="_blank">Few's specifications</a> and are based on the R-grid-package.


Example
----

Let's have a look at the extracted example data from Few's paper:
```
  ytd2005 <- data.frame(
    measure=c("Revenue", "Profit", "Avg Order Size", "New Customers", "Cust Satisfaction"),
    units=c("U.S. $ (1,000s)", "%", "U.S. $", "Count", "Top Rating of 5"),
    low=c(150, 20, 350, 1400, 3.5), 
    mean=c(225, 25, 500, 2000, 4.25),
    high=c(300, 30, 600, 2500, 5),
    target=c(250, 26, 550, 2100, 4.2),
    value=c(275, 22.5, 310, 1700, 4.5)
  )
```
The first two columns of the data.frame are the annotations of the bullet graphs. Next three lines defines the three areas low, mean, and high. Next column gives the values of the target bar and last column is the actual value. Every row of the data.frame is a bullet graph.

You can customice your graph by:

-the number of ticks for each graph

```
nticks <- c(7, 7, 7, 6, 7)
```

-the format of the numbers for each graph
```
format <- c("s", "p", "s", "k", "s")
```

-the colour
```
col1 <- c("#a5a7a9", "#c5c6c8", "#e6e6e7")
```

Furthermore, the fontsize of the annotation and the tick labels can be changed.

Finnally, you can plot horizontal
```
png("BulletGraphz_h_grey.png", width=1500, height=500)
gridBulletGraphH(ytd2005, nticks=nticks, format=format, bcol=col1)
dev.off()
```

or vertical
```
png("BulletGraphz_v_grey.png", width=1500, height=500)
gridBulletGraphV(ytd2005, nticks=nticks, format=format, bcol=col1)
dev.off()
```

## License

This code is licensed under the GPLv3. See these file for additional details:

- COPYING - license (GPLv3)

