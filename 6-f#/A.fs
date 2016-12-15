open System

let main() =
    let lines =
        Seq.initInfinite (fun _ -> Console.ReadLine())
        |> Seq.takeWhile(fun line -> line <> null)
        |> Seq.toList

    let all = 
        lines 
        |> List.fold(fun coll line -> List.append coll (List.zip [1..line.Length] (List.ofSeq line))) []
    
    let set =
        all
        |> List.toSeq
        |> Seq.countBy (fun c -> c)
        |> Seq.sortBy (fun elem -> - snd elem)
        |> Seq.distinctBy (fun elem -> fst (fst elem))

    let str =
        set
        |> Seq.sortBy (fun elem -> fst (fst elem))
        |> Seq.map (fun ((a,b),c) -> b)
        |> String.Concat

    Console.WriteLine(str)
    
main()
