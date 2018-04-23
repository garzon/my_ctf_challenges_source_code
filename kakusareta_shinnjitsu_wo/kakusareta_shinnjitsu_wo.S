	.file	"kakusareta_shinnjitsu_wo.cpp"
	.section	.data
	.type	_ZStL19piecewise_construct, @object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.globl	_ZN6SHA2568sha256_kE
	.align 32
	.type	_ZN6SHA2568sha256_kE, @object
	.size	_ZN6SHA2568sha256_kE, 256
_ZN6SHA2568sha256_kE:
	.long	1116352408
	.long	1899447441
	.long	-1245643825
	.long	-373957723
	.long	961987163
	.long	1508970993
	.long	-1841331548
	.long	-1424204075
	.long	-670586216
	.long	310598401
	.long	607225278
	.long	1426881987
	.long	1925078388
	.long	-2132889090
	.long	-1680079193
	.long	-1046744716
	.long	-459576895
	.long	-272742522
	.long	264347078
	.long	604807628
	.long	770255983
	.long	1249150122
	.long	1555081692
	.long	1996064986
	.long	-1740746414
	.long	-1473132947
	.long	-1341970488
	.long	-1084653625
	.long	-958395405
	.long	-710438585
	.long	113926993
	.long	338241895
	.long	666307205
	.long	773529912
	.long	1294757372
	.long	1396182291
	.long	1695183700
	.long	1986661051
	.long	-2117940946
	.long	-1838011259
	.long	-1564481375
	.long	-1474664885
	.long	-1035236496
	.long	-949202525
	.long	-778901479
	.long	-694614492
	.long	-200395387
	.long	275423344
	.long	430227734
	.long	506948616
	.long	659060556
	.long	883997877
	.long	958139571
	.long	1322822218
	.long	1537002063
	.long	1747873779
	.long	1955562222
	.long	2024104815
	.long	-2067236844
	.long	-1933114872
	.long	-1866530822
	.long	-1538233109
	.long	-1090935817
	.long	-965641998
	.text
	.align 2
	.globl	_ZN6SHA2569transformEPKhj
	.type	_ZN6SHA2569transformEPKhj, @function
