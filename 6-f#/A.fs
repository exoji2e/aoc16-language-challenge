open System

let main() =
    let lines =
        Seq.initInfinite (fun _ -> Console.ReadLine())
        |> Seq.takeWhile(fun line -> line <> null)
        |> Seq.toList

    let set = 
        lines 
        |> List.fold(fun coll line -> List.append coll (List.zip [1..line.Length] (List.ofSeq line))) []
        |> List.toSeq
        |> Seq.countBy (fun c -> c)
    
    let str1 = //part1
        set
        |> Seq.sortBy (fun elem -> - snd elem) //highest frequency
        |> Seq.distinctBy (fun elem -> fst (fst elem))
        |> Seq.sortBy (fun elem -> fst (fst elem))
        |> Seq.map (fun ((a,b),c) -> b)
        |> String.Concat
        
    let str2 = //part2
        set
        |> Seq.sortBy (fun elem -> snd elem) //lowest frequency
        |> Seq.distinctBy (fun elem -> fst (fst elem))
        |> Seq.sortBy (fun elem -> fst (fst elem))
        |> Seq.map (fun ((a,b),c) -> b)
        |> String.Concat

    Console.WriteLine(str1)
    Console.WriteLine(str2)
    
main()
