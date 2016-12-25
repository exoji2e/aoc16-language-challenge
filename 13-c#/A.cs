using System;
using System.Collections.Generic;
public class A {
    static int magic;
    private class Coord {
        public int x, y;
        public int d;
        public Coord(int x, int y, int d) {
            this.x = x;
            this.y = y;
            this.d = d;
        }
        public override String ToString() {
            return "" + x + "," + y;
        }
    }
    public static void Main() {
        magic = int.Parse(Console.ReadLine());
        LinkedList<Coord> bfs = new LinkedList<Coord>();
        bfs.AddLast(new Coord(1, 1, 0));
        HashSet<String> set = new HashSet<String>();
        int[] dx = new int[]{1, -1, 0, 0};
        int[] dy = new int[]{0, 0, -1, 1};
        int part1 = -1, part2 = -1;
        while(bfs.Count > 0 && (part1 == -1 || part2 == -1)) {
            Coord c = bfs.First.Value;
            bfs.RemoveFirst();
            if(c.x == 31 && c.y == 39 && part1 == -1) {
                part1 = c.d;
            }
            if(c.d == 51 && part2 == -1) {
                part2 = set.Count;
            }
            String s = c.ToString();
            if(set.Contains(s)) continue;
            set.Add(s);
            for(int i = 0; i<4; i++) {
                int x = c.x + dx[i];
                int y = c.y + dy[i];
                if(Free(x,y)) {
                    bfs.AddLast(new Coord(x, y, c.d + 1));
                }
            }
        }
        Console.WriteLine(part1);
        Console.WriteLine(part2);

    }
    public static bool Free(int x, int y) {
        int n = x*x + 3*x + 2*x*y + y + y*y + magic;
        return x>=0 && y>=0 && BitCount(n)%2 == 0;
    }
    public static int BitCount(int n) {
        int c = 0;
        while(n>0) {
            if(n%2 == 1) c++;
            n /= 2;
        }
        return c;
    }
}
