mod <- c(7, 13, 3, 5, 17, 19)
start <- c(0, 0, 2, 2, 0, 7)
findi <- function(mod, start) {
    i <- 0
    repeat {
        i <- i + 1
        ok = TRUE
        for (k in 1:length(mod)) ok = ok && ((start[k] + i + k)%%mod[k] == 0)
        if(ok) break
    }
    print(i)
}
findi(mod, start)
mod <- c(mod, 11)
start <- c(start, 0)
findi(mod, start)
