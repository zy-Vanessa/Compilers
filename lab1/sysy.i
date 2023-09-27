# 0 "sysy.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 0 "<command-line>" 2
# 1 "sysy.c"

int globalVar = 10;


int add(int a, int b);
float multiply(float x, float y);

int main() {

    int localVar = 5;


    const int constVar = 7;


    int myArray[5];
    myArray[0] = 1;
    myArray[1] = 2;


    int input;
    getint(input);


    putint(input);


    int i = 0;
    while (i < 5) {

        if (i == 2) {
            break;
        }


        localVar = localVar + i;


        if (localVar >= 8) {
            localVar = localVar - 2;
        }


        if (input < 0 && localVar > 0) {
            input = input * -1;
        }

        i = i + 1;
    }


    int result = add(localVar, constVar);
    float product = multiply(2.5, 3.0);


    int intResult = (int)product;


    return intResult;
}


int add(int a, int b) {
    return a + b;
}

float multiply(float x, float y) {
    return x * y;
}
