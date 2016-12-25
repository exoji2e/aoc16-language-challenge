extension String {
  subscript (i: Int) -> Character {
    return self[self.startIndex.advancedBy(i)]
  }
  subscript (i: Int) -> String {
      return String(self[i] as Character)
        
  }
  subscript (r: Range<Int>) -> String {
    let start = startIndex.advancedBy(r.startIndex)
    let end = start.advancedBy(r.endIndex - r.startIndex)
    return self[Range(start ..< end)]
  }
}
func abs(x: Int) -> Int {
    if(x>0) {
        return x
    } else {
        return -x
    }
}
func updateX(x: Int, d: Int) -> Int {
    if(d == 0) {return x + 1}
    else if(d == 2) {return x - 1}
    else {return x}
}
func updateY(y: Int, d: Int) -> Int {
    if(d == 1) {return y + 1 }
    else if(d == 3) {return y - 1}
    else {return y}
}
var input = readLine()!
var inarr = input.characters.split{$0 == ","}.map(String.init)
var x = 1000
var y = 1000
var arr = Array(count: 2000, repeatedValue: Array(count: 2000, repeatedValue: 0))
var d = 0
var p2 = -1;
import Foundation
for inp in inarr {
    var str = inp
    if(inp[0] == " ") {
    	let end = inp.startIndex.distanceTo(inp.endIndex)
	str = inp[1..<end]
    }
    if(str[0] == "R") {
        d = (d + 3)%4
    }else {
        d = (d + 1)%4
    }
    let end = str.startIndex.distanceTo(str.endIndex)
    let sub = str[1..<end]
    let dist = Int(sub)!
    var i = 0
    while(i<dist){
        x = updateX(x, d:d)
        y = updateY(y, d:d)
        arr[x][y] = arr[x][y] + 1
        if(arr[x][y] == 2 && p2 == -1) {
            p2 = abs(x-1000) + abs(y-1000)
        }
        i = i+1
    }
}
print(abs(x-1000) + abs(y-1000))
print(p2)
