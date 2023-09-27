@n = constant i32 10, align 4
@a = global i32 2, align 4

define dso_local i32 @func(i32 noundef %0, i32* noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32* %1, i32** %4, align 8
  store i32 0, i32* %5, align 4
  br label %6

6:
  %7 = load i32, i32* %3, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %25

9:
  %10 = load i32, i32* %5, align 4
  %11 = load i32, i32* %3, align 4
  %12 = load i32*, i32** %4, align 8
  %13 = getelementptr inbounds i32, i32* %12, i64 0
  %14 = load i32, i32* %13, align 4
  %15 = mul nsw i32 %11, %14
  %16 = add nsw i32 %10, %15
  %17 = load i32, i32* %3, align 4
  %18 = load i32*, i32** %4, align 8
  %19 = getelementptr inbounds i32, i32* %18, i64 1
  %20 = load i32, i32* %19, align 4
  %21 = mul nsw i32 %17, %20
  %22 = add nsw i32 %16, %21
  store i32 %22, i32* %5, align 4
  %23 = load i32, i32* %3, align 4
  %24 = sub nsw i32 %23, 1
  store i32 %24, i32* %3, align 4
  br label %6

25:
  %26 = load i32, i32* %5, align 4
  %27 = srem i32 %26, 10
  store i32 %27, i32* %5, align 4
  %28 = load i32, i32* %5, align 4
  ret i32 %28
}

define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca i32, align 4
  %4 = alloca [2 x i32], align 4
  %one = getelementptr [2 x i32],[2 x i32]* %4, i64 0, i64 0
  store i32 0, i32* %one, align 4
  %two = getelementptr [2 x i32],[2 x i32]* %4, i64 0, i64 1
  store i32 1, i32* %two, align 4
    
  store i32 0, i32* %1, align 4
 
  %5 = call float @getfloat()
  store float %5, float* %2, align 4
  %6 = load i32, i32* @a, align 4
  %7 = load float, float* %2, align 4
  %8 = fptosi float %7 to i32
  %9 = add nsw i32 %6, %8
  store i32 %9, i32* %3, align 4

  %10 = load i32, i32* %3, align 4
  %11 = icmp sle i32 10, %10
  br i1 %11, label %16, label %12

12:
  %13 = load i32, i32* %3, align 4
  %14 = sdiv i32 %13, 10
  store i32 %14, i32* %3, align 4
  %15 = load i32, i32* %3, align 4

  call void @putint(i32 %15)
  br label %21

16:
  %17 = load i32, i32* %3, align 4
  %18 = getelementptr inbounds [2 x i32], [2 x i32]* %4, i64 0, i64 0
  %19 = call i32 @func(i32 noundef %17, i32* noundef %18)
  store i32 %19, i32* %3, align 4
  %20 = load i32, i32* %3, align 4

  call void @putint(i32 %20)
  br label %21

21:
  ret i32 0
}
declare float @getfloat()
declare void @putint(i32)
