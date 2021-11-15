## 
## Session Config
## 
library(utils)
options(error=recover) ## requires utils package
options(repos=c(CRAN="https://cloud.r-project.org/"), download.file.method = "libcurl")
.libPaths(.libPaths())

#Sys.setenv(TZ="GMT")
Sys.setenv(TZ="America/Phoenix")  #doesn't work with xts::apply.daily(), fixed?

if (T) {
old <- getOption("defaultPackages");
options(defaultPackages = 
    c(old, 
    ## installs commonly cause reload problems
    #'plyr', #'reshape', ##'xtable',
    #'lattice', 
    #'ggplot2', #'RColorBrewer', ##'Rwave',
    #'zoo', #'xts', ##'dynlm', "MASS", 
    'utils', 'lattice', 'grid',
    'grid', 'data.table'
))
}

.First = function() {
    library(utils)
    library(tools)
    ## misc options
    options(error=recover) ## requires utils package
    options(menu.graphics=F) ## don't use graphical help chooser 
    options(width=50)   ## printing width
    options(max.print=500)   ## max # records to print
    options(pdfviewer='/usr/bin/evince')
    Rd2txt_options(width=60, minIndent=3)
}

## infix, logic, set functions
## inspired by sql
"%^%" = function(a, b) {paste(a, b, sep='')}
"%~%" <- function(x, pat) {seq(along=x) %in% grep(pat,x, perl=T)}
"%~*%" <- function(x, pat) {seq(along=x) %in% grep(pat,x, ignore.case=T, perl=T)}
"%nin%" <- function(x,y) !(x %in% y) 
between = function(x, low, high, ineq=F) {
    ## like SQL between, return logical index
    if (ineq) {
        x >= low & x <= high
    } else {
        x > low & x < high
    }
}
## symmetric version of setdiff
symdiff <- function( x, y) { setdiff( union(x, y), intersect(x, y))}

##
## constants
phi <- (1+sqrt(5))/2 
##
## convenience inspection
less <- function(x) page(x, method='print')
h <- function(x, n=5) head(x, n)
hh <- function(x, nr=5, nc=5) ( x[1:nr,1:nc] ) 
tt <- function(x, n=2) tail(x, n)
ss <- summary
os <- function(obj) print(object.size(obj), units='auto')
##
## convenience system
s2p = function(str) {as.POSIXct(str)}
hs = function(x=500) history(x)
ps = function(x) print(system.time(x))
pss = function(file, chdir=F) print(system.time(source(file, chdir=chdir)))
psd = function(file, chdir=T) print(system.time(source(file, chdir=chdir)))
sh = savehistory
## https://stackoverflow.com/questions/31381066/r-function-to-scale-ggplot2-lattice-or-base-r-graph-proportionally/32412384#32412384
gg.print <- function(x, scale=2)
    print(x, vp=viewport(gp=gpar(cex=scale, lex=scale)))
## run contents of vim "copy buffer"
rr = function(file='~/.rbuff.R') pss(file)
## 
## convenience plotting
mypdf <- function(
    file, height=7, ratio=phi, do.plot=T, code
) {
    pdf(file=file, height=height, width=height*ratio)
        if(do.plot) {
            plot( code )
        } else code
    dev.off()
}


# example
# allsn.z = mk.zoo(all.to20071218[ ! '\\d+/\\d+/1999 ' %=~% all.to20071218$timestamp ,])

rowcol = function(x, mod) {
    ## from a scalar, decompose into row/column vector for mod^2 cell array
    cbind(row = x %% mod, col=(x %/% mod ) +1)
}

##some convenience functions
## knit + pdf
pdfknit <- function(basename) {
    library(knitr)
    knit(sprintf('%s.Rnw', basename))
    system(sprintf('pdflatex %s', basename))
}
## 

colname.replace = function(pattern, replacement, mydf) {
    ## change a single column name exactly matching pattern to replacement
    colnames(mydf)[colnames(mydf)==pattern] <- replacement
    mydf
}

## this is for llply to set labels equal to element names
ccc = function(..., recursive=FALSE) {
    x=c(..., recursive=recursive); names(x) = x; return(x)
}

labpal = function(cols = c('lightgrey','blue')) {
    mypal <- colorRampPalette(cols, space = "Lab")
    return(mypal)
}

### clear all graphics windows
clearshow = function(n=length(dev.list())) {for (i in 1:n) {dev.off()}}

slideshow = function(mylist, fun=NA, ...) { # plot each element of a list using xyplot
    for (name in names(mylist) ) {
        this = mylist[[name]]
        if (length(this) <= 1 ) { #skip empty objs -- otherwise xyplot fails prematurely
            print("#! No Data for " %^% name)
            next
        }
        if (!identical(fun, NA)) { this = fun(this, ...) } # apply fun if present
        x11()
        myplot=xyplot(this, type='p', pch='.', main=name)
        plot(myplot)
    }
}

## set a lattice theme, call after graphics device is open
mk.mytheme = function() {
    trellis.par.set(theme = col.whitebg())
    mytheme=trellis.par.get()
    mytheme[[27]]$axis.top=1
    mytheme[[27]]$bottom.padding=1
    mytheme[[27]]$top.padding=3
    mytheme[[27]]$panel=-10
    mytheme[[27]]$main=1
    mytheme[[28]]$axis.left=1
    mytheme[[28]]$panel=1
    mytheme[[28]]$left.padding=2
    mytheme[[28]]$right.padding=1
    trellis.par.set(theme = mytheme)
}

load.dev <- function() {
    library(devtools)
    library(testthat)
    library(roxygen2)
}

roxy <- function(path='.') {
    load.dev()
    roxygenize(path)
}

## old
if (FALSE){

    #lmplot = function(x) {layout(matrix(1:4, nrow=2)); plot(x)}

    levelzoo = function(myz, cuts=100, colfun=rainbow, aspect='fill',...){
            plot(levelplot(coredata(myz), col.regions=colfun(cuts+1), cuts=cuts, aspect=aspect, ...))
    }

    my.date = function() format(Sys.time(), '%Y_%m_%d')


    parbg = function(mycolor='#333333') {
        ## pass to par.settings in trellis to get dark background
        return(list(background=list(col=mycolor)))
    }


    my.packet.panel = function(layout, row, column, ...) {
        ### plot lattice panels from top to bottom first
        layout <- layout[c(2, 1, 3)]
        packet.panel.default(layout = layout,
        row = column,
        column = row, ...)
    }
}
