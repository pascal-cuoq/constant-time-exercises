	.section	__TEXT,__text,regular,pure_instructions
	.section	__TEXT,__const
	.align	4
LCPI0_0:
	.long	1127219200              ## 0x43300000
	.long	1160773632              ## 0x45300000
	.long	0                       ## 0x0
	.long	0                       ## 0x0
LCPI0_1:
	.quad	4841369599423283200     ## double 4.503600e+15
	.quad	4985484787499139072     ## double 1.934281e+25
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_g
	.align	4, 0x90
_g:                                     ## @g
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp2:
	.cfi_def_cfa_offset 16
Ltmp3:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp4:
	.cfi_def_cfa_register %rbp
	cvtsi2sdq	%rdi, %xmm1
	movl	%esi, %eax
	cvtsi2sdq	%rax, %xmm0
	movd	%rdx, %xmm2
	punpckldq	LCPI0_0(%rip), %xmm2 ## xmm2 = xmm2[0],mem[0],xmm2[1],mem[1]
	subpd	LCPI0_1(%rip), %xmm2
	haddpd	%xmm2, %xmm2
	addsd	%xmm1, %xmm0
	addsd	%xmm2, %xmm0
	popq	%rbp
	ret
	.cfi_endproc


.subsections_via_symbols
