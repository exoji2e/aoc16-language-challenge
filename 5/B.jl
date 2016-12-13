using Nettle
d = 0;
c = 0;
strout = "__________"
while c<8
    str = ARGS[1]*"$d";
    str2 = bytes2hex(digest("MD5",str));
    #print(str2);
    m = match(r"00000.*",str2,1);
    if(m!=nothing)
        if(m.offset==1)
            #println(d);
            digit = UInt32(str2[6]) - 46; #digit = realdigit+2
            if digit > 0 && digit < 10 && strout[digit] == '_'
                strout = strout[1:digit-1] * str2[7:7] * strout[digit+1:10];
                c = c + 1;
                println(strout[2:9])
            end
        end
    end
    d = d+1;
end
