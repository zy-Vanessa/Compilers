#include<stdio.h>
int main(){
    int a, b, i, n;
    a = 0;
    b = 1;
    i = 1;
    printf("please input number:");
    scanf("%d", &n);
    while(i < n){
        int t = b;
        b = a + b;
        printf("fib:%d\n", b);
        a = t;
        i = i + 1;
    }
    int m[2][2] = {{1, 2},{3, 4}};
    putarray(4, m);
    return 0;
}
