gridBulletGraph <- function(bgData, nticks=3, format="s", bcol=c("red", "green", "yellow"), tcol="black", vcol="black", font=25, scfont=15) {
  
  # Data Prep
  n <- nrow(bgData)
  nam <- c("high", "mean", "low", "target", "value")
  datMat <- as.matrix(bgData[, nam])
  
  # Nticks/Format Prep
  if (length(nticks) == 1) {
    nticks <- rep(nticks, n)
  }
  if (length(format) == 1) {
    format <- rep(format, n)
  }
  
  # Layout
  hl <- rep(1, n + 2)
  hu <- c("lines", rep("null", n), "lines")
  layout <- grid.layout(n + 2, 4, widths = unit(c(1, 1, 5, 2), c("lines", "null", "null", "lines")),
                        heights = unit(hl, hu))
  
  # Set Layout
  grid.newpage()
  pushViewport(plotViewport(c(0, 0, 0, 0), layout = layout))
  for (i in 1:n) {
    #
    vp <- viewport(layout.pos.row = i+1, 
                   layout.pos.col = 3)
    pushViewport(vp)
    
    # Sublayout
    subLayout <- grid.layout(nrow    = 3, 
                             ncol    = 1, 
                             heights = unit(c(1, 2, 1), c("null", "null", "null")))
    pushViewport(plotViewport(c(0, 0, 0, 0), layout=subLayout))
    
    
    vp <- viewport(layout.pos.row = 2, 
                   layout.pos.col = 1, 
                   xscale         = c(0, datMat[i, 1]))
    pushViewport(vp)
    
    # x-Axis Labels
    # Formatierung Label
    if (format[i] == "s") {
      brks <- labels <- round(seq(0, datMat[i, 1], length=nticks[i]), 0)
    } else if (format[i] == "p"){
      brks <- labels <- round(seq(0, datMat[i, 1], length=nticks[i]), 0)
      labels <- paste0(labels, "%")
    } else if (format[i] == "k") {
      brks <- labels <- round(seq(0, datMat[i, 1], length=nticks[i]), 0)
      labels <- format(labels, digits=10, nsmall=0, decimal.mark=".", big.mark=",")
    }
    
    grid.xaxis(at=brks, label=labels, gp=gpar(fontsize=scfont, col="black", fontface="bold"))
    
    grid.rect(x      = c(0, datMat[i, 1:2]) / datMat[i, 1], 
              width  = unit(diff(c(0, datMat[i, 1:3])), "native"),
              y      = rep(0.5, 3), 
              height = 1, 
              just   = "left",
              gp     = gpar(fill=bcol, col=bcol))
    
    grid.rect(x      = c(0, datMat[i, 5]),  
              width  = unit(diff(c(0, datMat[i, 5])), "native"),
              y      = 0.5, 
              height = 0.5, 
              gp     = gpar(fill=vcol, col=vcol), just="left")
    
    a <- datMat[i, 1] * 0.0025
    grid.rect(x      = datMat[i, 4] / datMat[i, 1],  
              width  = unit(2 * a, "native"),
              y      = 0.5, 
              height = 0.8, 
              gp     = gpar(fill=tcol, col=tcol), just="left")
    
    upViewport(n=3)
    
    
    # Annotation
    pushViewport(plotViewport(c(0, 0, 0, 0), layout=layout))
    vp <- viewport(layout.pos.row = i+1, 
                   layout.pos.col = 2)
    pushViewport(vp)
    
    # Sublayout 1: Same layout as graph
    subLayout <- grid.layout(nrow    = 3, 
                             ncol    = 1, 
                             heights = unit(c(1, 2, 1), c("null", "null", "null")))
    pushViewport(plotViewport(c(0, 0, 0, 0), layout=subLayout))
    
    vp <- viewport(layout.pos.row = 2, 
                   layout.pos.col = 1)
    pushViewport(vp)
    
    # Sublayout 2: two rows of text; centred middle of graph
    subLayout <- grid.layout(nrow    = 2, 
                             ncol    = 1, 
                             heights = unit(c(1, 1), c("null", "null")))
    pushViewport(plotViewport(c(0, 0, 0, 0), layout=subLayout))
    
    # First Text: Measure
    vp <- viewport(layout.pos.row = 1, 
                   layout.pos.col = 1) 
    pushViewport(vp)
    grid.text(label = bgData$measure[i], 
              just  = "right", 
              gp    = gpar(fontsize=font, col="black", fontface="bold"), 
              x     = .9,
              y     = .5)
    upViewport()
    
    # Second Text: Unit
    vp <- viewport(layout.pos.row = 2, 
                   layout.pos.col = 1) 
    pushViewport(vp)
    grid.text(label = bgData$units[i],
              just  = "right", 
              gp    = gpar(fontsize=font, col="black"), 
              x     = .9,
              y     = .5)
    upViewport(n=5)
  }
}



