sizex = 6
sizey = 50
board = new boolean[sizex][sizey]
def rotateCol(int y, int by) {
    coll = new boolean[sizex];
    sizex.times { i ->
        coll[(i + by)%sizex] = board[i][y];
    }
    sizex.times{ i ->
        board[i][y] = coll[i];
    }
}
def rotateRow(int x, int by) {
    row = new boolean[sizey];
    sizey.times { i ->
        row[(i + by)%sizey] = board[x][i];
    }
    sizey.times { i ->
        board[x][i] = row[i];
    }
}
def fill(int y, int x) {
    (x*y).times { i ->
        def yy = i%y
        def xx = i.intdiv(y)
        board[xx][yy] = true
    }
}
System.in.eachLine { String line ->
    def a = line.tokenize(" ")
    if(a.size == 2) {
        def a2 = a[1].split("x")
        fill(Integer.parseInt(a2[0]), Integer.parseInt(a2[1]))
    } else {
        def a2 = a[2].split("=")
        place = Integer.parseInt(a2[1])
        by = Integer.parseInt(a[4])
        if(line.contains("row"))
            rotateRow(place, by)
        else
            rotateCol(place, by)
    }
}
def c = 0
StringBuilder sb = new StringBuilder()
(sizex*sizey).times{i->
    def x = i.intdiv(sizey)
    def y = i%sizey
    if(y == 0 && x>0) sb.append('\n');
    sb.append(board[x][y]? 'x': '.');
    if(board[x][y]) c++
}
println c
println sb.toString()
