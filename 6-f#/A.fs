open System

let main() =
    let lines =
        Seq.initInfinite (fun _ -> Console.ReadLine())
        |> Seq.takeWhile(fun line -> line <> null)
        |> Seq.toList
    let all = 
        lines 
        |> List.fold(fun coll line -> List.append coll (List.zip [1..line.Length] (List.ofSeq line))) []
    //printfn "%A" all
    
    let set =
        all
        |> List.toSeq
        |> Seq.countBy (fun c -> c)
        |> Seq.sortBy (fun elem -> - snd elem)
        |> Seq.distinctBy (fun elem -> fst (fst elem))
        |> Seq.sortBy (fun elem -> fst (fst elem))

    let str =
        set
        |> Seq.map (fun ((a,b),c) -> b)
        |> String.Concat

    Console.WriteLine(str)
    
    (*for line in lines do 
        let xs = List.zip [1..line.Length] (List.ofSeq line)
        printfn "%A" xs
        //Console.WriteLine(xs[1])
    //printfn "%A" all 
    *)
main()
