#include<iostream>
#include<vector>
#include<queue>
#include<unordered_set>
using namespace std;
struct state {
    int x;
    int y;
    vector<bool>* found;
    int dist;
};
string hash_state(struct state* s, int elem) {
    string ret = "" + to_string(s->x) + "," + to_string(s->y) + ",";
    for(int i = 0; i<elem; i++){
        bool b = (*s->found)[i];
        ret = ret + (b?"1":"0");
    }
    return ret;
}
bool done(struct state* s, int elem) {
    bool ok = true;
    for(int i = 0; i<elem; i++) {
        ok = ok && (*s->found)[i];
    }
    return ok;
}
int main() {
    vector<string> in;
    string line;
    while(getline(cin, line)) in.push_back(line);
    int sx = in.size();
    int sy = in[0].length();
    int** arr = new int*[sx];
    for(int i = 0; i<sx; i++) {
        arr[i] = new int[sy];
    }
    int x0 = -1;
    int y0 = -1;
    int elems = 0;
    for(int i = 0; i<sx; i++) {
        for(int j = 0; j<sy; j++) {
            if(in[i][j] == '0') {
                x0 = i;
                y0 = j;
            } else if(in[i][j] == '#') {
                arr[i][j] = -1;
            } else if(in[i][j] != '.') {
                arr[i][j] = in[i][j] - '0';
                elems++;
            }
        }
    }
    int dx[4] = {1, -1, 0, 0};
    int dy[4] = {0, 0, 1, -1};
    queue<struct state*> bfs;
    unordered_set<string> set;
    struct state* start = (struct state*) malloc(sizeof(struct state)); 
    start->x = x0; start->y = y0; start->dist = 0;
    start->found = new vector<bool>;
    for(int i = 0; i<elems; i++) {
        start->found->push_back(false);
    }
    bfs.push(start);
    int part1 = 0, part2 = 0;
    while(!bfs.empty() && (part1 == 0 || part2 == 0)) {
        struct state* old = bfs.front();
        bfs.pop();
        string hash = hash_state(old, elems);
        if(done(old, elems) && part1 == 0) {
            part1 = old->dist;
        }
        if(done(old, elems) && old->x == x0 && old->y == y0) {
            part2 = old->dist;
            break;
        }
        unordered_set<string>::const_iterator got = set.find(hash);
        if(got != set.end()) {
            delete old;
            continue;
        }
        set.insert(hash);
        for(int i = 0; i<4; i++) {
            int x = old->x + dx[i];
            int y = old->y + dy[i];
            if(arr[x][y] != -1) {
                struct state* nxt = (struct state*) malloc(sizeof(struct state));
                nxt->x = x;
                nxt->y = y;
                nxt->found = new vector<bool>;
                int w = arr[x][y] - 1;
                for(int i = 0; i<elems; i++) {
                    bool b = (*old->found)[i];
                    nxt->found->push_back(b || i == w);
                }
                nxt->dist = old->dist + 1;
                bfs.push(nxt);
            }
        }
        delete old->found;
        delete old;
    }
    cout << part1 << endl;
    cout << part2 << endl;
}
