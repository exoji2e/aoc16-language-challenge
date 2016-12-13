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
var input = readLine()!
var inarr = input.characters.split{$0 == ","}.map(String.init)
var x = 0
var y = 0
var d = 0
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
    switch(d) {
        case 0: x = x + dist
        case 1: y = y + dist
        case 2: x = x - dist
        default: y = y - dist
    }
}
print(abs(x) + abs(y))
