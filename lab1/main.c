#include <stdio.h>
#include <time.h> // 包含用于计时的头文件

#define number 50
#define NUM_ITERATIONS 10000 // 定义迭代次数

int main()
{
    double total_cpu_time_used = 0.0;
    int a, b, i, t, n;
    clock_t start_time, end_time; // 定义时钟变量

    a = 0;
    b = 1;
    i = 1;
    scanf("%d", &n);
    for (int iter = 0; iter < NUM_ITERATIONS; iter++)
    {
        start_time = clock(); // 记录开始时间
        if (2 + 2 == 5)
        {
            printf("This code will never execute!");
        }

        if (number == 0)
        {
            printf("error!");
        }


        while (i < n)
        {
            t = b;
            b = a + b;
            printf("%d\n", b);
            a = t;
            i = i + 1;
        }

        end_time = clock(); // 记录结束时间
        double cpu_time_used = ((double)(end_time - start_time)) / CLOCKS_PER_SEC;
        total_cpu_time_used += cpu_time_used;
        a = 0;
        b = 1;
        i = 1;

    }

    printf("Average execution time over %d iterations: %lf seconds\n", NUM_ITERATIONS, total_cpu_time_used / NUM_ITERATIONS);

    return 0;
}
