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
function match(str) {
    var re = /([a-z])([a-z])\2\1/g;
    var m;
    do {
        m = re.exec(str);
        if(m && m[1] != m[2]) return true 
    } while(m);
    return false
}
function valid(str) {
    let start = str.indexOf('[')
    let end = str.indexOf(']')
    if(start == -1 || end == -1) {
        var m = match(str)
        return m? 1: 0
    }
    var m1 = match(str.substring(0,start))
    var m2 = match(str.substring(start+1,end))
    var x = valid(str.substring(end+1))
    if(m2 || x == -1) {
        return -1
    }
    if(m1 || x == 1) {
        return 1
    }
    return 0

}
list = getlines()
var count = 0
list.forEach(function(element) {
    if(valid(element) == 1) count++
});
print(count)
