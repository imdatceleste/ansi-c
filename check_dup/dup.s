	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_has_dup_chars          ## -- Begin function has_dup_chars
	.p2align	4, 0x90
_has_dup_chars:                         ## @has_dup_chars
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	LBB0_2
## %bb.1:
	movb	$0, -1(%rbp)
	jmp	LBB0_10
LBB0_2:
	movq	-16(%rbp), %rdi
	callq	_strlen
	movl	%eax, %ecx
	movl	%ecx, -36(%rbp)
	cmpl	$255, -36(%rbp)
	jle	LBB0_4
## %bb.3:
	movb	$1, -1(%rbp)
	jmp	LBB0_10
LBB0_4:
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movslq	-36(%rbp), %rcx
	addq	%rcx, %rax
	movq	%rax, -32(%rbp)
LBB0_5:                                 ## =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jae	LBB0_9
## %bb.6:                               ##   in Loop: Header=BB0_5 Depth=1
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	-24(%rbp), %rcx
	movsbl	(%rcx), %esi
	movq	%rax, %rdi
	callq	_strchr
	cmpq	$0, %rax
	je	LBB0_8
## %bb.7:
	movb	$1, -1(%rbp)
	jmp	LBB0_10
LBB0_8:                                 ##   in Loop: Header=BB0_5 Depth=1
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	jmp	LBB0_5
LBB0_9:
	movb	$0, -1(%rbp)
LBB0_10:
	movzbl	-1(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leaq	L_.str(%rip), %rsi
	movq	%rsi, -24(%rbp)
	movq	-24(%rbp), %rdi
	callq	_has_dup_chars
	cmpb	$0, %al
	je	LBB1_2
## %bb.1:
	leaq	L_.str.1(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -28(%rbp)         ## 4-byte Spill
LBB1_2:
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Hello World!"

L_.str.1:                               ## @.str.1
	.asciz	"Duplicate\n"


.subsections_via_symbols
