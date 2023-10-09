	.arch armv7-a
	.data
@a = 0
a:
	.word 0
@b = 1
b:
	.word 1
@i = 1
i:
	.word 1
@t = 0
t:
	.word 0
@n = 0
n:
	.word 0

@代码段
	.text 
	.align 4
output:
	.asciz "fib:%d\n"
	.align 4
info:
	.asciz "please input number:"
input:
	.asciz "%d"
	.align 4

@主函数main
	.global main
	.type main,%function
main:
	push {fp,lr} @保存返回地址,栈基地址

.input:
	adr r0,info  @读取字info字符串地址
	bl printf    @调用printf函数,打印字符串 "info"
	mov r8,lr
	adr r0,input @字符串 "input" 的地址加载到寄存器 r0 中
	sub sp,sp,#4 @留出一个4字节的空间，保存用户输入
	mov r1,sp
	bl scanf     @读取用户的输入并将其保存在栈中为其分配的空间中
	ldr r2,[sp,#0] @从栈中加载用户输入的值到寄存器 r2 中
	ldr r1,addr_n0 @加载变量 addr_n0 的地址到寄存器 r1 中
	str r2,[r1]  @将n的值写入到地址为 addr_n0 的变量中，完成了用户输入的存储
	add sp,sp,#4
	mov lr,r8

.params:
	mov r0,r2
	ldr r4,addr_i0
	ldr r4,[r4]  @变量i
	ldr r3,addr_b0
	ldr r3,[r3]  @变量b
	ldr r6,addr_a0
	ldr r6,[r6]  @变量a

.LOOP:
	mov r5,r3    @t = b
	add r3,r3,r6 @b = a + b
	push {r0,r1,r2,r3} @在进行函数调用时，一般前四个函数参数使用 r0-r3 号寄存器进行传参
	adr r0,output   @printf的参数
	mov r1,r3
	bl printf    @调用printf函数,printf("fib:%d\n", b);
	pop {r0,r1,r2,r3}
	mov r6,r5    @a = t
	add r4,#1    @i = i + 1
	cmp r4,r0    @判断i与n大小关系
	bne .LOOP    @i<n时继续循环

.array:
	add fp,sp,#0 @fp指向sp
	sub sp,sp,#16 @准备16字节的空间，m[2][2]的空间位于sp到sp+12的位置
	mov r0,#1
	str r0,[sp]     @m[0][0] = 1
	mov r0,#2
	str r0,[sp,#4]  @m[0][1] = 2
	mov r0,#3
	str r0,[sp,#8]  @m[1][0] = 3
	mov r0,#4
	str r0,[sp,#12] @m[1][1] = 4
	
	mov r0,#4    @putarray()第一个参数
	mov r1,sp    @putarray()第二个参数
	bl putarray(PLT) @调用putarray()
	
	mov r0,#0    @return 0;
	add sp,sp,#16 @收回栈空间
	pop {fp,lr}
	bx lr

.end:
	pop {pc}

@桥接全局变量的地址
addr_a0:
	.word a
addr_b0:
	.word b
addr_i0:
	.word i
addr_t0:
	.word t
addr_n0:
	.word n
	.section .note.GNU-stack,"",%progbits  @ 标识 GNU 栈信息
