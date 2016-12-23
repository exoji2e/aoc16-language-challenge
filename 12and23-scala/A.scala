object A {
  def main(args: Array[String]): Unit = {
    def toInstruction(line: String):Inst = {
      def reg(str:String) = str(0) - 'a'
      def getVal(str:String):(Int, Boolean) = {
        var x = reg(str)
        if(!(x>=0 && x<=3))
          (str.toInt, false)
        else 
          (x, true)
      }
      val arr = line.split(' ');
      arr(0) match {
        case "inc" => new Inc(reg(arr(1)))
        case "dec" => new Dec(reg(arr(1)))
        case "tgl" => new Tog(reg(arr(1)))
        case "cpy" => {
          val (x, xb) = getVal(arr(1))
          val (y, yb)  = getVal(arr(2))
          new Cpy(x, xb, y, yb)
        }
        case "jnz" => {
          val (x, xb) = getVal(arr(1))
          val (y, yb)  = getVal(arr(2))
          new Jnz(x, xb, y, yb)
        }
      }
    }
    val lines = Iterator.continually(scala.io.StdIn.readLine()).takeWhile(_ != null).toVector
    var program = lines.map{toInstruction}.toArray
    if(args.length != 4)  println("" + args.length + " registrers given, and not 4")

    val regs = args.map(_.toInt)
    var i = 0
    while(i<program.length) 
      i = program(i).exec(regs, program, i)
    println(regs(0))
  }  
}
abstract class Inst {
  def exec(regs: Array[Int], program: Array[Inst], id:Int):Int
  def toggle():Inst
}
class Inc(val reg:Int) extends Inst{
  def exec(regs: Array[Int], program: Array[Inst], id:Int):Int = {
    regs(reg) += 1
    id + 1
  }
  def toggle():Inst = {
    new Dec(reg)
  }
}
class Dec(val reg:Int) extends Inst{
  def exec(regs: Array[Int], program: Array[Inst], id:Int):Int = {
    regs(reg) -= 1
    id + 1
  }
  def toggle():Inst = {
    new Inc(reg)
  }
}
class Tog(val reg:Int) extends Inst{
  def exec(regs: Array[Int], program: Array[Inst], id:Int):Int = {
    val pos = id + regs(reg)
    if(pos>=0 && pos<program.length)
      program(pos) = program(pos).toggle
    id + 1
  }
  def toggle():Inst = {
    new Inc(reg)
  }
}
class Cpy(val x:Int, val xreg:Boolean, val y:Int, val yreg:Boolean) extends Inst{
  def exec(regs: Array[Int], program: Array[Inst], id:Int):Int = {
    if(yreg)
      regs(y) = (if(xreg) regs(x) else x)
    id + 1
  }
  def toggle():Inst = {
    new Jnz(x, xreg, y, yreg)
  }
}
class Jnz(val x:Int, val xreg:Boolean, val y:Int, val yreg:Boolean) extends Inst{
  def exec(regs: Array[Int], program: Array[Inst], id:Int):Int = {
    if((if(xreg) regs(x) else x) != 0) 
      if(yreg) id + regs(y) else id + y 
    else 
      id + 1
  }
  def toggle():Inst = {
    new Cpy(x, xreg, y, yreg)
  }
}
