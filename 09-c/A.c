#include<stdio.h>
int main() {
    char str[20000];
    scanf("%s", str);
    int sum = 0;
    for(int i = 0; ; i++) {
        if(str[i] == '\0') break;
        if(str[i] == '(') {
            i++;
            int l = 0;
            while(str[i] != 'x') {
                l = 10*l + (str[i] - '0');
                i++;
            }
            i++;
            int fac = 0;
            while(str[i] != ')') {
                fac = 10*fac + (str[i] - '0');
                i++;
            }
            sum += fac*l;
            i += l;
        } else {
            sum += 1;
        }
    }
    printf("%d\n", sum);
}
