import Data.Char
main = simulate(-2, 0)

simulate :: (Int, Int) -> IO ()
simulate (x, y) = do
    line <- getLine
    if null line
        then return ()
        else do
            let (nx, ny) = walk(line, x, y)
            putChar(toUpper(geti(nx, ny)))
            simulate(nx, ny)
            return ()
walk :: (String, Int, Int) -> (Int, Int)
walk (line, x, y) = foldl lol (x, y) line
   where lol(a,b) c = step(a, b, c)

geti :: (Int, Int) -> Char
geti (x, y) = do
    if y == -2 
        then intToDigit(1)
    else if y == -1
        then intToDigit(x + 3)
    else if y == 0
        then intToDigit(x + 7)
    else if y == 1
        then intToDigit(x + 11)
    else
        intToDigit(13)

--step :: Int -> Int -> Char -> (Int, Int)
step :: (Int, Int,Char) -> (Int, Int)
step (x, y, c) = do
    if c == 'L' && accept(y, -x)
        then (x-1, y)
    else if c == 'R' && accept(y, x)
        then (x+1, y)
    else if c == 'U' && accept(x, -y)
        then (x, y-1)
    else if c == 'D' && accept(x, y)
        then (x, y+1)
    else
        (x, y)
    
accept :: (Int, Int) -> Bool
accept (x, y) = (y /= 2 && not(y == 1 && abs(x) == 1) && not(y == 0 && abs(x) == 2))

