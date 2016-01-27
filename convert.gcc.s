	.text
	.globl _g
_g:
LFB0:
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdi, %xmm1
	movl	%esi, %esi
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rsi, %xmm0
	addsd	%xmm0, %xmm1
	testq	%rdx, %rdx
	js	L4
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	jmp	L5
L4:
	movq	%rdx, %rax
	shrq	%rax
	andl	$1, %edx
	orq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	addsd	%xmm0, %xmm0
L5:
	addsd	%xmm1, %xmm0
	ret
LFE0:
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$0,LECIE1-LSCIE1
	.long L$set$0
LSCIE1:
	.long	0
	.byte	0x1
	.ascii "zR\0"
	.byte	0x1
	.byte	0x78
	.byte	0x10
	.byte	0x1
	.byte	0x10
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x90
	.byte	0x1
	.align 3
LECIE1:
LSFDE1:
	.set L$set$1,LEFDE1-LASFDE1
	.long L$set$1
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB0-.
	.set L$set$2,LFE0-LFB0
	.quad L$set$2
	.byte	0
	.align 3
LEFDE1:
	.subsections_via_symbols
