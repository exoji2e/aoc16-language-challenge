function getlines() {
    var stdin = new java.io.BufferedReader( new java.io.InputStreamReader(java.lang.System['in']) )
    var inp = []
    var line = stdin.readLine()
    while(line != null) {
        inp.push(String(line))
        line = stdin.readLine()
    }
    return inp
}
function invert(str) {
    return "" + str[1] + str[0] + str[1];
}
function match(str, inside, set1, set2) {
    for (i = 0; i<str.length - 2; i++) {
        if(str[i] == str[i+2] && str[i] != str[i+1]) {
            if(inside) {
                var res = invert(str.substring(i, i+3));
                if(set1.hasOwnProperty(res)) return true
                set2[res] = true
            }else {
                var res = str.substring(i, i+3)
                if(set2.hasOwnProperty(res)) return true
                set1[res] = true
            }
        }
    }
}
function valid(str, set1, set2) {
    let start = str.indexOf('[')
    let end = str.indexOf(']')
    if(start == -1 || end == -1) {
        return match(str, false, set1, set2)
    }
    var m1 = match(str.substring(0,start), false, set1, set2)
    var m2 = match(str.substring(start+1,end), true, set1, set2)
    var x = valid(str.substring(end+1), set1, set2)
    return m1 || m2 || x
}

list = getlines()
var count = 0
list.forEach(function(element) {
    var set1 = {}
    var set2 = {}
    if(valid(element, set1, set2)) count++
});
print(count)
