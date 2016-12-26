STDIN.read.split("\n").each do |a|
    txt = (a.split("-")[0..-2]).join("")
    last = a.split("-")[-1]
    nbr = last[0..-7].to_i
    message = txt.chars.map{|ch| ((ch.ord - 'a'.ord + nbr)%26 + 'a'.ord).chr}.join("")
    if(message.include? "northpole") then
        puts(nbr)
    end
end
