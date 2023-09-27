const int n = 10;
int a = 2;

int func(int e, int* f) {
    int num = 0;
    while (e != 0) {
        num = num + e * f[0] + e * f[1];
        e = e - 1;
    }
    num = num % 10;
    return num;
}

int main() {
    float b;
    b=getfloat();
    int c = a + (int)b; // 将浮点数b转换为整数并与a相加
    int array[2] = { 0, 1 };

    if (!(n <= c)) {
        c = c / n;
        putint(c);
    }
    else {
        c = func(c, array);
        putint(c);
    }

    return 0;
}