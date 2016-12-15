import Data.Char
main = simulate(0, 0)

simulate :: (Int, Int) -> IO ()
simulate (x, y) = do
    line <- getLine
    if null line
        then return ()
        else do
            let (nx, ny) = walk(line, x, y)
            putChar(geti(nx, ny))
            simulate(nx, ny)
            return ()
walk :: (String, Int, Int) -> (Int, Int)
walk (line, x, y) = foldl lol (x, y) line
   where lol(a,b) c = step(a, b, c)

geti :: (Int, Int) -> Char
geti (x, y) = intToDigit(x + 2 + 3*(y+1))

--step :: Int -> Int -> Char -> (Int, Int)
step :: (Int, Int,Char) -> (Int, Int)
step (x, y, c) = do
    if c == 'L' && x > -1
        then (x-1, y)
    else if c == 'R' && x < 1
        then (x+1, y)
    else if c == 'U' && y > -1
        then (x, y-1)
    else if c == 'D' && y < 1
        then (x, y+1)
    else
        (x, y)
    