_ZN6SHA2569transformEPKhj:
.LFB1383:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$368, %rsp
	movq	%rdi, -344(%rbp)
	movq	%rsi, -352(%rbp)
	movl	%edx, -356(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -328(%rbp)
.L13:
	movl	-356(%rbp), %eax
	cmpl	%eax, -328(%rbp)
	jge	.L15
	movl	-328(%rbp), %eax
	sall	$6, %eax
	movslq	%eax, %rdx
	movq	-352(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -312(%rbp)
	movl	$0, -324(%rbp)
.L4:
	cmpl	$15, -324(%rbp)
	jg	.L3
	movl	-324(%rbp), %eax
	sall	$2, %eax
	cltq
	leaq	3(%rax), %rdx
	movq	-312(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	-324(%rbp), %edx
	sall	$2, %edx
	movslq	%edx, %rdx
	leaq	2(%rdx), %rcx
	movq	-312(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rdx), %edx
	movzbl	%dl, %edx
	sall	$8, %edx
	orl	%eax, %edx
	movl	-324(%rbp), %eax
	sall	$2, %eax
	cltq
	leaq	1(%rax), %rcx
	movq	-312(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	sall	$16, %eax
	movl	%edx, %ecx
	orl	%eax, %ecx
	movl	-324(%rbp), %eax
	sall	$2, %eax
	movslq	%eax, %rdx
	movq	-312(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	sall	$24, %eax
	orl	%eax, %ecx
	movl	%ecx, %edx
	movl	-324(%rbp), %eax
	cltq
	movl	%edx, -272(%rbp,%rax,4)
	addl	$1, -324(%rbp)
	jmp	.L4
.L3:
	movl	$16, -324(%rbp)
.L6:
	cmpl	$63, -324(%rbp)
	jg	.L5
	movl	-324(%rbp), %eax
	subl	$2, %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	shrl	$17, %eax
	movl	%eax, %edx
	movl	-324(%rbp), %eax
	subl	$2, %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	sall	$15, %eax
	orl	%eax, %edx
	movl	-324(%rbp), %eax
	subl	$2, %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	shrl	$19, %eax
	movl	%eax, %ecx
	movl	-324(%rbp), %eax
	subl	$2, %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	sall	$13, %eax
	orl	%ecx, %eax
	xorl	%eax, %edx
	movl	-324(%rbp), %eax
	subl	$2, %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	shrl	$10, %eax
	xorl	%eax, %edx
	movl	-324(%rbp), %eax
	subl	$7, %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movl	-324(%rbp), %eax
	subl	$15, %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	shrl	$7, %eax
	movl	%eax, %ecx
	movl	-324(%rbp), %eax
	subl	$15, %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	sall	$25, %eax
	orl	%eax, %ecx
	movl	-324(%rbp), %eax
	subl	$15, %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	shrl	$18, %eax
	movl	%eax, %esi
	movl	-324(%rbp), %eax
	subl	$15, %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	sall	$14, %eax
	orl	%esi, %eax
	xorl	%eax, %ecx
	movl	-324(%rbp), %eax
	subl	$15, %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	shrl	$3, %eax
	xorl	%ecx, %eax
	addl	%eax, %edx
	movl	-324(%rbp), %eax
	subl	$16, %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movl	-324(%rbp), %eax
	cltq
	movl	%edx, -272(%rbp,%rax,4)
	addl	$1, -324(%rbp)
	jmp	.L6
.L5:
	movl	$0, -324(%rbp)
.L8:
	cmpl	$7, -324(%rbp)
	jg	.L7
	movq	-344(%rbp), %rax
	movl	-324(%rbp), %edx
	movslq	%edx, %rdx
	addq	$32, %rdx
	movl	8(%rax,%rdx,4), %edx
	movl	-324(%rbp), %eax
	cltq
	movl	%edx, -304(%rbp,%rax,4)
	addl	$1, -324(%rbp)
	jmp	.L8
.L7:
	movl	$0, -324(%rbp)
.L10:
	cmpl	$63, -324(%rbp)
	jg	.L9
	movl	-276(%rbp), %eax
	movl	-288(%rbp), %edx
	movl	%edx, %ecx
	shrl	$6, %ecx
	movl	-288(%rbp), %edx
	sall	$26, %edx
	orl	%edx, %ecx
	movl	-288(%rbp), %edx
	movl	%edx, %esi
	shrl	$11, %esi
	movl	-288(%rbp), %edx
	sall	$21, %edx
	orl	%esi, %edx
	xorl	%edx, %ecx
	movl	-288(%rbp), %edx
	movl	%edx, %esi
	shrl	$25, %esi
	movl	-288(%rbp), %edx
	sall	$7, %edx
	orl	%esi, %edx
	xorl	%ecx, %edx
	leal	(%rax,%rdx), %ecx
	movl	-288(%rbp), %edx
	movl	-284(%rbp), %eax
	andl	%eax, %edx
	movl	-288(%rbp), %eax
	notl	%eax
	movl	%eax, %esi
	movl	-280(%rbp), %eax
	andl	%esi, %eax
	xorl	%edx, %eax
	leal	(%rcx,%rax), %edx
	movl	-324(%rbp), %eax
	cltq
	movl	_ZN6SHA2568sha256_kE(,%rax,4), %eax
	addl	%eax, %edx
	movl	-324(%rbp), %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	addl	%edx, %eax
	movl	%eax, -320(%rbp)
	movl	-304(%rbp), %eax
	shrl	$2, %eax
	movl	%eax, %edx
	movl	-304(%rbp), %eax
	sall	$30, %eax
	orl	%eax, %edx
	movl	-304(%rbp), %eax
	shrl	$13, %eax
	movl	%eax, %ecx
	movl	-304(%rbp), %eax
	sall	$19, %eax
	orl	%ecx, %eax
	xorl	%eax, %edx
	movl	-304(%rbp), %eax
	shrl	$22, %eax
	movl	%eax, %ecx
	movl	-304(%rbp), %eax
	sall	$10, %eax
	orl	%ecx, %eax
	movl	%edx, %ecx
	xorl	%eax, %ecx
	movl	-304(%rbp), %edx
	movl	-300(%rbp), %eax
	movl	%edx, %esi
	andl	%eax, %esi
	movl	-304(%rbp), %edx
	movl	-296(%rbp), %eax
	andl	%edx, %eax
	xorl	%eax, %esi
	movl	-300(%rbp), %edx
	movl	-296(%rbp), %eax
	andl	%edx, %eax
	xorl	%esi, %eax
	addl	%ecx, %eax
	movl	%eax, -316(%rbp)
	movl	-280(%rbp), %eax
	movl	%eax, -276(%rbp)
	movl	-284(%rbp), %eax
	movl	%eax, -280(%rbp)
	movl	-288(%rbp), %eax
	movl	%eax, -284(%rbp)
	movl	-292(%rbp), %edx
	movl	-320(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -288(%rbp)
	movl	-296(%rbp), %eax
	movl	%eax, -292(%rbp)
	movl	-300(%rbp), %eax
	movl	%eax, -296(%rbp)
	movl	-304(%rbp), %eax
	movl	%eax, -300(%rbp)
	movl	-320(%rbp), %edx
	movl	-316(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -304(%rbp)
	addl	$1, -324(%rbp)
	jmp	.L10
.L9:
	movl	$0, -324(%rbp)
.L12:
	cmpl	$7, -324(%rbp)
	jg	.L11
	movq	-344(%rbp), %rax
	movl	-324(%rbp), %edx
	movslq	%edx, %rdx
	addq	$32, %rdx
	movl	8(%rax,%rdx,4), %edx
	movl	-324(%rbp), %eax
	cltq
	movl	-304(%rbp,%rax,4), %eax
	leal	(%rdx,%rax), %ecx
	movq	-344(%rbp), %rax
	movl	-324(%rbp), %edx
	movslq	%edx, %rdx
	addq	$32, %rdx
	movl	%ecx, 8(%rax,%rdx,4)
	addl	$1, -324(%rbp)
	jmp	.L12
.L11:
	addl	$1, -328(%rbp)
	jmp	.L13
.L15:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L14
	call	__stack_chk_fail
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1383:
	.size	_ZN6SHA2569transformEPKhj, .-_ZN6SHA2569transformEPKhj
	.align 2
	.globl	_ZN6SHA2564initEv
	.type	_ZN6SHA2564initEv, @function
_ZN6SHA2564initEv:
.LFB1384:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$1779033703, 136(%rax)
	movq	-8(%rbp), %rax
	movl	$-1150833019, 140(%rax)
	movq	-8(%rbp), %rax
	movl	$1013904242, 144(%rax)
	movq	-8(%rbp), %rax
	movl	$-1521486534, 148(%rax)
	movq	-8(%rbp), %rax
	movl	$1359893119, 152(%rax)
	movq	-8(%rbp), %rax
	movl	$-1694144372, 156(%rax)
	movq	-8(%rbp), %rax
	movl	$528734635, 160(%rax)
	movq	-8(%rbp), %rax
	movl	$1541459225, 164(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 4(%rax)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1384:
	.size	_ZN6SHA2564initEv, .-_ZN6SHA2564initEv
	.align 2
	.globl	_ZN6SHA2566updateEPKhj
	.type	_ZN6SHA2566updateEPKhj, @function
_ZN6SHA2566updateEPKhj:
.LFB1385:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movq	-40(%rbp), %rax
	movl	4(%rax), %eax
	movl	$64, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -24(%rbp)
	movl	-52(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jnb	.L18
	movl	-52(%rbp), %eax
	jmp	.L19
.L18:
	movl	-24(%rbp), %eax
.L19:
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %ecx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	leaq	8(%rax), %rcx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy
	movq	-40(%rbp), %rax
	movl	4(%rax), %edx
	movl	-52(%rbp), %eax
	addl	%edx, %eax
	cmpl	$63, %eax
	ja	.L20
	movq	-40(%rbp), %rax
	movl	4(%rax), %edx
	movl	-52(%rbp), %eax
	addl	%eax, %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	jmp	.L17
.L20:
	movl	-52(%rbp), %eax
	subl	-20(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	shrl	$6, %eax
	movl	%eax, -12(%rbp)
	movl	-20(%rbp), %edx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %rax
	leaq	8(%rax), %rcx
	movq	-40(%rbp), %rax
	movl	$1, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZN6SHA2569transformEPKhj
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZN6SHA2569transformEPKhj
	movl	-16(%rbp), %eax
	andl	$63, %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	-12(%rbp), %edx
	sall	$6, %edx
	movl	%edx, %ecx
	movq	-8(%rbp), %rdx
	leaq	(%rcx,%rdx), %rsi
	movq	-40(%rbp), %rdx
	leaq	8(%rdx), %rcx
	movq	%rax, %rdx
	movq	%rcx, %rdi
	call	memcpy
	movq	-40(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	movl	-12(%rbp), %edx
	addl	$1, %edx
	sall	$6, %edx
	addl	%eax, %edx
	movq	-40(%rbp), %rax
	movl	%edx, (%rax)
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1385:
	.size	_ZN6SHA2566updateEPKhj, .-_ZN6SHA2566updateEPKhj
	.align 2
	.globl	_ZN6SHA2565finalEPh
	.type	_ZN6SHA2565finalEPh, @function
_ZN6SHA2565finalEPh:
.LFB1386:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movl	4(%rax), %eax
	andl	$63, %eax
	cmpl	$55, %eax
	jbe	.L23
	movl	$2, %eax
	jmp	.L24
.L23:
	movl	$1, %eax
.L24:
	movl	%eax, -12(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	4(%rax), %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	%eax, -8(%rbp)
	movl	-12(%rbp), %eax
	sall	$6, %eax
	movl	%eax, -4(%rbp)
	movq	-24(%rbp), %rax
	movl	4(%rax), %eax
	movl	-4(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	-24(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, %eax
	addq	%rdx, %rax
	movq	%rcx, %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	movq	-24(%rbp), %rax
	movl	4(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, %edx
	movb	$-128, 8(%rax,%rdx)
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rdx
	movl	-4(%rbp), %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movb	%dl, (%rax)
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rdx
	movl	-4(%rbp), %eax
	subq	$2, %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	shrl	$8, %edx
	movb	%dl, (%rax)
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rdx
	movl	-4(%rbp), %eax
	subq	$3, %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	shrl	$16, %edx
	movb	%dl, (%rax)
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rdx
	movl	-4(%rbp), %eax
	subq	$4, %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	shrl	$24, %edx
	movb	%dl, (%rax)
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rcx
	movl	-12(%rbp), %edx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZN6SHA2569transformEPKhj
	movl	$0, -16(%rbp)
.L26:
	cmpl	$7, -16(%rbp)
	jg	.L27
	movl	-16(%rbp), %eax
	sall	$2, %eax
	cltq
	leaq	3(%rax), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movl	-16(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	$32, %rcx
	movl	8(%rax,%rcx,4), %eax
	movb	%al, (%rdx)
	movl	-16(%rbp), %eax
	sall	$2, %eax
	cltq
	leaq	2(%rax), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movl	-16(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	$32, %rcx
	movl	8(%rax,%rcx,4), %eax
	shrl	$8, %eax
	movb	%al, (%rdx)
	movl	-16(%rbp), %eax
	sall	$2, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movl	-16(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	$32, %rcx
	movl	8(%rax,%rcx,4), %eax
	shrl	$16, %eax
	movb	%al, (%rdx)
	movl	-16(%rbp), %eax
	sall	$2, %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movl	-16(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	$32, %rcx
	movl	8(%rax,%rcx,4), %eax
	shrl	$24, %eax
	movb	%al, (%rdx)
	addl	$1, -16(%rbp)
	jmp	.L26
.L27:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1386:
	.size	_ZN6SHA2565finalEPh, .-_ZN6SHA2565finalEPh
	.globl	_Z6sha256NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEb
	.type	_Z6sha256NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEb, @function
_Z6sha256NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEb:
.LFB1387:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA1387
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$280, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -264(%rbp)
	movq	%rsi, -272(%rbp)
	movl	%edx, %eax
	movb	%al, -276(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	leaq	-64(%rbp), %rax
	movl	$32, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	leaq	-240(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN6SHA2564initEv
	movq	-272(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6lengthEv
	movl	%eax, %ebx
	movq	-272(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv
	movq	%rax, %rcx
	leaq	-240(%rbp), %rax
	movl	%ebx, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZN6SHA2566updateEPKhj
	leaq	-64(%rbp), %rdx
	leaq	-240(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN6SHA2565finalEPh
	movb	$0, -32(%rbp)
	cmpb	$0, -276(%rbp)
	je	.L29
	movl	$0, -244(%rbp)
.L31:
	cmpl	$15, -244(%rbp)
	jg	.L29
	movl	$31, %eax
	subl	-244(%rbp), %eax
	cltq
	movzbl	-64(%rbp,%rax), %eax
	movb	%al, -245(%rbp)
	movl	$31, %eax
	subl	-244(%rbp), %eax
	movl	%eax, %ecx
	movl	-244(%rbp), %eax
	cltq
	movzbl	-64(%rbp,%rax), %edx
	movslq	%ecx, %rax
	movb	%dl, -64(%rbp,%rax)
	movl	-244(%rbp), %eax
	cltq
	movzbl	-245(%rbp), %edx
	movb	%dl, -64(%rbp,%rax)
	addl	$1, -244(%rbp)
	jmp	.L31
.L29:
	leaq	-246(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	leaq	-246(%rbp), %rdx
	leaq	-64(%rbp), %rsi
	movq	-264(%rbp), %rax
	movq	%rdx, %rcx
	movl	$32, %edx
	movq	%rax, %rdi
.LEHB0:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcmRKS3_
.LEHE0:
	leaq	-246(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	movq	-264(%rbp), %rax
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L34
	jmp	.L36
.L35:
	movq	%rax, %rbx
	leaq	-246(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB1:
	call	_Unwind_Resume
.LEHE1:
.L36:
	call	__stack_chk_fail
.L34:
	addq	$280, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1387:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA1387:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1387-.LLSDACSB1387
.LLSDACSB1387:
	.uleb128 .LEHB0-.LFB1387
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L35-.LFB1387
	.uleb128 0
	.uleb128 .LEHB1-.LFB1387
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE1387:
	.text
	.size	_Z6sha256NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEb, .-_Z6sha256NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEb
	.globl	ALPHABET
	.section	.data
	.align 8
.LC0:
	.string	"123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz0!@#$%^&*()[]{}:;<>?,./"
	.data
	.align 8
	.type	ALPHABET, @object
	.size	ALPHABET, 8
ALPHABET:
	.quad	.LC0
	.text
	.globl	_Z3m58PKhm
	.type	_Z3m58PKhm, @function
_Z3m58PKhm:
.LFB1388:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -12(%rbp)
	movq	$0, -8(%rbp)
.L39:
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jnb	.L38
	movl	-12(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	%eax, %ecx
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%eax, %ecx
	movl	$-1925330167, %edx
	movl	%ecx, %eax
	mull	%edx
	movl	%edx, %eax
	shrl	$5, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	imull	$58, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -12(%rbp)
	addq	$1, -8(%rbp)
	jmp	.L39
.L38:
	movl	-12(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1388:
	.size	_Z3m58PKhm, .-_Z3m58PKhm
	.globl	_Z3d58PKhPhm
	.type	_Z3d58PKhPhm, @function
_Z3d58PKhPhm:
.LFB1389:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	movl	$0, -16(%rbp)
	movq	$0, -8(%rbp)
.L46:
	movq	-8(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jnb	.L47
	movl	$7, -12(%rbp)
.L45:
	cmpl	$0, -12(%rbp)
	js	.L43
	movl	-16(%rbp), %eax
	leal	(%rax,%rax), %esi
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movl	-12(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	orl	%esi, %eax
	movl	%eax, -16(%rbp)
	cmpl	$57, -16(%rbp)
	jle	.L44
	subl	$58, -16(%rbp)
	movq	-32(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movq	-32(%rbp), %rcx
	movq	-8(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movl	%eax, %edi
	movl	-12(%rbp), %eax
	movl	$1, %esi
	movl	%eax, %ecx
	sall	%cl, %esi
	movl	%esi, %eax
	orl	%edi, %eax
	movb	%al, (%rdx)
.L44:
	subl	$1, -12(%rbp)
	jmp	.L45
.L43:
	addq	$1, -8(%rbp)
	jmp	.L46
.L47:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1389:
	.size	_Z3d58PKhPhm, .-_Z3d58PKhPhm
	.globl	_Z6isZeroPhm
	.type	_Z6isZeroPhm, @function
_Z6isZeroPhm:
.LFB1390:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
.L52:
	movl	-4(%rbp), %eax
	cltq
	cmpq	-32(%rbp), %rax
	jnb	.L49
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L50
	movl	$0, %eax
	jmp	.L51
.L50:
	addl	$1, -4(%rbp)
	jmp	.L52
.L49:
	movl	$1, %eax
.L51:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1390:
	.size	_Z6isZeroPhm, .-_Z6isZeroPhm
	.globl	_Z4b58ePKhmPc
	.type	_Z4b58ePKhmPc, @function
_Z4b58ePKhmPc:
.LFB1391:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$336, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -328(%rbp)
	movq	%rsi, -336(%rbp)
	movq	%rdx, -344(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	-336(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rdi
	call	_Znam
	movq	%rax, -304(%rbp)
	movq	-336(%rbp), %rdx
	movq	-328(%rbp), %rcx
	movq	-304(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy
	leaq	-240(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN6SHA2564initEv
	movq	-336(%rbp), %rax
	movl	%eax, %edx
	movq	-304(%rbp), %rcx
	leaq	-240(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZN6SHA2566updateEPKhj
	leaq	-64(%rbp), %rdx
	leaq	-240(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN6SHA2565finalEPh
	leaq	-240(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN6SHA2564initEv
	leaq	-64(%rbp), %rcx
	leaq	-240(%rbp), %rax
	movl	$32, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZN6SHA2566updateEPKhj
	leaq	-64(%rbp), %rdx
	leaq	-240(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN6SHA2565finalEPh
	movl	$0, -308(%rbp)
.L55:
	cmpl	$3, -308(%rbp)
	jg	.L54
	movq	-304(%rbp), %rdx
	movq	-336(%rbp), %rax
	addq	%rax, %rdx
	movl	-308(%rbp), %eax
	cltq
	movzbl	-64(%rbp,%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -308(%rbp)
	addq	$1, -336(%rbp)
	jmp	.L55
.L54:
	movq	$0, -296(%rbp)
.L57:
	movq	-296(%rbp), %rax
	cmpq	-336(%rbp), %rax
	jnb	.L56
	movq	-304(%rbp), %rdx
	movq	-296(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L56
	addq	$1, -296(%rbp)
	jmp	.L57
.L56:
	movq	$0, -288(%rbp)
	movl	$38, %edi
	call	_Znam
	movq	%rax, -280(%rbp)
.L59:
	movq	-336(%rbp), %rdx
	movq	-304(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_Z6isZeroPhm
	xorl	$1, %eax
	testb	%al, %al
	je	.L58
	movq	-288(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -288(%rbp)
	movq	-344(%rbp), %rdx
	leaq	(%rax,%rdx), %rbx
	movq	ALPHABET(%rip), %r12
	movq	-336(%rbp), %rdx
	movq	-304(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_Z3m58PKhm
	movzbl	%al, %eax
	addq	%r12, %rax
	movzbl	(%rax), %eax
	movb	%al, (%rbx)
	movq	-336(%rbp), %rdx
	movq	-280(%rbp), %rcx
	movq	-304(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_Z3d58PKhPhm
	movq	-280(%rbp), %rax
	movq	%rax, -248(%rbp)
	movq	-304(%rbp), %rax
	movq	%rax, -280(%rbp)
	movq	-248(%rbp), %rax
	movq	%rax, -304(%rbp)
	jmp	.L59
.L58:
	movq	$0, -272(%rbp)
.L61:
	movq	-272(%rbp), %rax
	cmpq	-296(%rbp), %rax
	jnb	.L60
	movq	-288(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -288(%rbp)
	movq	-344(%rbp), %rdx
	addq	%rax, %rdx
	movq	ALPHABET(%rip), %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addq	$1, -272(%rbp)
	jmp	.L61
.L60:
	movq	-344(%rbp), %rdx
	movq	-288(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	$0, -264(%rbp)
	movq	-288(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -256(%rbp)
.L63:
	movq	-264(%rbp), %rax
	cmpq	-256(%rbp), %rax
	jnb	.L62
	movq	-344(%rbp), %rdx
	movq	-264(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -309(%rbp)
	movq	-344(%rbp), %rdx
	movq	-264(%rbp), %rax
	addq	%rax, %rdx
	movq	-344(%rbp), %rcx
	movq	-256(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movq	-344(%rbp), %rdx
	movq	-256(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-309(%rbp), %eax
	movb	%al, (%rdx)
	addq	$1, -264(%rbp)
	subq	$1, -256(%rbp)
	jmp	.L63
.L62:
	cmpq	$0, -280(%rbp)
	je	.L64
	movq	-280(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdaPv
.L64:
	cmpq	$0, -304(%rbp)
	je	.L67
	movq	-304(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdaPv
.L67:
	nop
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L66
	call	__stack_chk_fail
.L66:
	addq	$336, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1391:
	.size	_Z4b58ePKhmPc, .-_Z4b58ePKhmPc
	.local	_ZL7counter
	.comm	_ZL7counter,4,4
	.section	.data
	.align 16
	.type	_ZL12secret_const, @object
	.size	_ZL12secret_const, 16
_ZL12secret_const:
	.long	-1869574000
	.long	-559038737
	.long	-889275714
	.long	518460215
	.globl	hashes
	.data
	.align 32
	.type	hashes, @object
	.size	hashes, 33
hashes:
	.string	"\304\b\222\370\2168?XW\311I9\223\005u\022!\303\247!\"ik\346\323\350\376\001 :\007\202"
	.globl	baddr
	.align 32
	.type	baddr, @object
	.size	baddr, 35
baddr:
	.string	"1DTj262z6UzhhwLFzL3C5fpTEMVQFPJ6iV"
	.globl	buf
	.bss
	.align 32
	.type	buf, @object
	.size	buf, 1024
buf:
	.zero	1024
	.globl	hexChars
	.section	.data
.LC1:
	.string	"0123456789abcdef"
	.data
	.align 8
	.type	hexChars, @object
	.size	hexChars, 8
hexChars:
	.quad	.LC1
	.section	.data
.LC2:
	.string	""
	.text
	.globl	_Z7hexdumpB5cxx11Phm
	.type	_Z7hexdumpB5cxx11Phm, @function
_Z7hexdumpB5cxx11Phm:
.LFB1394:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA1394
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	leaq	-25(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	leaq	-25(%rbp), %rdx
	movq	-40(%rbp), %rax
	movl	$.LC2, %esi
	movq	%rax, %rdi
.LEHB2:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_
.LEHE2:
	leaq	-25(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
.L70:
	movq	-56(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	%rdx, -56(%rbp)
	testq	%rax, %rax
	setne	%al
	testb	%al, %al
	je	.L77
	movq	hexChars(%rip), %rdx
	movq	-48(%rbp), %rax
	movzbl	(%rax), %eax
	shrb	$4, %al
	movzbl	%al, %eax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
.LEHB3:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLEc
	movq	hexChars(%rip), %rdx
	movq	-48(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	andl	$15, %eax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLEc
.LEHE3:
	addq	$1, -48(%rbp)
	jmp	.L70
.L75:
	movq	%rax, %rbx
	leaq	-25(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB4:
	call	_Unwind_Resume
.L76:
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume
.LEHE4:
.L77:
	nop
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L74
	call	__stack_chk_fail
.L74:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1394:
	.section	.gcc_except_table
.LLSDA1394:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1394-.LLSDACSB1394
.LLSDACSB1394:
	.uleb128 .LEHB2-.LFB1394
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L75-.LFB1394
	.uleb128 0
	.uleb128 .LEHB3-.LFB1394
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L76-.LFB1394
	.uleb128 0
	.uleb128 .LEHB4-.LFB1394
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
.LLSDACSE1394:
	.text
	.size	_Z7hexdumpB5cxx11Phm, .-_Z7hexdumpB5cxx11Phm
	.globl	__ZdaPv
	.type	__ZdaPv, @function
__ZdaPv:
.LFB1395:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
.L81:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movq	-24(%rbp), %rax
	movl	$-1869574000, (%rax)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	-4(%rbp), %eax
	je	.L83
	addq	$4, -24(%rbp)
	jmp	.L81
.L83:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1395:
	.size	__ZdaPv, .-__ZdaPv
	.globl	l
	.bss
	.align 4
	.type	l, @object
	.size	l, 4
l:
	.zero	4
	.section	.data
.LC3:
	.string	"root@localhost:/$ "
	.section	.bss._ZN7BitcoinC2Ev,"axG",@progbits,_ZN7BitcoinC5Ev,comdat
	.align 2
	.weak	_ZN7BitcoinC2Ev
	.type	_ZN7BitcoinC2Ev, @function
_ZN7BitcoinC2Ev:
.LFB1397:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	$_ZTV7Bitcoin+16, %edx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 24(%rax)
	movq	-8(%rbp), %rax
	movq	$.LC2, 32(%rax)
	movl	$-1869574000, %edx
	movq	-8(%rbp), %rax
	movl	%edx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$.L85, 24(%rax)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L86
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
#APP
# 329 "kakusareta_shinnjitsu_wo.cpp" 1
	movq %rax, %rax
# 0 "" 2
# 330 "kakusareta_shinnjitsu_wo.cpp" 1
	.word 0xe0ff
# 0 "" 2
#NO_APP
.L86:
	movl	$128, %edi
	call	_Znam
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 24(%rax)
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rsi
	movl	$_ZSt3cin, %edi
	call	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_PS3_
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	system
#APP
# 336 "kakusareta_shinnjitsu_wo.cpp" 1
	.align 4,0x90
# 0 "" 2
.L85:
# 338 "kakusareta_shinnjitsu_wo.cpp" 1
	leave;ret;
# 0 "" 2
# 339 "kakusareta_shinnjitsu_wo.cpp" 1
	.long 0xdeadda7a;.byte 0xf9;.byte 0xf3;.byte 0x75;.byte 0xfa;.byte 0x06;.byte 0x52;.byte 0x29;.byte 0x8f;.byte 0xc9;.byte 0x48;.byte 0x8b;.byte 0x38;.byte 0x57;.byte 0xc3;.byte 0x58;.byte 0x48;.byte 0x83;.byte 0x28;.byte 0x28;.byte 0x48;.byte 0x01;.byte 0xfb;.byte 0x5e;.byte 0x48;.byte 0x29;.byte 0x1f;.byte 0xc9;.byte 0xc9;.byte 0xc9;.byte 0x5b;.byte 0xc3;.byte 0xc9;.byte 0x48;.byte 0x29;.byte 0xfe;.byte 0x48;.byte 0x89;.byte 0x36;.byte 0xc3;.byte 0x48;.byte 0xc7;.byte 0xc3;.byte 0x1c;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x48;.byte 0x83;.byte 0xea;.byte 0x20;.byte 0x48;.byte 0x89;.byte 0x18;.byte 0x50;.byte 0xc3;.byte 0x48;.byte 0x01;.byte 0x16;.byte 0x59;.byte 0x48;.byte 0x8b;.byte 0x36;.byte 0x5f;.byte 0x52;.byte 0x5a;.byte 0x48;.byte 0x83;.byte 0x2f;.byte 0x1c;.byte 0x48;.byte 0xc7;.byte 0xc2;.byte 0x18;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x48;.byte 0x83;.byte 0xe9;.byte 0x24;.byte 0x48;.byte 0xc7;.byte 0xc7;.byte 0x24;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x52;.byte 0x48;.byte 0x89;.byte 0xd3;.byte 0xba;.byte 0x7e;.byte 0x5e;.byte 0xd9;.byte 0x53;.byte 0xc9;.byte 0x5a;.byte 0x5b;.byte 0x48;.byte 0x8b;.byte 0x18;.byte 0x48;.byte 0x89;.byte 0x18;.byte 0x50;.byte 0x48;.byte 0xc7;.byte 0xc6;.byte 0x14;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc9;.byte 0x48;.byte 0x89;.byte 0xc2;.byte 0x48;.byte 0x83;.byte 0xe8;.byte 0x28;.byte 0xc3;.byte 0x5f;.byte 0x48;.byte 0x01;.byte 0xf2;.byte 0x48;.byte 0x83;.byte 0xc2;.byte 0x18;.byte 0xc9;.byte 0xc9;.byte 0x58;.byte 0x53;.byte 0x48;.byte 0xc7;.byte 0x00;.byte 0x14;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x48;.byte 0x83;.byte 0xc7;.byte 0x10;.byte 0xb4;.byte 0x75;.byte 0x92;.byte 0xf6;.byte 0xc9;.byte 0x48;.byte 0x83;.byte 0xee;.byte 0x20;.byte 0x48;.byte 0xc7;.byte 0xc3;.byte 0x1c;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc3;.byte 0x5f;.byte 0x50;
# 0 "" 2
# 340 "kakusareta_shinnjitsu_wo.cpp" 1
	.align 4;.long 0x90909090;
# 0 "" 2
#NO_APP
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 24(%rax)
.L88:
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movl	(%rax), %edx
	movl	_ZL7counter(%rip), %eax
	cltq
	movl	_ZL12secret_const(,%rax,4), %eax
	cmpl	%eax, %edx
	je	.L87
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 24(%rax)
	jmp	.L88
.L87:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	24(%rdx), %rdx
	addq	$8, %rdx
	movq	%rdx, (%rax)
	movl	_ZL7counter(%rip), %eax
	cmpl	$2, %eax
	jne	.L89
	movl	$memcmp+2, %eax
	movl	(%rax), %eax
	movl	%eax, %edx
	movl	$memcmp, %eax
	addq	$6, %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 40(%rax)
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	_ZN7Bitcoin4thizE(%rip), %rax
	movq	40(%rax), %rax
	movq	buf+1016(%rip), %rdx
	movq	%rdx, (%rax)
.L89:
	movq	-8(%rbp), %rax
	movq	$.L85, 24(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1397:
	.size	_ZN7BitcoinC2Ev, .-_ZN7BitcoinC2Ev
	.weak	_ZN7BitcoinC1Ev
	.set	_ZN7BitcoinC1Ev,_ZN7BitcoinC2Ev
	.section	.text._ZN7BitcoinD2Ev,"axG",@progbits,_ZN7BitcoinD5Ev,comdat
	.align 2
	.weak	_ZN7BitcoinD2Ev
	.type	_ZN7BitcoinD2Ev, @function
_ZN7BitcoinD2Ev:
.LFB1400:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	$_ZTV7Bitcoin+16, %edx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L91
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L91
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rdi
	call	_ZdaPv
.L91:
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L93
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	__ZdaPv
.L93:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1400:
	.size	_ZN7BitcoinD2Ev, .-_ZN7BitcoinD2Ev
	.weak	_ZN7BitcoinD1Ev
	.set	_ZN7BitcoinD1Ev,_ZN7BitcoinD2Ev
	.section	.text._ZN7Bitcoin6verifyEPc,"axG",@progbits,_ZN7Bitcoin6verifyEPc,comdat
	.align 2
	.weak	_ZN7Bitcoin6verifyEPc
	.type	_ZN7Bitcoin6verifyEPc, @function
_ZN7Bitcoin6verifyEPc:
.LFB1402:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA1402
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$152, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -152(%rbp)
	movq	%rsi, -160(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	_ZL7counter(%rip), %eax
	cmpl	$1, %eax
	jne	.L95
	movq	-160(%rbp), %rax
	movl	(%rax), %ebx
	jmp	.L96
.L95:
	movl	_ZL7counter(%rip), %eax
	cmpl	$2, %eax
	jne	.L97
	leaq	-133(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	leaq	-133(%rbp), %rdx
	movq	-160(%rbp), %rcx
	leaq	-96(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB5:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_
.LEHE5:
	leaq	-64(%rbp), %rax
	leaq	-96(%rbp), %rcx
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB6:
	call	_Z6sha256NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEb
.LEHE6:
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv
	movl	$32, %edx
	movl	$hashes, %esi
	movq	%rax, %rdi
	call	memcmp
	testl	%eax, %eax
	jne	.L98
	movl	_ZL7counter(%rip), %eax
	cltq
	movl	_ZL12secret_const(,%rax,4), %eax
	jmp	.L99
.L98:
	movq	-152(%rbp), %rax
	movl	8(%rax), %eax
.L99:
	movl	%eax, %ebx
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-133(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	jmp	.L96
.L97:
	leaq	-133(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	leaq	-133(%rbp), %rdx
	movq	-160(%rbp), %rsi
	leaq	-128(%rbp), %rax
	movq	%rdx, %rcx
	movl	$80, %edx
	movq	%rax, %rdi
.LEHB7:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcmRKS3_
.LEHE7:
	leaq	-96(%rbp), %rax
	leaq	-128(%rbp), %rcx
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB8:
	call	_Z6sha256NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEb
.LEHE8:
	leaq	-64(%rbp), %rax
	leaq	-96(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB9:
	call	_Z6sha256NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEb
.LEHE9:
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv
	movl	$32, %edx
	movl	$hashes, %esi
	movq	%rax, %rdi
	call	memcmp
	testl	%eax, %eax
	jne	.L100
	movl	_ZL7counter(%rip), %eax
	cltq
	movl	_ZL12secret_const(,%rax,4), %eax
	jmp	.L101
.L100:
	movq	-152(%rbp), %rax
	movl	8(%rax), %eax
.L101:
	movl	%eax, -132(%rbp)
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-133(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	movl	-132(%rbp), %ebx
.L96:
	movl	%ebx, %eax
	movq	-24(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L107
	jmp	.L113
.L109:
	movq	%rax, %rbx
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L103
.L108:
	movq	%rax, %rbx
.L103:
	leaq	-133(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB10:
	call	_Unwind_Resume
.L112:
	movq	%rax, %rbx
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L105
.L111:
	movq	%rax, %rbx
.L105:
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L106
.L110:
	movq	%rax, %rbx
.L106:
	leaq	-133(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume
.LEHE10:
.L113:
	call	__stack_chk_fail
.L107:
	addq	$152, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1402:
	.section	.gcc_except_table
.LLSDA1402:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1402-.LLSDACSB1402
.LLSDACSB1402:
	.uleb128 .LEHB5-.LFB1402
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L108-.LFB1402
	.uleb128 0
	.uleb128 .LEHB6-.LFB1402
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L109-.LFB1402
	.uleb128 0
	.uleb128 .LEHB7-.LFB1402
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L110-.LFB1402
	.uleb128 0
	.uleb128 .LEHB8-.LFB1402
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L111-.LFB1402
	.uleb128 0
	.uleb128 .LEHB9-.LFB1402
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L112-.LFB1402
	.uleb128 0
	.uleb128 .LEHB10-.LFB1402
	.uleb128 .LEHE10-.LEHB10
	.uleb128 0
	.uleb128 0
.LLSDACSE1402:
	.section	.text._ZN7Bitcoin6verifyEPc,"axG",@progbits,_ZN7Bitcoin6verifyEPc,comdat
	.size	_ZN7Bitcoin6verifyEPc, .-_ZN7Bitcoin6verifyEPc
	.section	.text._ZN7Bitcoin4initEPc,"axG",@progbits,_ZN7Bitcoin4initEPc,comdat
	.align 2
	.weak	_ZN7Bitcoin4initEPc
	.type	_ZN7Bitcoin4initEPc, @function
_ZN7Bitcoin4initEPc:
.LFB1403:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA1403
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	addq	$-128, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -136(%rbp)
	movq	%rsi, -144(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	-136(%rbp), %rax
	movq	%rax, _ZN7Bitcoin4thizE(%rip)
	movq	-136(%rbp), %rax
	movq	-144(%rbp), %rdx
	movq	%rdx, 32(%rax)
.L115:
	movq	_ZN7Bitcoin4thizE(%rip), %rax
	movq	32(%rax), %rdx
	movq	_ZN7Bitcoin4thizE(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB11:
	call	_ZN7Bitcoin6verifyEPc
#APP
# 393 "kakusareta_shinnjitsu_wo.cpp" 1
	mov %rbp, %rsp;pop %rbp;ret;
# 0 "" 2
# 395 "kakusareta_shinnjitsu_wo.cpp" 1
	.long 0xdeadda7a;.byte 0xe1;.byte 0x86;.byte 0xc1;.byte 0x5f;.byte 0x28;.byte 0xbb;.byte 0x2b;.byte 0x93;.byte 0x2a;.byte 0xe3;.byte 0xba;.byte 0xf4;.byte 0x50;.byte 0xc3;.byte 0x48;.byte 0xc7;.byte 0x07;.byte 0x14;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x48;.byte 0xc7;.byte 0x06;.byte 0x18;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x48;.byte 0x89;.byte 0xca;.byte 0xc9;.byte 0x5b;.byte 0x53;.byte 0x58;.byte 0x48;.byte 0x89;.byte 0x0e;.byte 0xc9;.byte 0x5a;.byte 0x5a;.byte 0x80;.byte 0x2a;.byte 0x72;.byte 0xfe;.byte 0x48;.byte 0x01;.byte 0xf3;.byte 0xc3;.byte 0x59;.byte 0xc3;.byte 0x48;.byte 0xc7;.byte 0x07;.byte 0x24;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc3;.byte 0x61;.byte 0x8a;.byte 0x88;.byte 0xe1;.byte 0xfe;.byte 0x1a;.byte 0x12;.byte 0x92;.byte 0xc9;.byte 0x48;.byte 0x89;.byte 0xdb;.byte 0x48;.byte 0x83;.byte 0xc3;.byte 0x14;.byte 0x58;.byte 0x48;.byte 0xc7;.byte 0xc1;.byte 0x2c;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x48;.byte 0x89;.byte 0x16;.byte 0x53;.byte 0x48;.byte 0x83;.byte 0xee;.byte 0x14;.byte 0xc9;.byte 0x51;.byte 0x48;.byte 0xc7;.byte 0xc3;.byte 0x14;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc9;.byte 0x48;.byte 0xc7;.byte 0x06;.byte 0x24;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc9;.byte 0x48;.byte 0xc7;.byte 0xc6;.byte 0x2c;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc3;.byte 0x5a;.byte 0x5a;.byte 0x2b;.byte 0x2f;.byte 0x52;.byte 0xc3;.byte 0x58;.byte 0x48;.byte 0x2b;.byte 0x00;.byte 0xc9;.byte 0xc3;.byte 0x23;.byte 0x57;.byte 0x04;.byte 0xfc;.byte 0xc3;.byte 0x74;.byte 0xd3;.byte 0x05;.byte 0x78;.byte 0xc9;.byte 0x58;.byte 0x50;.byte 0x48;.byte 0x01;.byte 0xf8;.byte 0x48;.byte 0x2b;.byte 0x08;.byte 0x48;.byte 0x83;.byte 0xef;.byte 0x14;.byte 0x58;.byte 0x51;.byte 0x5a;.byte 0x56;.byte 0x59;.byte 0x48;.byte 0x29;.byte 0xca;.byte 0x9e;.byte 0xd9;.byte 0x74;.byte 0x22;.byte 0xc4;.byte 0x53;.byte 0xcb;.byte 0x93;.byte 0x48;.byte 0xc7;.byte 0xc6;.byte 0x10;.byte 0x00;.byte 0x00;.byte 0x00;
# 0 "" 2
# 397 "kakusareta_shinnjitsu_wo.cpp" 1
	.long 0xdeadbeef;.byte 0x7f;.byte 0xff;.byte 0x48;.byte 0x8b;
# 0 "" 2
# 399 "kakusareta_shinnjitsu_wo.cpp" 1
	movq %rdi, %rax
# 0 "" 2
#NO_APP
	movq	%rax, _ZN7Bitcoin4thizE(%rip)
	movq	_ZN7Bitcoin4thizE(%rip), %rax
#APP
# 400 "kakusareta_shinnjitsu_wo.cpp" 1
	movq %rsi, %rdx
# 0 "" 2
#NO_APP
	movq	%rdx, 32(%rax)
	movq	_ZN7Bitcoin4thizE(%rip), %rax
	movq	$.L116, 40(%rax)
	movl	$buf+1016, %eax
	movl	$.L117, %edx
	movq	%rdx, (%rax)
	movq	_ZN7Bitcoin4thizE(%rip), %rax
	movq	32(%rax), %rax
	movl	$buf, %edx
	movl	$21, %esi
	movq	%rax, %rdi
	call	_Z4b58ePKhmPc
	movl	$35, %edx
	movl	$baddr, %esi
	movl	$buf, %edi
	call	memcmp
	testl	%eax, %eax
	jne	.L118
#APP
# 407 "kakusareta_shinnjitsu_wo.cpp" 1
	mov $0xb9eda9ad, %eax; add $0x11111111, %eax
# 0 "" 2
# 408 "kakusareta_shinnjitsu_wo.cpp" 1
	pushq %rax
# 0 "" 2
# 414 "kakusareta_shinnjitsu_wo.cpp" 1
	popq %rax;ret
# 0 "" 2
# 416 "kakusareta_shinnjitsu_wo.cpp" 1
	.long 0xdeadda7a;.byte 0x76;.byte 0x5e;.byte 0x0f;.byte 0xb1;.byte 0x25;.byte 0xab;.byte 0x0f;.byte 0x2e;.byte 0x48;.byte 0x83;.byte 0xe8;.byte 0x2c;.byte 0x48;.byte 0x83;.byte 0x2e;.byte 0x14;.byte 0x48;.byte 0x01;.byte 0x16;.byte 0x59;.byte 0x5a;.byte 0xc3;.byte 0x48;.byte 0x83;.byte 0xc0;.byte 0x10;.byte 0x48;.byte 0xc7;.byte 0x00;.byte 0x20;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc3;.byte 0x52;.byte 0x48;.byte 0x01;.byte 0x17;.byte 0x5e;.byte 0x48;.byte 0x01;.byte 0xf6;.byte 0x48;.byte 0x83;.byte 0xe9;.byte 0x1c;.byte 0xc3;.byte 0x56;.byte 0xc9;.byte 0x48;.byte 0x83;.byte 0xc1;.byte 0x1c;.byte 0x56;.byte 0x5b;.byte 0xa4;.byte 0xb0;.byte 0x82;.byte 0x78;.byte 0x48;.byte 0x29;.byte 0x00;.byte 0xc9;.byte 0x48;.byte 0x29;.byte 0xc8;.byte 0xc3;.byte 0x52;.byte 0x50;.byte 0xc3;.byte 0x48;.byte 0x01;.byte 0x30;.byte 0x48;.byte 0xc7;.byte 0xc2;.byte 0x10;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc9;.byte 0x56;.byte 0x48;.byte 0x83;.byte 0xc2;.byte 0x14;.byte 0xc9;.byte 0x52;.byte 0x51;.byte 0xc3;.byte 0x48;.byte 0x01;.byte 0x00;.byte 0x48;.byte 0xc7;.byte 0x00;.byte 0x1c;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x56;.byte 0x59;.byte 0x48;.byte 0x83;.byte 0xc7;.byte 0x20;.byte 0xc3;.byte 0x5f;.byte 0x48;.byte 0x01;.byte 0x08;.byte 0xc3;.byte 0xc9;.byte 0x81;.byte 0x5b;.byte 0x98;.byte 0xa0;.byte 0x52;.byte 0xc3;.byte 0xc9;.byte 0x59;.byte 0xc9;.byte 0xc9;.byte 0xc3;.byte 0xc3;.byte 0x97;.byte 0xaa;.byte 0xae;.byte 0xf9;.byte 0x53;.byte 0x5f;.byte 0x57;.byte 0x48;.byte 0x89;.byte 0x30;.byte 0x70;.byte 0x06;.byte 0x1f;.byte 0xc3;.byte 0xc9;.byte 0x6c;.byte 0x1e;.byte 0x2d;.byte 0x70;
# 0 "" 2
# 419 "kakusareta_shinnjitsu_wo.cpp" 1
	.long 0xdeadbeef;.byte 0x7f;.byte 0xff;.byte 0x70;.byte 0x65;
# 0 "" 2
.L116:
# 421 "kakusareta_shinnjitsu_wo.cpp" 1
	pushq %rbp;movq %rsp, %rbp;subq 0x50, %rsp;
# 0 "" 2
# 422 "kakusareta_shinnjitsu_wo.cpp" 1
	movq %rdi, %rax
# 0 "" 2
#NO_APP
	movq	%rax, _ZN7Bitcoin4thizE(%rip)
	movq	_ZN7Bitcoin4thizE(%rip), %rax
#APP
# 423 "kakusareta_shinnjitsu_wo.cpp" 1
	movq %rsi, %rdx
# 0 "" 2
#NO_APP
	movq	%rdx, 32(%rax)
	movq	_ZN7Bitcoin4thizE(%rip), %rax
	movq	$0, 24(%rax)
	movl	$0, -112(%rbp)
	jmp	.L121
.L118:
#APP
# 411 "kakusareta_shinnjitsu_wo.cpp" 1
	push %rbp; mov %rsp, %rbp;sub $0x50,%rsp;
# 0 "" 2
#NO_APP
	jmp	.L115
.L121:
	cmpl	$31, -112(%rbp)
	jg	.L120
	movl	-112(%rbp), %eax
	cltq
	movzbl	hashes(%rax), %eax
	movl	%eax, %ecx
	movq	ALPHABET(%rip), %rdx
	movl	-112(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	xorl	%ecx, %eax
	movl	%eax, %edx
	movl	-112(%rbp), %eax
	cltq
	movb	%dl, hashes(%rax)
	addl	$1, -112(%rbp)
	jmp	.L121
.L120:
	movq	_ZN7Bitcoin4thizE(%rip), %rax
	movq	32(%rax), %rdx
	movq	_ZN7Bitcoin4thizE(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN7Bitcoin6verifyEPc
#APP
# 429 "kakusareta_shinnjitsu_wo.cpp" 1
	leave;ret;.byte 0x7f;.byte 0xff;
# 0 "" 2
# 431 "kakusareta_shinnjitsu_wo.cpp" 1
	.long 0xdeadda7a;.byte 0x42;.byte 0xae;.byte 0x5b;.byte 0xf0;.byte 0x82;.byte 0x59;.byte 0x9d;.byte 0xab;.byte 0x48;.byte 0x83;.byte 0x06;.byte 0x24;.byte 0x48;.byte 0x01;.byte 0xf3;.byte 0x48;.byte 0x01;.byte 0xf9;.byte 0xc3;.byte 0x5c;.byte 0xb4;.byte 0xbb;.byte 0x12;.byte 0xc9;.byte 0xc9;.byte 0xc3;.byte 0x48;.byte 0x03;.byte 0x3f;.byte 0xc9;.byte 0x48;.byte 0x29;.byte 0x17;.byte 0x56;.byte 0x48;.byte 0xc7;.byte 0xc0;.byte 0x28;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x51;.byte 0x48;.byte 0xc7;.byte 0x06;.byte 0x10;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x48;.byte 0x83;.byte 0xeb;.byte 0x2c;.byte 0x59;.byte 0x58;.byte 0x7d;.byte 0x73;.byte 0xb8;.byte 0xa0;.byte 0xc3;.byte 0xe5;.byte 0xec;.byte 0x28;.byte 0x4c;.byte 0x48;.byte 0x01;.byte 0xcf;.byte 0x59;.byte 0xc9;.byte 0x50;.byte 0x48;.byte 0xc7;.byte 0x07;.byte 0x14;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc9;.byte 0x48;.byte 0x83;.byte 0xea;.byte 0x14;.byte 0x48;.byte 0x83;.byte 0xea;.byte 0x1c;.byte 0xc9;.byte 0x51;.byte 0xc3;.byte 0x5e;.byte 0x48;.byte 0x83;.byte 0xc1;.byte 0x24;.byte 0x48;.byte 0x89;.byte 0xc7;.byte 0x48;.byte 0x8b;.byte 0x37;.byte 0x48;.byte 0x29;.byte 0xcb;.byte 0x72;.byte 0x17;.byte 0x44;.byte 0x77;.byte 0xc9;.byte 0x51;.byte 0xc9;.byte 0xc9;.byte 0x48;.byte 0x89;.byte 0xd2;.byte 0xc3;.byte 0x48;.byte 0xc7;.byte 0x00;.byte 0x28;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc3;.byte 0x48;.byte 0x01;.byte 0xc0;.byte 0xc9;.byte 0x48;.byte 0x83;.byte 0xc7;.byte 0x2c;.byte 0x84;.byte 0x0a;.byte 0xba;.byte 0x3f;.byte 0x5b;.byte 0x59;.byte 0x5b;.byte 0xc9;.byte 0x5f;.byte 0xf1;.byte 0x29;.byte 0x24;.byte 0xc3;.byte 0x5b;.byte 0x58;.byte 0x8d;.byte 0x4b;.byte 0xc8;.byte 0x58;.byte 0x48;.byte 0x83;.byte 0xc6;.byte 0x28;.byte 0x48;.byte 0x29;.byte 0xf7;.byte 0xc9;.byte 0x5e;.byte 0xff;.byte 0x84;.byte 0x49;.byte 0xf3;
# 0 "" 2
# 433 "kakusareta_shinnjitsu_wo.cpp" 1
	.long 0xcafebabe;.byte 0x7f;.byte 0xff;.byte 0x48;.byte 0x8b;
# 0 "" 2
# 435 "kakusareta_shinnjitsu_wo.cpp" 1
	movq %rdi, %rax
# 0 "" 2
#NO_APP
	movq	%rax, _ZN7Bitcoin4thizE(%rip)
	movq	_ZN7Bitcoin4thizE(%rip), %rax
#APP
# 436 "kakusareta_shinnjitsu_wo.cpp" 1
	movq %rsi, %rdx
# 0 "" 2
#NO_APP
	movq	%rdx, 32(%rax)
	movq	_ZN7Bitcoin4thizE(%rip), %rax
	movq	32(%rax), %rdx
	movq	_ZN7Bitcoin4thizE(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN7Bitcoin6verifyEPc
.LEHE11:
#APP
# 438 "kakusareta_shinnjitsu_wo.cpp" 1
	ret;.byte 0xff;.byte 0x48;
# 0 "" 2
# 440 "kakusareta_shinnjitsu_wo.cpp" 1
	.long 0xdeadda7a;.byte 0x28;.byte 0xa6;.byte 0x2c;.byte 0xca;.byte 0xc7;.byte 0xbd;.byte 0x30;.byte 0x5c;.byte 0x5f;.byte 0x48;.byte 0x89;.byte 0x37;.byte 0xc9;.byte 0x36;.byte 0xcf;.byte 0x6b;.byte 0x2b;.byte 0x48;.byte 0x83;.byte 0x00;.byte 0x14;.byte 0x48;.byte 0x89;.byte 0x00;.byte 0x48;.byte 0x89;.byte 0x17;.byte 0xc9;.byte 0xc9;.byte 0xc3;.byte 0x44;.byte 0x72;.byte 0xf9;.byte 0x69;.byte 0x53;.byte 0x48;.byte 0xc7;.byte 0xc0;.byte 0x14;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x51;.byte 0x2e;.byte 0x90;.byte 0xa4;.byte 0xa5;.byte 0xc9;.byte 0xc9;.byte 0xc9;.byte 0xf5;.byte 0x5e;.byte 0xdf;.byte 0x01;.byte 0x48;.byte 0x03;.byte 0x0f;.byte 0xc8;.byte 0x42;.byte 0xaf;.byte 0xdb;.byte 0x0f;.byte 0xaf;.byte 0x9d;.byte 0x31;.byte 0x48;.byte 0x01;.byte 0xc2;.byte 0xc3;.byte 0x5b;.byte 0x48;.byte 0x83;.byte 0x28;.byte 0x1c;.byte 0xc9;.byte 0x48;.byte 0x89;.byte 0x38;.byte 0xc3;.byte 0x48;.byte 0xc7;.byte 0xc0;.byte 0x2c;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xb8;.byte 0x08;.byte 0xb9;.byte 0xc6;.byte 0x48;.byte 0x01;.byte 0xce;.byte 0x5f;.byte 0xea;.byte 0xac;.byte 0x80;.byte 0x17;.byte 0xc3;.byte 0x52;.byte 0xc3;.byte 0x48;.byte 0x29;.byte 0x16;.byte 0x48;.byte 0x89;.byte 0xfb;.byte 0xc3;.byte 0xc3;.byte 0x5a;.byte 0x48;.byte 0xc7;.byte 0xc7;.byte 0x14;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc9;.byte 0x48;.byte 0x89;.byte 0xf7;.byte 0x48;.byte 0x83;.byte 0xe8;.byte 0x20;.byte 0x48;.byte 0x83;.byte 0xc0;.byte 0x14;.byte 0x48;.byte 0x8b;.byte 0x3e;.byte 0x48;.byte 0x89;.byte 0xf2;.byte 0x12;.byte 0x2e;.byte 0x60;.byte 0x98;.byte 0x5b;.byte 0x48;.byte 0xc7;.byte 0xc6;.byte 0x28;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0xc3;.byte 0x5e;.byte 0x48;.byte 0x83;.byte 0xe8;.byte 0x28;.byte 0x0c;.byte 0x70;.byte 0xb8;.byte 0x60;.byte 0xc9;.byte 0x48;.byte 0x29;.byte 0x08;.byte 0x48;.byte 0x83;.byte 0x2e;.byte 0x10;.byte 0x48;.byte 0x83;.byte 0xee;.byte 0x18;.byte 0x48;.byte 0x29;.byte 0xf2;.byte 0x5b;.byte 0x48;.byte 0x03;.byte 0x0f;.byte 0xc9;
# 0 "" 2
.L117:
# 444 "kakusareta_shinnjitsu_wo.cpp" 1
	push %rbp;mov %rsp, %rbp; sub $0x100, %rsp
# 0 "" 2
# 446 "kakusareta_shinnjitsu_wo.cpp" 1
	movq %rdx, %rax
# 0 "" 2
#NO_APP
	movq	%rax, -104(%rbp)
	movq	_ZN7Bitcoin4thizE(%rip), %rax
#APP
# 447 "kakusareta_shinnjitsu_wo.cpp" 1
	movq %rdi, %rdx
# 0 "" 2
#NO_APP
	movq	%rdx, 40(%rax)
	movq	_ZN7Bitcoin4thizE(%rip), %rax
#APP
# 448 "kakusareta_shinnjitsu_wo.cpp" 1
	movq %rsi, %rdx
# 0 "" 2
#NO_APP
	movq	%rdx, 48(%rax)
	movl	$0, -108(%rbp)
.L123:
	cmpl	$31, -108(%rbp)
	jg	.L122
	movq	_ZN7Bitcoin4thizE(%rip), %rax
	movq	48(%rax), %rdx
	movl	-108(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movl	%eax, %r12d
	movl	-108(%rbp), %eax
	movslq	%eax, %rbx
	leaq	-113(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	movl	$34, %esi
	leaq	-113(%rbp), %rdx
	leaq	-96(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movl	$baddr, %esi
	movq	%rax, %rdi
.LEHB12:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcmRKS3_
.LEHE12:
	leaq	-64(%rbp), %rax
	leaq	-96(%rbp), %rcx
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB13:
	call	_Z6sha256NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEb
.LEHE13:
	leaq	-64(%rbp), %rax
	movq	%rbx, %rsi
	movq	%rax, %rdi
.LEHB14:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEixEm
.LEHE14:
	movzbl	(%rax), %eax
	xorl	%r12d, %eax
	movl	%eax, %edx
	movl	-108(%rbp), %eax
	cltq
	movb	%dl, buf(%rax)
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-113(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	addl	$1, -108(%rbp)
	jmp	.L123
.L122:
	movq	_ZN7Bitcoin4thizE(%rip), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	movq	_ZN7Bitcoin4thizE(%rip), %rax
	movq	40(%rax), %rax
	movq	-104(%rbp), %rdx
	movl	$buf, %esi
	movq	%rax, %rdi
.LEHB15:
	call	*%rcx
#APP
# 456 "kakusareta_shinnjitsu_wo.cpp" 1
	push %rax
# 0 "" 2
# 458 "kakusareta_shinnjitsu_wo.cpp" 1
	pop %rax;add $0x100, %rsp;pop %rbp;ret;.long 0x1ee71337
# 0 "" 2
# 460 "kakusareta_shinnjitsu_wo.cpp" 1
	.long 0xdeadda7a;.byte 0xc6;.byte 0xeb;.byte 0x66;.byte 0x39;.byte 0xe7;.byte 0xb4;.byte 0x56;.byte 0x90;.byte 0x48;.byte 0x83;.byte 0x2f;.byte 0x2c;.byte 0x48;.byte 0x89;.byte 0x3f;.byte 0x50;.byte 0x51;.byte 0x48;.byte 0x03;.byte 0x18;.byte 0xc3;.byte 0x27;.byte 0x1d;.byte 0x26;.byte 0xf0;.byte 0x48;.byte 0x01;.byte 0x0f;.byte 0x48;.byte 0x83;.byte 0x06;.byte 0x28;.byte 0x48;.byte 0x01;.byte 0xc2;.byte 0x5b;.byte 0x48;.byte 0x83;.byte 0xc3;.byte 0x1c;.byte 0x48;.byte 0x83;.byte 0x2f;.byte 0x2c;.byte 0x5e;.byte 0x48;.byte 0xc7;.byte 0x07;.byte 0x20;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x48;.byte 0x83;.byte 0x07;.byte 0x20;.byte 0x4d;.byte 0x24;.byte 0x04;.byte 0xc0;.byte 0x58;.byte 0x48;.byte 0x83;.byte 0xeb;.byte 0x28;.byte 0x50;.byte 0xf2;.byte 0xa4;.byte 0x67;.byte 0x57;.byte 0x50;.byte 0x48;.byte 0x83;.byte 0xc7;.byte 0x24;.byte 0x59;.byte 0x48;.byte 0x83;.byte 0xc6;.byte 0x14;.byte 0x48;.byte 0x83;.byte 0xc3;.byte 0x1c;.byte 0xc3;.byte 0x18;.byte 0x6c;.byte 0x63;.byte 0xc3;.byte 0x5f;.byte 0x48;.byte 0x29;.byte 0xc8;.byte 0x57;.byte 0x48;.byte 0x01;.byte 0xce;.byte 0x71;.byte 0x56;.byte 0xae;.byte 0x8a;.byte 0xc9;.byte 0x51;.byte 0x48;.byte 0x89;.byte 0xfa;.byte 0x52;.byte 0x52;.byte 0x48;.byte 0x89;.byte 0xd6;.byte 0xc3;.byte 0x5b;.byte 0x34;.byte 0x5d;.byte 0xe1;.byte 0xe1;.byte 0xc9;.byte 0x48;.byte 0xc7;.byte 0xc7;.byte 0x2c;.byte 0x00;.byte 0x00;.byte 0x00;.byte 0x5b;.byte 0x50;.byte 0x5a;.byte 0xc9;.byte 0x48;.byte 0x89;.byte 0xc6;.byte 0x57;.byte 0xc9;.byte 0x48;.byte 0x8b;.byte 0x07;.byte 0xc9;.byte 0x5f;.byte 0x56;.byte 0x59;.byte 0xb2;.byte 0x91;.byte 0x2e;.byte 0x58;.byte 0xc3;.byte 0x57;.byte 0x48;.byte 0x8b;.byte 0x38;.byte 0x8e;.byte 0xa4;.byte 0x0d;.byte 0x58;.byte 0x48;.byte 0x83;.byte 0xef;.byte 0x14;.byte 0xc3;.byte 0x48;.byte 0x8b;.byte 0x36;
# 0 "" 2
#NO_APP
	movq	-24(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L127
	jmp	.L131
.L130:
	movq	%rax, %rbx
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L125
.L129:
	movq	%rax, %rbx
.L125:
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L126
.L128:
	movq	%rax, %rbx
.L126:
	leaq	-113(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume
.LEHE15:
.L131:
	call	__stack_chk_fail
.L127:
	subq	$-128, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1403:
	.section	.gcc_except_table
.LLSDA1403:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1403-.LLSDACSB1403
.LLSDACSB1403:
	.uleb128 .LEHB11-.LFB1403
	.uleb128 .LEHE11-.LEHB11
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB12-.LFB1403
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L128-.LFB1403
	.uleb128 0
	.uleb128 .LEHB13-.LFB1403
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L129-.LFB1403
	.uleb128 0
	.uleb128 .LEHB14-.LFB1403
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L130-.LFB1403
	.uleb128 0
	.uleb128 .LEHB15-.LFB1403
	.uleb128 .LEHE15-.LEHB15
	.uleb128 0
	.uleb128 0
.LLSDACSE1403:
	.section	.text._ZN7Bitcoin4initEPc,"axG",@progbits,_ZN7Bitcoin4initEPc,comdat
	.size	_ZN7Bitcoin4initEPc, .-_ZN7Bitcoin4initEPc
	.globl	_ZN7Bitcoin4thizE
	.bss
	.align 8
	.type	_ZN7Bitcoin4thizE, @object
	.size	_ZN7Bitcoin4thizE, 8
_ZN7Bitcoin4thizE:
	.zero	8
	.globl	sha256_obj
	.align 32
	.type	sha256_obj, @object
	.size	sha256_obj, 168
sha256_obj:
	.zero	168
	.text
	.globl	_Z10hex_decodePh
	.type	_Z10hex_decodePh, @function
_Z10hex_decodePh:
.LFB1404:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	shrq	%rax
	movl	%eax, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -12(%rbp)
.L142:
	movl	-12(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.L133
.L141:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	addl	%eax, %eax
	cmpl	-8(%rbp), %eax
	je	.L134
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$15, %al
	ja	.L135
	movl	$0, %eax
	jmp	.L136
.L135:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$57, %al
	jbe	.L137
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$63, %al
	ja	.L137
	movl	$0, %eax
	jmp	.L136
.L137:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jbe	.L138
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$102, %al
	ja	.L138
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rdx), %edx
	subl	$39, %edx
	movb	%dl, (%rax)
.L138:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$64, %al
	jbe	.L139
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$70, %al
	ja	.L139
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rdx), %edx
	subl	$7, %edx
	movb	%dl, (%rax)
.L139:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jbe	.L140
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$63, %al
	ja	.L140
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rdx), %edx
	subl	$48, %edx
	movb	%dl, (%rax)
	addl	$1, -8(%rbp)
	jmp	.L141
.L140:
	movl	$0, %eax
	jmp	.L136
.L134:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-2(%rdx), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rdx), %edx
	movl	%edx, %ecx
	sall	$4, %ecx
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	leaq	-1(%rdx), %rsi
	movq	-24(%rbp), %rdx
	addq	%rsi, %rdx
	movzbl	(%rdx), %edx
	addl	%ecx, %edx
	movb	%dl, (%rax)
	addl	$1, -12(%rbp)
	jmp	.L142
.L133:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movl	$1, %eax
.L136:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1404:
	.size	_Z10hex_decodePh, .-_Z10hex_decodePh
	.section	.data
.LC4:
	.string	"(%d)> "
.LC5:
	.string	"Error!"
.LC6:
	.string	"Wrong!"
.LC7:
	.string	"Correct!"
	.align 8
.LC8:
	.string	"Congratulations! All stages are clear."
	.text
	.globl	_Z7get_pwdv
	.type	_Z7get_pwdv, @function
_Z7get_pwdv:
.LFB1405:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	call	_ZN9SingletonI7BitcoinE11getInstanceEv
	movq	%rax, -24(%rbp)
	movl	$2048, %edi
	call	_Znam
	movq	%rax, -16(%rbp)
	movl	_ZL7counter(%rip), %eax
	addl	$1, %eax
	movl	%eax, _ZL7counter(%rip)
	movl	_ZL7counter(%rip), %eax
	movl	%eax, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt3cin, %edi
	call	_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_PS3_
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	shrq	%rax
	movl	%eax, l(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_Z10hex_decodePh
	xorl	$1, %eax
	testb	%al, %al
	je	.L144
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	jmp	.L145
.L144:
	movl	l(%rip), %eax
	movl	$80, %edx
	cmpl	$80, %eax
	cmovg	%edx, %eax
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$sha256_obj, %edi
	call	_ZN6SHA2566updateEPKhj
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	call	*%rax
	movl	%eax, %eax
	movq	%rax, -8(%rbp)
	movl	_ZL7counter(%rip), %eax
	cltq
	movl	_ZL12secret_const(,%rax,4), %eax
	movl	%eax, %eax
	cmpq	-8(%rbp), %rax
	je	.L146
	movl	$.LC6, %edi
	call	puts
	movl	$0, %eax
	jmp	.L145
.L146:
	movl	$.LC7, %edi
	call	puts
	movl	_ZL7counter(%rip), %eax
	cmpl	$3, %eax
	jne	.L147
	movl	$.LC8, %edi
	call	puts
.L147:
	call	_ZN9SingletonI7BitcoinE14deleteInstanceEv
	movl	$1, %eax
.L145:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1405:
	.size	_Z7get_pwdv, .-_Z7get_pwdv
	.section	.data
	.align 8
.LC9:
	.string	"##############\n#  CAUTIONS  #\n##############\nYour flag has been encrypted!\nTo unlock your flag you must send some bitcoins to this address: %s\nAfter that you can obtain a password and instructions to unlock your flag.\n"
	.align 8
.LC10:
	.string	"Please input your password here.\npassword"
	.align 8
.LC11:
	.string	"My friends, do you know bitcoin?\nbitcoin address"
	.align 8
.LC13:
	.string	"If you know what exactly '%s' is, I believe you must know the correct input corresponding to this.\nsecret"
.LC14:
	.string	"The final flag is DDCTF{"
.LC15:
	.string	"%x%x"
.LC16:
	.string	"} !"
.LC12:
	.string	""
	.string	"b\351\007\261\\\277'\325BS\231\353\366\360\373P\353\270\217\030"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1406:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	stdout(%rip), %rax
	movl	$0, %ecx
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setvbuf
	movl	$sha256_obj, %edi
	call	_ZN6SHA2564initEv
	movl	$baddr, %esi
	movl	$.LC9, %edi
	movl	$0, %eax
	call	printf
	movl	$.LC10, %edi
	movl	$0, %eax
	call	printf
	call	_Z7get_pwdv
	xorl	$1, %eax
	testb	%al, %al
	je	.L149
	movl	$2, %eax
	jmp	.L155
.L149:
	movl	$.LC11, %edi
	movl	$0, %eax
	call	printf
	call	_Z7get_pwdv
	xorl	$1, %eax
	testb	%al, %al
	je	.L151
	movl	$3, %eax
	jmp	.L155
.L151:
	movq	.LC12(%rip), %rax
	movq	%rax, -32(%rbp)
	movq	.LC12+8(%rip), %rax
	movq	%rax, -24(%rbp)
	movl	.LC12+16(%rip), %eax
	movl	%eax, -16(%rbp)
	movzwl	.LC12+20(%rip), %eax
	movw	%ax, -12(%rbp)
	movl	$21, %ecx
	leaq	-32(%rbp), %rax
	movl	$buf, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_Z4b58ePKhmPc
	movl	$buf, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	call	_Z7get_pwdv
	xorl	$1, %eax
	testb	%al, %al
	je	.L152
	movl	$4, %eax
	jmp	.L155
.L152:
	movl	$buf, %esi
	movl	$sha256_obj, %edi
	call	_ZN6SHA2565finalEPh
	movl	$.LC14, %edi
	movl	$0, %eax
	call	printf
	movl	$0, -36(%rbp)
.L154:
	cmpl	$31, -36(%rbp)
	jg	.L153
	movl	-36(%rbp), %eax
	cltq
	movzbl	buf(%rax), %eax
	movzbl	%al, %eax
	andl	$15, %eax
	movl	%eax, %edx
	movl	-36(%rbp), %eax
	cltq
	movzbl	buf(%rax), %eax
	shrb	$4, %al
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC15, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -36(%rbp)
	jmp	.L154
.L153:
	movl	$.LC16, %edi
	call	puts
	movl	$0, %eax
.L155:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L156
	call	__stack_chk_fail
.L156:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1406:
	.size	main, .-main
	.section	.text._ZN9SingletonI7BitcoinE11getInstanceEv,"axG",@progbits,_ZN9SingletonI7BitcoinE11getInstanceEv,comdat
	.weak	_ZN9SingletonI7BitcoinE11getInstanceEv
	.type	_ZN9SingletonI7BitcoinE11getInstanceEv, @function
_ZN9SingletonI7BitcoinE11getInstanceEv:
.LFB1478:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA1478
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	_ZN9SingletonI7BitcoinE8instanceE(%rip), %rax
	testq	%rax, %rax
	jne	.L158
	movl	$56, %edi
.LEHB16:
	call	_Znwm
.LEHE16:
	movq	%rax, %rbx
	movq	%rbx, %rdi
.LEHB17:
	call	_ZN7BitcoinC1Ev
.LEHE17:
	movq	%rbx, _ZN9SingletonI7BitcoinE8instanceE(%rip)
.L158:
	movq	_ZN9SingletonI7BitcoinE8instanceE(%rip), %rax
	jmp	.L162
.L161:
	movq	%rax, %r12
	movq	%rbx, %rdi
	call	_ZdlPv
	movq	%r12, %rax
	movq	%rax, %rdi
.LEHB18:
	call	_Unwind_Resume
.LEHE18:
.L162:
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1478:
	.section	.gcc_except_table
.LLSDA1478:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1478-.LLSDACSB1478
.LLSDACSB1478:
	.uleb128 .LEHB16-.LFB1478
	.uleb128 .LEHE16-.LEHB16
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB17-.LFB1478
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L161-.LFB1478
	.uleb128 0
	.uleb128 .LEHB18-.LFB1478
	.uleb128 .LEHE18-.LEHB18
	.uleb128 0
	.uleb128 0
.LLSDACSE1478:
	.section	.text._ZN9SingletonI7BitcoinE11getInstanceEv,"axG",@progbits,_ZN9SingletonI7BitcoinE11getInstanceEv,comdat
	.size	_ZN9SingletonI7BitcoinE11getInstanceEv, .-_ZN9SingletonI7BitcoinE11getInstanceEv
	.section	.text._ZN9SingletonI7BitcoinE14deleteInstanceEv,"axG",@progbits,_ZN9SingletonI7BitcoinE14deleteInstanceEv,comdat
	.weak	_ZN9SingletonI7BitcoinE14deleteInstanceEv
	.type	_ZN9SingletonI7BitcoinE14deleteInstanceEv, @function
_ZN9SingletonI7BitcoinE14deleteInstanceEv:
.LFB1479:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$8, %rsp
	.cfi_offset 3, -24
	movq	_ZN9SingletonI7BitcoinE8instanceE(%rip), %rax
	testq	%rax, %rax
	je	.L164
	movq	_ZN9SingletonI7BitcoinE8instanceE(%rip), %rbx
	testq	%rbx, %rbx
	je	.L164
	movq	%rbx, %rdi
	call	_ZN7BitcoinD1Ev
	movq	%rbx, %rdi
	call	_ZdlPv
.L164:
	movq	$0, _ZN9SingletonI7BitcoinE8instanceE(%rip)
	nop
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1479:
	.size	_ZN9SingletonI7BitcoinE14deleteInstanceEv, .-_ZN9SingletonI7BitcoinE14deleteInstanceEv
	.weak	_ZTV7Bitcoin
	.section	.data._ZTV7Bitcoin,"aG",@progbits,_ZTV7Bitcoin,comdat
	.align 8
	.type	_ZTV7Bitcoin, @object
	.size	_ZTV7Bitcoin, 24
_ZTV7Bitcoin:
	.quad	0
	.quad	_ZTI7Bitcoin
	.quad	_ZN7Bitcoin4initEPc
	.weak	_ZTI7Bitcoin
	.section	.data._ZTI7Bitcoin,"aG",@progbits,_ZTI7Bitcoin,comdat
	.align 8
	.type	_ZTI7Bitcoin, @object
	.size	_ZTI7Bitcoin, 16
_ZTI7Bitcoin:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTS7Bitcoin
	.weak	_ZTS7Bitcoin
	.section	.data._ZTS7Bitcoin,"aG",@progbits,_ZTS7Bitcoin,comdat
	.align 8
	.type	_ZTS7Bitcoin, @object
	.size	_ZTS7Bitcoin, 9
_ZTS7Bitcoin:
	.string	"7Bitcoin"
	.text
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB1606:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L167
	cmpl	$65535, -8(%rbp)
	jne	.L167
	movl	$_ZStL8__ioinit, %edi
	call	_ZNSt8ios_base4InitC1Ev
	movl	$__dso_handle, %edx
	movl	$_ZStL8__ioinit, %esi
	movl	$_ZNSt8ios_base4InitD1Ev, %edi
	call	__cxa_atexit
.L167:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1606:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.weak	_ZN9SingletonI7BitcoinE8instanceE
	.section	.bss._ZN9SingletonI7BitcoinE8instanceE,"awG",@nobits,_ZN9SingletonI7BitcoinE8instanceE,comdat
	.align 8
	.type	_ZN9SingletonI7BitcoinE8instanceE, @gnu_unique_object
	.size	_ZN9SingletonI7BitcoinE8instanceE, 8
_ZN9SingletonI7BitcoinE8instanceE:
	.zero	8
	.text
	.type	_GLOBAL__sub_I__ZN6SHA2568sha256_kE, @function
_GLOBAL__sub_I__ZN6SHA2568sha256_kE:
.LFB1607:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$65535, %esi
	movl	$1, %edi
	call	_Z41__static_initialization_and_destruction_0ii
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1607:
	.size	_GLOBAL__sub_I__ZN6SHA2568sha256_kE, .-_GLOBAL__sub_I__ZN6SHA2568sha256_kE
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__ZN6SHA2568sha256_kE
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