gridBulletGraphV <- function(bgData, nticks=3, format="s", bcol=c("red", "green", "yellow"), tcol="black", vcol="black", font=25, scfont=15) {
  
  # Data Prep
  n <- nrow(bgData)
  nam <- c("high", "mean", "low", "target", "value")
  datMat <- as.matrix(bgData[, nam])
  
  # Nticks/Format Prep
  if (length(nticks) == 1) {
    nticks <- rep(nticks, n)
  }
  if (length(format) == 1) {
    format <- rep(format, n)
  }
  
  # Layout
  hl <- rep(1, n + 2)
  hu <- c("lines", rep("null", n), "lines")
  layout <- grid.layout(4, n + 2, widths = unit(hl, hu),
                        heights = unit(c(1, 1, 5, 2), c("lines", "null", "null", "lines")))
  
  # Set Layout
  grid.newpage()
  pushViewport(plotViewport(c(0, 0, 0, 0), layout = layout))
  for (i in 1:n) {
    #
    vp <- viewport(layout.pos.row = 3, 
                   layout.pos.col = i+1)
    pushViewport(vp)
    
    # Sublayout
    subLayout <- grid.layout(nrow    = 1, 
                             widths  = unit(c(1, 2, 1), c("null", "null", "null")),
                             ncol    = 3) 
    pushViewport(plotViewport(c(0, 0, 0, 0), layout=subLayout))
    
    
    vp <- viewport(layout.pos.row = 1, 
                   layout.pos.col = 2, 
                   yscale         = c(0, datMat[i, 1]))
    pushViewport(vp)
    
    # x-Axis Labels
    # Formatierung Label
    if (format[i] == "s") {
      brks <- labels <- round(seq(0, datMat[i, 1], length=nticks[i]), 0)
    } else if (format[i] == "p"){
      brks <- labels <- round(seq(0, datMat[i, 1], length=nticks[i]), 0)
      labels <- paste0(labels, "%")
    } else if (format[i] == "k") {
      brks <- labels <- round(seq(0, datMat[i, 1], length=nticks[i]), 0)
      labels <- format(labels, digits=10, nsmall=0, decimal.mark=".", big.mark=",")
    }
    
    grid.yaxis(at=brks, label=labels, gp=gpar(fontsize=scfont, col="black", fontface="bold"))
    
    grid.rect(y      = c(0, datMat[i, 1:2]) / datMat[i, 1], 
              height = unit(diff(c(0, datMat[i, 1:3])), "native"),
              x      = rep(0.5, 3), 
              width  = 1, 
              just   = "bottom",
              gp     = gpar(fill=bcol, col=bcol))
    
    grid.rect(y      = c(0, datMat[i, 5]),  
              height = unit(diff(c(0, datMat[i, 5])), "native"),
              x      = 0.5, 
              width  = 0.5, 
              gp     = gpar(fill=vcol, col=vcol), just="bottom")
    
    a <- datMat[i, 1] * 0.0025
    grid.rect(y      = datMat[i, 4] / datMat[i, 1],  
              height = unit(2 * a, "native"),
              x      = 0.5, 
              width  = 0.8, 
              gp     = gpar(fill=tcol, col=tcol), just="bottom")
    
    upViewport(n=3)
    
    
    # Annotation
    pushViewport(plotViewport(c(0, 0, 0, 0), layout=layout))
    vp <- viewport(layout.pos.row = 2, 
                   layout.pos.col = i+1)
    pushViewport(vp)
    
    # Sublayout 1: Same layout as graph
    subLayout <- grid.layout(nrow    = 1, 
                             ncol    = 3, 
                             widths  = unit(c(1, 2, 1), c("null", "null", "null")))
    pushViewport(plotViewport(c(0, 0, 0, 0), layout=subLayout))
    
    vp <- viewport(layout.pos.row = 1, 
                   layout.pos.col = 2)
    pushViewport(vp)
    
    # Sublayout 2: two rows of text; centred middle of graph
    subLayout <- grid.layout(nrow    = 2, 
                             ncol    = 1, 
                             widths = unit(c(1, 1), c("null", "null")))
    pushViewport(plotViewport(c(0, 0, 0, 0), layout=subLayout))
    
    # First Text: Measure
    vp <- viewport(layout.pos.row = 1, 
                   layout.pos.col = 1) 
    pushViewport(vp)
    grid.text(label = bgData$measure[i], 
              just  = "bottom", 
              gp    = gpar(fontsize=font, col="black", fontface="bold"), 
              x     = .5,
              y     = 0.1)
    upViewport()
    
    # Second Text: Unit
    vp <- viewport(layout.pos.row = 2, 
                   layout.pos.col = 1) 
    pushViewport(vp)
    grid.text(label = bgData$units[i],
              just  = "bottom", 
              gp    = gpar(fontsize=font, col="black"), 
              x     = .5,
              y     = .5)
    upViewport(n=5)
  }
}
