arr = []
STDIN.read.split("\n").each do |a|
    txt = (a.split("-")[0..-2]).join("")
    last = a.split("-")[-1]
    nbr = last[0..-7].to_i
    hif = last[-6..-2]
    h = Hash.new(0)
    txt.each_char do |c|
        h[c] += 1
    end
    realhif = (h.sort_by{|k, v| [v,-(k.ord)]}.reverse[0..4]).map{|row| row[0]}.join("")

    if(realhif == hif) then 
        arr << nbr
    end
    
end
puts(arr.inject(0){|sum,x| sum + x})
