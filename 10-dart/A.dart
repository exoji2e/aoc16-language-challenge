import 'dart:collection';
import 'dart:io';
import 'dart:convert';
var map = {};
var out = {};
var changed = true;
void main() {
    var line = stdin.readLineSync();
    while(line!=null) {
        processLine(line);
        line = stdin.readLineSync();
    }
    while(changed) {
        changed = false;
        map.forEach(handleBot);
    }
    var prod = 1;
    for(var i = 0; i<3; i++) {
        prod = out[i].fold(prod, (a, b) => a*b);
    }
    print(prod);
}
void handleBot(var k, var b) {
    if(b.items.length == 2) {
        changed = true;
        var lo = b.items.removeLast();
        var hi = b.items.removeLast();
        if(lo > hi) {
            var tmp = lo;
            lo = hi;
            hi = tmp;
        }
        if(lo == 17 && hi == 61) {
            print(k);
        }
        var toLo = b.to[0];
        var toHi = b.to[1];
        if(toLo<0) {
            toLo = -toLo - 1;
            if(out[toLo] == null) {
                out[toLo] = [];
            }
            out[toLo].add(lo);
        } else {
            map[toLo].items.add(lo);
        }
        if(toHi<0) {
            toHi = -toHi - 1;
            if(out[toHi] == null) {
                out[toHi] = [];
            }
            out[toHi].add(hi);
        } else {
            map[toHi].items.add(hi);
        }
    }
}

void processLine(String line) {
    var arr = line.split(' ');
    if(arr[0] == 'value') {
        int value = int.parse(arr[1]);
        int bot = int.parse(arr[5]);
        if(map[bot] == null) {
            map[bot] = new Bot();
        }
        map[bot].items.add(value);
        
    } else {
        int bot = int.parse(arr[1]);
        if(map[bot] == null) {
            map[bot] = new Bot();
        }
        int lo = int.parse(arr[6]);
        int hi = int.parse(arr[11]);
        if(arr[5] == 'output') {
            lo = -lo - 1;
        }
        if(arr[10] == 'output') {
            hi = -hi - 1;
        }
        map[bot].to.add(lo);
        map[bot].to.add(hi);
    }
}
class Bot {
    var to = [];
    var items = [];
}
