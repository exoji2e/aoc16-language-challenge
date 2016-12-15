using Nettle
d = 0;
c = 1;
strout = "__________"
while c<9
    str = ARGS[1]*"$d";
    str2 = bytes2hex(digest("MD5",str));
    #print(str2);
    m = match(r"00000.*",str2,1);
    if(m!=nothing)
        if(m.offset==1)
            strout = strout[1:c] * str2[6:6] * strout[c+2:10];
            c = c + 1;
            println(strout[2:9])
        end
    end
    d = d+1;
end
