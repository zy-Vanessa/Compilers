	.text
	.file	"sylib.c"
	.globl	getint                          # -- Begin function getint
	.p2align	4, 0x90
	.type	getint,@function
getint:                                 # @getint
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	leaq	.L.str(%rip), %rdi
	leaq	-4(%rbp), %rsi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	getint, .Lfunc_end0-getint
	.cfi_endproc
                                        # -- End function
	.globl	getch                           # -- Begin function getch
	.p2align	4, 0x90
	.type	getch,@function
getch:                                  # @getch
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	leaq	.L.str.1(%rip), %rdi
	leaq	-1(%rbp), %rsi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
	movsbl	-1(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	getch, .Lfunc_end1-getch
	.cfi_endproc
                                        # -- End function
	.globl	getfloat                        # -- Begin function getfloat
	.p2align	4, 0x90
	.type	getfloat,@function
getfloat:                               # @getfloat
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	leaq	.L.str.2(%rip), %rdi
	leaq	-4(%rbp), %rsi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
	movss	-4(%rbp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	getfloat, .Lfunc_end2-getfloat
	.cfi_endproc
                                        # -- End function
	.globl	getarray                        # -- Begin function getarray
	.p2align	4, 0x90
	.type	getarray,@function
getarray:                               # @getarray
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	leaq	.L.str(%rip), %rdi
	leaq	-12(%rbp), %rsi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
	movl	$0, -16(%rbp)
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB3_4
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	movq	-8(%rbp), %rsi
	movslq	-16(%rbp), %rax
	shlq	$2, %rax
	addq	%rax, %rsi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
# %bb.3:                                #   in Loop: Header=BB3_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB3_1
.LBB3_4:
	movl	-12(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	getarray, .Lfunc_end3-getarray
	.cfi_endproc
                                        # -- End function
	.globl	getfarray                       # -- Begin function getfarray
	.p2align	4, 0x90
	.type	getfarray,@function
getfarray:                              # @getfarray
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	leaq	.L.str(%rip), %rdi
	leaq	-12(%rbp), %rsi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
	movl	$0, -16(%rbp)
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB4_4
# %bb.2:                                #   in Loop: Header=BB4_1 Depth=1
	movq	-8(%rbp), %rsi
	movslq	-16(%rbp), %rax
	shlq	$2, %rax
	addq	%rax, %rsi
	leaq	.L.str.3(%rip), %rdi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
# %bb.3:                                #   in Loop: Header=BB4_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB4_1
.LBB4_4:
	movl	-12(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end4:
	.size	getfarray, .Lfunc_end4-getfarray
	.cfi_endproc
                                        # -- End function
	.globl	putint                          # -- Begin function putint
	.p2align	4, 0x90
	.type	putint,@function
putint:                                 # @putint
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %esi
	leaq	.L.str.4(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end5:
	.size	putint, .Lfunc_end5-putint
	.cfi_endproc
                                        # -- End function
	.globl	putch                           # -- Begin function putch
	.p2align	4, 0x90
	.type	putch,@function
putch:                                  # @putch
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %esi
	leaq	.L.str.1(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end6:
	.size	putch, .Lfunc_end6-putch
	.cfi_endproc
                                        # -- End function
	.globl	putarray                        # -- Begin function putarray
	.p2align	4, 0x90
	.type	putarray,@function
putarray:                               # @putarray
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	-4(%rbp), %esi
	leaq	.L.str.5(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	$0, -20(%rbp)
.LBB7_1:                                # =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB7_4
# %bb.2:                                #   in Loop: Header=BB7_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movl	(%rax,%rcx,4), %esi
	leaq	.L.str.6(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
# %bb.3:                                #   in Loop: Header=BB7_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB7_1
.LBB7_4:
	leaq	.L.str.7(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end7:
	.size	putarray, .Lfunc_end7-putarray
	.cfi_endproc
                                        # -- End function
	.globl	putfloat                        # -- Begin function putfloat
	.p2align	4, 0x90
	.type	putfloat,@function
putfloat:                               # @putfloat
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movss	%xmm0, -4(%rbp)
	movss	-4(%rbp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	leaq	.L.str.2(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end8:
	.size	putfloat, .Lfunc_end8-putfloat
	.cfi_endproc
                                        # -- End function
	.globl	putfarray                       # -- Begin function putfarray
	.p2align	4, 0x90
	.type	putfarray,@function
putfarray:                              # @putfarray
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	-4(%rbp), %esi
	leaq	.L.str.5(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	$0, -20(%rbp)
.LBB9_1:                                # =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB9_4
# %bb.2:                                #   in Loop: Header=BB9_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movss	(%rax,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	leaq	.L.str.8(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
# %bb.3:                                #   in Loop: Header=BB9_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB9_1
.LBB9_4:
	leaq	.L.str.7(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end9:
	.size	putfarray, .Lfunc_end9-putfarray
	.cfi_endproc
                                        # -- End function
	.globl	putf                            # -- Begin function putf
	.p2align	4, 0x90
	.type	putf,@function
putf:                                   # @putf
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$208, %rsp
	testb	%al, %al
	je	.LBB10_2
# %bb.1:
	movaps	%xmm0, -160(%rbp)
	movaps	%xmm1, -144(%rbp)
	movaps	%xmm2, -128(%rbp)
	movaps	%xmm3, -112(%rbp)
	movaps	%xmm4, -96(%rbp)
	movaps	%xmm5, -80(%rbp)
	movaps	%xmm6, -64(%rbp)
	movaps	%xmm7, -48(%rbp)
.LBB10_2:
	movq	%r9, -168(%rbp)
	movq	%r8, -176(%rbp)
	movq	%rcx, -184(%rbp)
	movq	%rdx, -192(%rbp)
	movq	%rsi, -200(%rbp)
	movq	%rdi, -8(%rbp)
	leaq	-208(%rbp), %rax
	movq	%rax, -16(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movl	$48, -28(%rbp)
	movl	$8, -32(%rbp)
	movq	stdout@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-8(%rbp), %rsi
	leaq	-32(%rbp), %rdx
	callq	vfprintf@PLT
	addq	$208, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end10:
	.size	putf, .Lfunc_end10-putf
	.cfi_endproc
                                        # -- End function
	.globl	before_main                     # -- Begin function before_main
	.p2align	4, 0x90
	.type	before_main,@function
before_main:                            # @before_main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$0, -4(%rbp)
.LBB11_1:                               # =>This Inner Loop Header: Depth=1
	cmpl	$1024, -4(%rbp)                 # imm = 0x400
	jge	.LBB11_4
# %bb.2:                                #   in Loop: Header=BB11_1 Depth=1
	movslq	-4(%rbp), %rcx
	leaq	_sysy_us(%rip), %rax
	movl	$0, (%rax,%rcx,4)
	movslq	-4(%rbp), %rcx
	leaq	_sysy_s(%rip), %rax
	movl	$0, (%rax,%rcx,4)
	movslq	-4(%rbp), %rcx
	leaq	_sysy_m(%rip), %rax
	movl	$0, (%rax,%rcx,4)
	movslq	-4(%rbp), %rcx
	leaq	_sysy_h(%rip), %rax
	movl	$0, (%rax,%rcx,4)
# %bb.3:                                #   in Loop: Header=BB11_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB11_1
.LBB11_4:
	movl	$1, _sysy_idx(%rip)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end11:
	.size	before_main, .Lfunc_end11-before_main
	.cfi_endproc
                                        # -- End function
	.globl	after_main                      # -- Begin function after_main
	.p2align	4, 0x90
	.type	after_main,@function
after_main:                             # @after_main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$1, -4(%rbp)
.LBB12_1:                               # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	_sysy_idx(%rip), %eax
	jge	.LBB12_4
# %bb.2:                                #   in Loop: Header=BB12_1 Depth=1
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movslq	-4(%rbp), %rcx
	leaq	_sysy_l1(%rip), %rax
	movl	(%rax,%rcx,4), %edx
	movslq	-4(%rbp), %rcx
	leaq	_sysy_l2(%rip), %rax
	movl	(%rax,%rcx,4), %ecx
	movslq	-4(%rbp), %rsi
	leaq	_sysy_h(%rip), %rax
	movl	(%rax,%rsi,4), %r8d
	movslq	-4(%rbp), %rsi
	leaq	_sysy_m(%rip), %rax
	movl	(%rax,%rsi,4), %r9d
	movslq	-4(%rbp), %rsi
	leaq	_sysy_s(%rip), %rax
	movl	(%rax,%rsi,4), %r10d
	movslq	-4(%rbp), %rsi
	leaq	_sysy_us(%rip), %rax
	movl	(%rax,%rsi,4), %eax
	leaq	.L.str.9(%rip), %rsi
	movl	%r10d, (%rsp)
	movl	%eax, 8(%rsp)
	movb	$0, %al
	callq	fprintf@PLT
	movslq	-4(%rbp), %rcx
	leaq	_sysy_us(%rip), %rax
	movl	(%rax,%rcx,4), %eax
	addl	_sysy_us(%rip), %eax
	movl	%eax, _sysy_us(%rip)
	movslq	-4(%rbp), %rcx
	leaq	_sysy_s(%rip), %rax
	movl	(%rax,%rcx,4), %eax
	addl	_sysy_s(%rip), %eax
	movl	%eax, _sysy_s(%rip)
	movl	_sysy_us(%rip), %eax
	movl	$1000000, %ecx                  # imm = 0xF4240
	cltd
	idivl	%ecx
	movl	%edx, _sysy_us(%rip)
	movslq	-4(%rbp), %rcx
	leaq	_sysy_m(%rip), %rax
	movl	(%rax,%rcx,4), %eax
	addl	_sysy_m(%rip), %eax
	movl	%eax, _sysy_m(%rip)
	movl	_sysy_s(%rip), %eax
	movl	$60, %ecx
	cltd
	idivl	%ecx
	movl	%edx, _sysy_s(%rip)
	movslq	-4(%rbp), %rcx
	leaq	_sysy_h(%rip), %rax
	movl	(%rax,%rcx,4), %eax
	addl	_sysy_h(%rip), %eax
	movl	%eax, _sysy_h(%rip)
	movl	_sysy_m(%rip), %eax
	movl	$60, %ecx
	cltd
	idivl	%ecx
	movl	%edx, _sysy_m(%rip)
# %bb.3:                                #   in Loop: Header=BB12_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB12_1
.LBB12_4:
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movl	_sysy_h(%rip), %edx
	movl	_sysy_m(%rip), %ecx
	movl	_sysy_s(%rip), %r8d
	movl	_sysy_us(%rip), %r9d
	leaq	.L.str.10(%rip), %rsi
	movb	$0, %al
	callq	fprintf@PLT
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end12:
	.size	after_main, .Lfunc_end12-after_main
	.cfi_endproc
                                        # -- End function
	.globl	_sysy_starttime                 # -- Begin function _sysy_starttime
	.p2align	4, 0x90
	.type	_sysy_starttime,@function
_sysy_starttime:                        # @_sysy_starttime
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %edx
	movslq	_sysy_idx(%rip), %rcx
	leaq	_sysy_l1(%rip), %rax
	movl	%edx, (%rax,%rcx,4)
	leaq	_sysy_start(%rip), %rdi
	xorl	%eax, %eax
	movl	%eax, %esi
	callq	gettimeofday@PLT
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end13:
	.size	_sysy_starttime, .Lfunc_end13-_sysy_starttime
	.cfi_endproc
                                        # -- End function
	.globl	_sysy_stoptime                  # -- Begin function _sysy_stoptime
	.p2align	4, 0x90
	.type	_sysy_stoptime,@function
_sysy_stoptime:                         # @_sysy_stoptime
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	leaq	_sysy_end(%rip), %rdi
	xorl	%eax, %eax
	movl	%eax, %esi
	callq	gettimeofday@PLT
	movl	-4(%rbp), %edx
	movslq	_sysy_idx(%rip), %rcx
	leaq	_sysy_l2(%rip), %rax
	movl	%edx, (%rax,%rcx,4)
	movq	_sysy_end(%rip), %rax
	subq	_sysy_start(%rip), %rax
	imulq	$1000000, %rax, %rdx            # imm = 0xF4240
	addq	_sysy_end+8(%rip), %rdx
	subq	_sysy_start+8(%rip), %rdx
	movslq	_sysy_idx(%rip), %rcx
	leaq	_sysy_us(%rip), %rax
	movslq	(%rax,%rcx,4), %rax
	addq	%rdx, %rax
	movl	%eax, %edx
	leaq	_sysy_us(%rip), %rax
	movl	%edx, (%rax,%rcx,4)
	movslq	_sysy_idx(%rip), %rcx
	leaq	_sysy_us(%rip), %rax
	movl	(%rax,%rcx,4), %eax
	movl	$1000000, %ecx                  # imm = 0xF4240
	cltd
	idivl	%ecx
	movl	%eax, %edx
	movslq	_sysy_idx(%rip), %rcx
	leaq	_sysy_s(%rip), %rax
	addl	(%rax,%rcx,4), %edx
	leaq	_sysy_s(%rip), %rax
	movl	%edx, (%rax,%rcx,4)
	movslq	_sysy_idx(%rip), %rcx
	leaq	_sysy_us(%rip), %rax
	movl	(%rax,%rcx,4), %eax
	movl	$1000000, %esi                  # imm = 0xF4240
	cltd
	idivl	%esi
	leaq	_sysy_us(%rip), %rax
	movl	%edx, (%rax,%rcx,4)
	movslq	_sysy_idx(%rip), %rcx
	leaq	_sysy_s(%rip), %rax
	movl	(%rax,%rcx,4), %eax
	movl	$60, %ecx
	cltd
	idivl	%ecx
	movl	%eax, %edx
	movslq	_sysy_idx(%rip), %rcx
	leaq	_sysy_m(%rip), %rax
	addl	(%rax,%rcx,4), %edx
	leaq	_sysy_m(%rip), %rax
	movl	%edx, (%rax,%rcx,4)
	movslq	_sysy_idx(%rip), %rcx
	leaq	_sysy_s(%rip), %rax
	movl	(%rax,%rcx,4), %eax
	movl	$60, %esi
	cltd
	idivl	%esi
	leaq	_sysy_s(%rip), %rax
	movl	%edx, (%rax,%rcx,4)
	movslq	_sysy_idx(%rip), %rcx
	leaq	_sysy_m(%rip), %rax
	movl	(%rax,%rcx,4), %eax
	movl	$60, %ecx
	cltd
	idivl	%ecx
	movl	%eax, %edx
	movslq	_sysy_idx(%rip), %rcx
	leaq	_sysy_h(%rip), %rax
	addl	(%rax,%rcx,4), %edx
	leaq	_sysy_h(%rip), %rax
	movl	%edx, (%rax,%rcx,4)
	movslq	_sysy_idx(%rip), %rcx
	leaq	_sysy_m(%rip), %rax
	movl	(%rax,%rcx,4), %eax
	movl	$60, %esi
	cltd
	idivl	%esi
	leaq	_sysy_m(%rip), %rax
	movl	%edx, (%rax,%rcx,4)
	movl	_sysy_idx(%rip), %eax
	addl	$1, %eax
	movl	%eax, _sysy_idx(%rip)
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end14:
	.size	_sysy_stoptime, .Lfunc_end14-_sysy_stoptime
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%c"
	.size	.L.str.1, 3

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"%f"
	.size	.L.str.2, 3

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"%a"
	.size	.L.str.3, 3

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"%d\n"
	.size	.L.str.4, 4

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"%d:"
	.size	.L.str.5, 4

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	" %d"
	.size	.L.str.6, 4

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"\n"
	.size	.L.str.7, 2

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	" %a"
	.size	.L.str.8, 4

	.type	_sysy_us,@object                # @_sysy_us
	.bss
	.globl	_sysy_us
	.p2align	4
_sysy_us:
	.zero	4096
	.size	_sysy_us, 4096

	.type	_sysy_s,@object                 # @_sysy_s
	.globl	_sysy_s
	.p2align	4
_sysy_s:
	.zero	4096
	.size	_sysy_s, 4096

	.type	_sysy_m,@object                 # @_sysy_m
	.globl	_sysy_m
	.p2align	4
_sysy_m:
	.zero	4096
	.size	_sysy_m, 4096

	.type	_sysy_h,@object                 # @_sysy_h
	.globl	_sysy_h
	.p2align	4
_sysy_h:
	.zero	4096
	.size	_sysy_h, 4096

	.type	_sysy_idx,@object               # @_sysy_idx
	.globl	_sysy_idx
	.p2align	2
_sysy_idx:
	.long	0                               # 0x0
	.size	_sysy_idx, 4

	.type	.L.str.9,@object                # @.str.9
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.9:
	.asciz	"Timer@%04d-%04d: %dH-%dM-%dS-%dus\n"
	.size	.L.str.9, 35

	.type	_sysy_l1,@object                # @_sysy_l1
	.bss
	.globl	_sysy_l1
	.p2align	4
_sysy_l1:
	.zero	4096
	.size	_sysy_l1, 4096

	.type	_sysy_l2,@object                # @_sysy_l2
	.globl	_sysy_l2
	.p2align	4
_sysy_l2:
	.zero	4096
	.size	_sysy_l2, 4096

	.type	.L.str.10,@object               # @.str.10
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.10:
	.asciz	"TOTAL: %dH-%dM-%dS-%dus\n"
	.size	.L.str.10, 25

	.type	_sysy_start,@object             # @_sysy_start
	.bss
	.globl	_sysy_start
	.p2align	3
_sysy_start:
	.zero	16
	.size	_sysy_start, 16

	.type	_sysy_end,@object               # @_sysy_end
	.globl	_sysy_end
	.p2align	3
_sysy_end:
	.zero	16
	.size	_sysy_end, 16

	.section	.init_array,"aw",@init_array
	.p2align	3
	.quad	before_main
	.section	.fini_array,"aw",@fini_array
	.p2align	3
	.quad	after_main
	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __isoc99_scanf
	.addrsig_sym printf
	.addrsig_sym vfprintf
	.addrsig_sym before_main
	.addrsig_sym after_main
	.addrsig_sym fprintf
	.addrsig_sym gettimeofday
	.addrsig_sym stdout
	.addrsig_sym _sysy_us
	.addrsig_sym _sysy_s
	.addrsig_sym _sysy_m
	.addrsig_sym _sysy_h
	.addrsig_sym _sysy_idx
	.addrsig_sym stderr
	.addrsig_sym _sysy_l1
	.addrsig_sym _sysy_l2
	.addrsig_sym _sysy_start
	.addrsig_sym _sysy_end
