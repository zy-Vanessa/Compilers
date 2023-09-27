; ModuleID = 'sysy.c'
source_filename = "sysy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@globalVar = dso_local global i32 10, align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca [5 x i32], align 16
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca float, align 4
  %9 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 5, i32* %2, align 4
  store i32 7, i32* %3, align 4
  %10 = getelementptr inbounds [5 x i32], [5 x i32]* %4, i64 0, i64 0
  store i32 1, i32* %10, align 16
  %11 = getelementptr inbounds [5 x i32], [5 x i32]* %4, i64 0, i64 1
  store i32 2, i32* %11, align 4
  %12 = load i32, i32* %5, align 4
  %13 = call i32 (i32, ...) bitcast (i32 (...)* @getint to i32 (i32, ...)*)(i32 noundef %12)
  %14 = load i32, i32* %5, align 4
  %15 = call i32 (i32, ...) bitcast (i32 (...)* @putint to i32 (i32, ...)*)(i32 noundef %14)
  store i32 0, i32* %6, align 4
  br label %16

16:                                               ; preds = %41, %0
  %17 = load i32, i32* %6, align 4
  %18 = icmp slt i32 %17, 5
  br i1 %18, label %19, label %44

19:                                               ; preds = %16
  %20 = load i32, i32* %6, align 4
  %21 = icmp eq i32 %20, 2
  br i1 %21, label %22, label %23

22:                                               ; preds = %19
  br label %44

23:                                               ; preds = %19
  %24 = load i32, i32* %2, align 4
  %25 = load i32, i32* %6, align 4
  %26 = add nsw i32 %24, %25
  store i32 %26, i32* %2, align 4
  %27 = load i32, i32* %2, align 4
  %28 = icmp sge i32 %27, 8
  br i1 %28, label %29, label %32

29:                                               ; preds = %23
  %30 = load i32, i32* %2, align 4
  %31 = sub nsw i32 %30, 2
  store i32 %31, i32* %2, align 4
  br label %32

32:                                               ; preds = %29, %23
  %33 = load i32, i32* %5, align 4
  %34 = icmp slt i32 %33, 0
  br i1 %34, label %35, label %41

35:                                               ; preds = %32
  %36 = load i32, i32* %2, align 4
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %38, label %41

38:                                               ; preds = %35
  %39 = load i32, i32* %5, align 4
  %40 = mul nsw i32 %39, -1
  store i32 %40, i32* %5, align 4
  br label %41

41:                                               ; preds = %38, %35, %32
  %42 = load i32, i32* %6, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %6, align 4
  br label %16, !llvm.loop !6

44:                                               ; preds = %22, %16
  %45 = load i32, i32* %2, align 4
  %46 = call i32 @add(i32 noundef %45, i32 noundef 7)
  store i32 %46, i32* %7, align 4
  %47 = call float @multiply(float noundef 2.500000e+00, float noundef 3.000000e+00)
  store float %47, float* %8, align 4
  %48 = load float, float* %8, align 4
  %49 = fptosi float %48 to i32
  store i32 %49, i32* %9, align 4
  %50 = load i32, i32* %9, align 4
  ret i32 %50
}

declare i32 @getint(...) #1

declare i32 @putint(...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @add(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %3, align 4
  %6 = load i32, i32* %4, align 4
  %7 = add nsw i32 %5, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @multiply(float noundef %0, float noundef %1) #0 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  store float %0, float* %3, align 4
  store float %1, float* %4, align 4
  %5 = load float, float* %3, align 4
  %6 = load float, float* %4, align 4
  %7 = fmul float %5, %6
  ret float %7
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
